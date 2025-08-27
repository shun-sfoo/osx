#!/usr/bin/env bash
tmux_info="$(tmux ls 2>/dev/null)"

if [ "$tmux_info" = '' ]; then
  echo "no sessions"
fi
tmux_info="$(tmux ls 2>/dev/null)"
total_array=$(cut -d ':' -f 1 <<<"$tmux_info" | tr '\n' ',' | sed 's/^/[/; s/,$/]/; s/,/, /g')
attached=$(grep 'attached' <<<"$tmux_info" | cut -d ':' -f 1)
if [ -n "$attached" ]; then
  printf "tmux attached %s in %s" "$attached" "$total_array"
else
  printf "tmux sessions %s" "$total_array"
fi
