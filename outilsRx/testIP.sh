#!/bin/bash

echo "Veuillez entrer l'adresse IP à tester : "
read ip

if ! [[ $ip =~ ^([0-9]{1,3}\.){3}[0-9]{1,3}$ ]]; then
  echo "IP invalide, veuillez rentrer une IP valide "
  exit 1
else
	ping -c 5 $ip > /dev/null
fi

if [ $? -eq 0 ]; then
	echo "L'adresse IP $ip est active et répond aux pings"
else
	echo "L'adresse IP $ip ne répond pas aux pings"
fi