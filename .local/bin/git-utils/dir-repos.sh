#!/usr/bin/env bash

set -euo pipefail

DIR_REPOS=(
	"${HOME}/hyprcrow/"
	"${HOME}/Wallpapers/"
	"${HOME}/kh-home"
)

REPOS=(
	"hyprcrow"
	"Wallpapers"
	"kh-home"
)

declare -A repositorios=(
	["hyprcrow"]="${HOME}/hyprcrow/"
	["Wallpapers"]="${HOME}/Wallpapers/"
	["kh-home"]="${HOME}/kh-home"
)

