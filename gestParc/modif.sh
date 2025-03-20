#!/bin/bash

read -p " Veuillez indiquer l'id de l'élement à modifier : " id
read -p " Nouveau Nom : " nom

read -p " Nouvelle Adresse MAC : " adMac
if ! [[ "$adMac" =~ ^([0-9]{1,2}([-:])){5}[0-9]{1,2}$ ]]; then
  echo "Erreur : format MAC invalide. Exemple correct : 12:34:56:78:90:99 ou 12-34-56-78-90-99."
  exit 1
fi
######################################################
read -p " Nouvelle Adresse IP : " adIp
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
######################################################
read -p " Nouveau Masque : " CIDR
if ! [[ "$CIDR" =~ ^[0-9]+$ ]] || [ "$CIDR" -lt 0 ] || [ "$CIDR" -gt 32 ]; 
then
  echo "Le masque doit être un nombre entre 0 et 32."
  exit 1
fi
######################################################
read -p " Type de la Machine (machine = 1, switch = 2, serveur = 3) : " idT
if [[ "$type" != "1" && "$type" != "2" && "$type" != "3" ]]; then
  echo "Erreur : type invalide. Veuillez choisir 1, 2 ou 3."
  exit 1
fi


requete=" UPDATE Equipement SET nom = '$nom', adMac = '$adMac', adIp = '$adIp', CIDR = '$CIDR', idT = '$idT' WHERE id = '$id' ;"
sudo mysql MyGest -e "$requete"

echo "Les données ont été modifiées dans la base de données"
