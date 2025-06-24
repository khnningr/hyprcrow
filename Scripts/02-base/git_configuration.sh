#!/usr/bin/env bash

set -euo pipefail

sudo pacman -S --needed git

git config --global user.name <username>
git config --global user.email <email>
