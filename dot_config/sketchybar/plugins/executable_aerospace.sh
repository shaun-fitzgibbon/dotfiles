#!/usr/bin/env bash

# Initial updates don't carry the workspace-change event's environment.
focused_workspace="${FOCUSED_WORKSPACE:-}"
if [ -z "$focused_workspace" ]; then
    focused_workspace="$(aerospace list-workspaces --focused)" || exit 1
fi

if [ "$1" = "$focused_workspace" ]; then
    sketchybar --set "$NAME" background.drawing=on
else
    sketchybar --set "$NAME" background.drawing=off
fi
