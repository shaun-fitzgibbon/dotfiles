#!/usr/bin/env bash

if [[ $# -gt 1 ]]; then
    printf 'Usage: %s [project-directory]\n' "$0" >&2
    exit 1
elif [[ $# -eq 1 ]]; then
    selected="$1"
else
    roots=()
    for group in airdosh aws fitzindustries personal other; do
        root="$HOME/projects/$group"
        [[ -d "$root" ]] && roots+=("$root")
    done
    if [[ ${#roots[@]} -eq 0 ]]; then
        printf 'No project directories found under %s/projects\n' "$HOME" >&2
        exit 1
    fi
    selected=$(find "${roots[@]}" -mindepth 1 -maxdepth 1 -type d | fzf) || exit 0
fi

if [[ -z "$selected" ]]; then
    exit 0
fi

if [[ ! -d "$selected" ]]; then
    printf 'Project directory does not exist: %s\n' "$selected" >&2
    exit 1
fi
selected=$(cd -- "$selected" && pwd) || exit 1

selected_name=$(basename "$selected" | tr '.:' '__')
case "$selected" in
    "$HOME/projects/airdosh/"*) selected_name="[airdosh]_$selected_name" ;;
    "$HOME/projects/aws/"*) selected_name="[aws]_$selected_name" ;;
    "$HOME/projects/fitzindustries/"*) selected_name="[fitzindustries]_$selected_name" ;;
    "$HOME/projects/personal/"*) selected_name="[personal]_$selected_name" ;;
    "$HOME/projects/other/"*) selected_name="[other]_$selected_name" ;;
esac

if ! tmux has-session -t "=$selected_name" 2>/dev/null; then
    tmux new-session -ds "$selected_name" -c "$selected" || exit 1
fi

if [[ -n "${TMUX:-}" ]]; then
    tmux switch-client -t "=$selected_name"
else
    exec tmux attach-session -t "=$selected_name"
fi
