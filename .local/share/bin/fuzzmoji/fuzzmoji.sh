#!/usr/bin/env bash

selection=$(fuzzel --dmenu --log-level=none --prompt="Emoji > " < ./emoji-list)

if [ -n "$selection" ]; then
    # Retreive the Emoji from the selection string
    emoji=$(printf "%s" "$selection" | cut -d ':' -f 1 | tr -d '\n')

    if command -v wl-copy $>/dev/null; then
        wl-copy $emoji
        notify-send "Fuzzmoji" "${emoji} Copied!"
        exit 0
    fi

    # If failed to copy, output Emoji to Stdout
    printf ${emoji}
fi

exit 0
