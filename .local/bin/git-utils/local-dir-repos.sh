#!/usr/bin/env bash

set -euo pipefail

source login.sh
source dir-repos.sh

for i in "${!repositorios[@]}"; do
	if [[ ! -d "${repositorios[$i]}" ]]; then
		echo "$i ${repositorios[$i]}"
		git clone https://github.com/khnningr/"${i}".git "${repositorios[$i]}"
	fi
	#echo "$i ${repositorios[$i]}"
done

#if [[ ! -d "${dir}" ]]; then
#git clone https://github.com/khnningr/"${repo}".git "${dir}"
#fi
