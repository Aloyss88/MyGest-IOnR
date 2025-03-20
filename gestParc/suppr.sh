#§/bin/bash

read -p "Indiquez l'ID de l'élément à supprimer : " id

requete="DELETE FROM Equipement WHERE id = $id"
sudo mysql MyGest -e "$requete"
echo " Les saisies ont été supprimées de la base de données "
