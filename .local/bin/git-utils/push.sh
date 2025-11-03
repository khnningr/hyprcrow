#!/usr/bin/env bash

source login.sh

if [[ -z $(git status --porcelain) ]]; then
	echo -e "Verifica que haya algún archivo que subir."
	return 1
fi

if [ "$(git symbolic-ref --short HEAD)" = "main" ]; then
	git push -u origin main
	echo "$REPOSITORIO actualizado correctamente."
fi
