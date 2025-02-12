#!/bin/bash

wezterm start -name 'floating wezterm' -e 'fzf $* < /proc/$$/fd/0 > /proc/$$/fd/1'