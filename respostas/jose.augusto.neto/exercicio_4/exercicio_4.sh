#!/bin/bash
# José Augusto Bezerra Neto - 116110917

echo "Entre com a senha: "
read -s PASSWORD

LEN_PASSWORD=${#PASSWORD}
LEN_MIN=8

if [ $LEN_PASSWORD -lt $LEN_MIN ]; then
	echo "Senha insegura! :( Ao menos 8 dígitos."

elif [[ ! $PASSWORD =~ [a-z] ]]; then
	echo "Senha insegura! :( Ao menos uma letra minúscula."

elif [[ ! $PASSWORD =~ [0-9] ]]; then
	echo "Senha insegura! :( Ao menos um número."

elif [[ ! $PASSWORD =~ [A-Z] ]]; then
	echo "Senha insegura! :( Ao menos uma letra maiúscula."

else
	echo "Senha segura! :)"

fi
