#!/bin/bash

read -p "Veuillez entrer l'adresse IP : " ipc
if ! [[ $ipc =~ ^([0-9]{1,3}\.){3}[0-9]{1,3}$ ]]; then
  echo "IP invalide, veuillez rentrer une IP valide "
  exit 1
fi

for octet in $(echo $ipc | tr '.' ' '); do
  if (( octet < 0 || octet > 255 )); then
    echo "IP invalide, veuillez rentrer une IP valide"
    exit 1
  fi
done
read -p "Veuillez entrer le port a tester : " port
if ! port > 0 
	exit 1
fi

if command -v timeout >/dev/null 2>´1; then
	timeout 5 bash -c "cat < /dev/tcp/$ipc/$port" >/dev/null 2>&1
	stat=$?
else
	bash -c "cat < /dev/tcp/$ipc/$port" >/dev/null 2>&1
	stat=$?
fi

echo "Envoie de la requête TCP ..."

if [ $stat -eq 0 ]; then
	echo "Le port $port set ouvert sur $ipc"
else
	echo "Le port $port est fermé sur $ipc"
fi

exit 0
