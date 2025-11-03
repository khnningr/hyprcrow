#!/usr/bin/env bash

source login.sh

if [ "$(git symbolic-ref --short HEAD)" = "main" ]; then
	git push -u origin main
	echo "$REPOSITORIO actualizado correctamente."
fi
