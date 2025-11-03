#!/usr/bin/env bash

set -euo pipefail

source login.sh
source dir-repos.sh

for dir in "${REPOS[@]}"; do
	if [[ ! -d "${dir}" ]]; then
		git clone https://github.com/khnningr/"${dir}".git
	fi
done
