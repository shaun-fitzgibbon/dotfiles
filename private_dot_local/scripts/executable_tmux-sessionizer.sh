#!/usr/bin/env bash

if [[ $# -eq 1 ]]; then
    echo $1
    selected=$1
else
    selected=$(find ~/projects/airdosh ~/projects/aws ~/projects/fitzindustries ~/projects/personal ~/projects/other -mindepth 1 -maxdepth 1 -type d | fzf)
fi

if [[ -z $selected ]]; then
    exit 0
fi

echo $selected

case $selected in
  *"/projects/airdosh"*)
    selected_name=[airdosh]_$(basename "airdosh__$selected" | tr . _) ;;
  *"/projects/aws"*)
    selected_name=[aws]_$(basename "aws__$selected" | tr . _) ;;
  *"/projects/fitzindustries"*)
    selected_name=[fitzindustries]_$(basename "fitzindustries__$selected" | tr . _) ;;
  *"/projects/personal"*)
    selected_name=[personal]_$(basename "$selected" | tr . _) ;;
  *"/projects/other"*)
    selected_name=[other]_$(basename "templates__$selected" | tr . _) ;;
esac

echo $selected_name
tmux_running=$(pgrep tmux)

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    tmux new-session -s $selected_name -c $selected
    exit 0
fi

if ! tmux has-session -t=$selected_name 2> /dev/null; then
    tmux new-session -ds $selected_name -c $selected
fi

tmux switch-client -t $selected_name
