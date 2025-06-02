#!/usr/bin/env bash

set -euo pipefail

. ./list_arch.sh

sudo pacman -S --needed --noconfirm "${pkg_thunar[@]}"
