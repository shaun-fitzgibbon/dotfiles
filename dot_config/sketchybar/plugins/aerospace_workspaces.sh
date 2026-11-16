#!/usr/bin/env bash

# Query first so a failed AeroSpace connection never clears the buttons.
workspaces="$(aerospace list-workspaces --monitor all)" || exit 1
existing="$(sketchybar --query bar | /usr/bin/python3 -c '
import json, sys
for item in json.load(sys.stdin)["items"]:
    if item.startswith("space."):
        print(item[6:])
')" || exit 1

contains_line() {
    printf '%s\n' "$1" | /usr/bin/grep -Fxq -- "$2"
}

plugin_dir="$(cd "$(dirname "$0")" && pwd)"
args=()
order=()

while IFS= read -r sid; do
    [ -n "$sid" ] || continue
    order+=("space.$sid")
    if ! contains_line "$existing" "$sid"; then
        if [ -z "${focused_workspace:-}" ]; then
            focused_workspace="$(aerospace list-workspaces --focused)" || exit 1
        fi
        background=off
        [ "$sid" = "$focused_workspace" ] && background=on
        printf -v click_script 'aerospace workspace %q' "$sid"
        printf -v highlight_script '%q %q' "$plugin_dir/aerospace.sh" "$sid"
        args+=(--add item "space.$sid" left
            --subscribe "space.$sid" aerospace_workspace_change
            --set "space.$sid"
            background.color=0x44ffffff
            background.corner_radius=5
            background.height=20
            "background.drawing=$background"
            icon.drawing=off
            label="$sid"
            "click_script=$click_script"
            "script=$highlight_script")
    fi
done <<< "$workspaces"

while IFS= read -r sid; do
    [ -n "$sid" ] || continue
    if ! contains_line "$workspaces" "$sid"; then
        args+=(--remove "space.$sid")
    fi
done <<< "$existing"

if [ "${#args[@]}" -gt 0 ]; then
    if [ "${#order[@]}" -gt 0 ]; then
        args+=(--reorder "${order[@]}")
    fi
    sketchybar "${args[@]}"
fi
