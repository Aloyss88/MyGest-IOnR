#!/bin/bash

read -p "nom :" nom
read -p "Adresse MAC : " adMac
if ! [[ "$adMac" =~ ^([0-9]{1,2}([-:])){5}[0-9]{1,2}$ ]]; then
  echo "Erreur : format MAC invalide. Exemple correct : 12:34:56:78:90:99 ou 12-34-56-78-90-99."
  exit 1
fi
##############################################
read -p "Adresse IP : " adIp
if ! [[ $adIp =~ ^([0-9]{1,3}\.){3}[0-9]{1,3}$ ]]; then
  echo "IP invalide, veuillez rentrer une IP valide "
  exit 1
fi

for octet in $(echo $adIp | tr '.' ' '); do
  if (( octet < 0 || octet > 255 )); then
    echo "IP invalide, veuillez rentrer une IP valide"
    exit 1
  fi
done
##############################################
read -p "Masque (CIDR) : " CIDR
if ! [[ "$CIDR" =~ ^[0-9]+$ ]] || [ "$CIDR" -lt 0 ] || [ "$CIDR" -gt 32 ]; 
then
  echo "Le masque doit être un nombre entre 0 et 32."
  exit 1
fi
##############################################
read -p "Type (1: machine, 2: switch, 3: serveur) : " type
if [[ "$type" != "1" && "$type" != "2" && "$type" != "3" ]]; then
  echo "Type invalide, veuillez choisir 1, 2 ou 3."
  exit 1
fi
##############################################
echo "Récapitulatif de la requête : "
requete="INSERT INTO Equipement (nom, adMac, adIp, CIDR, idT) VALUES ('$nom', '$adMac', '$adIp', '$CIDR', '$type');"

sudo mysql MyGest -e "$requete"
echo "Les saisies ont été intégrées à la base de données"
