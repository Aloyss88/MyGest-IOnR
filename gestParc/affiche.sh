#!/bin/bash


echo "1) Machines "
echo "2) Switchs "
echo "3) Serveurs "
echo "4) TOUTES LES INFORMATIONS "
echo "0) Quitter " 
read choix

if [[ choix -eq 0 ]]
then	
	exit 0
elif [[ choix -eq 1 ]]
then
	sudo mysql MyGest -e "SELECT * FROM Equipement WHERE id = 1"; 
elif [[ choix -eq 2 ]]
then
	sudo mysql MyGest -e "SELECT * FROM Equipement WHERE id = 2";
elif [[ choix -eq 3 ]]
then
	sudo mysql MyGest -e "SELECT * FROM Equipement WHERE id = 3";
elif [[ choix -eq 4 ]]
then
	sudo mysql MyGest -e "SELECT * FROM Equipement";
else
	echo "Erreur, veuillez entrer une option valide."
fi