MyGest-IOnR - Gestion du parc informatique

MyGest est un script en langage Bash permettant la gestion d'un parc informatique
via une base de données MySQL. Le projet est divisé en 3 parties dont :
- La gestion du parc informatique
- La gestion des outils réseaux 
- Une section d'installation

## Prérequis 
- Debian 10 ou supérieur
- Une installation de MySQL

1) Gestion du Parc Informatique

Cette section facilite la gestion des équipements du parc informatique à l’aide d'une base de données. Elle offre la possibilité de consulter, ajouter, modifier et supprimer des éléments, simplifiant ainsi le travail des techniciens.

    Consulter : Accès rapide aux données de la base.
    Ajouter : Ajout de nouveaux équipements dans la base de données.
    Supprimer : Suppression des équipements de la base.
    Modifier : Mise à jour des informations des équipements déja présent.

2) Outils Réseaux

Cette section regroupe divers outils permettant d’effectuer des tests et des vérifications réseaux.

    TestIP : Vérifie la validité d’une adresse IP et effectue un test de ping pour évaluer sa connectivité.
    TestTCP : Détermine si un port spécifique est ouvert sur une adresse IP donnée.
    Exportation des données : Génère un fichier .txt à partir des informations de la base de données.
    Consultation des IP actives : Teste les adresses IP enregistrées et affiche les machines actives en vert, les inactives en rouge.

3) Installation

Lors du premier lancement du programme, cette section automatise les configurations essentielles pour assurer un fonctionnement optimal, que ce soit sur un poste client ou un serveur.


1) Consulter ()

Ce script Bash permet d'afficher différents types d'équipements enregistrés dans la base de données. L'utilisateur peut choisir parmi les options suivantes :

    Afficher tous les équipements.
    Afficher uniquement les machines.
    Afficher uniquement les switchs.
    Afficher uniquement les serveurs.

En fonction du choix de l'utilisateur, le script exécute une requête MySQL pour récupérer les données correspondantes. Si une entrée invalide est détectée, un message d'erreur s'affiche.
2) Ajouter ()

Ce script permet d'ajouter de nouveaux équipements réseau à la base de données en guidant l'utilisateur à travers la saisie des informations suivantes :

    Nom de l'équipement.
    Adresse MAC.
    Adresse IP.
    Masque CIDR.
    Type d’équipement (Machine, Switch, Serveur).

Avant l’insertion dans la base de données, le script effectue une vérification de la validité des données saisies pour éviter toute erreur.

3) Supprimer ()

Ce script permet de supprimer un équipement du parc informatique en toute sécurité. L'utilisateur doit fournir l'un des critères suivants pour identifier l’équipement à supprimer :

    Nom de l’équipement.
    Adresse MAC.
    Adresse IP.

Avant de procéder à la suppression, le script demande une confirmation pour éviter toute suppression accidentelle.
4) Modifier ()

Ce script permet de modifier les informations d’un équipement déjà enregistré dans la base de données. L'utilisateur peut :

    Rechercher un équipement via son nom, adresse MAC ou adresse IP.
    Modifier des champs spécifiques tels que :
        Le nom de l’équipement.
        L’adresse MAC.
        L’adresse IP.
        Le masque CIDR.
        Le type d’équipement (Machine, Switch, Serveur).

Le script garantit que les nouvelles valeurs saisies sont valides avant de mettre à jour la base de données.

5) TestIP ()

Ce script permet de tester la validité d'une adresse IP et d’évaluer sa connectivité à l'aide d'un ping. Il suit les étapes suivantes :

    Vérifie si l’adresse IP saisie est valide.
    Exécute un test de ping pour déterminer si l'adresse est accessible.

6) TestTCP ()

Ce script permet de vérifier si un port spécifique est ouvert ou fermé sur une adresse IP donnée. L'utilisateur entre :

    L’adresse IP à tester.
    Le numéro du port à analyser.