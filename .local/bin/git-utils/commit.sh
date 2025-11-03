#!/usr/bin/env bash

source login.sh

REPOSITORIO=$1

if [[ -z $(git status --porcelain) ]]; then
	echo "No hay cambios en $REPOSITORIO, omitiendo commit"
	exit 0
fi

git add .

COMMIT=$(gum input --placeholder "Mensaje del commit" --prompt "Commit> ")

if [[ -z "$COMMIT" ]]; then
	COMMIT=$(date +"%Y/%m/%d a las %I:%M %p")
fi

if [[ -n "$COMMIT" ]]; then
	git commit -a -m "$COMMIT"
	
else
	echo "× Commit cancelado para $REPOSITORIO"
fi
