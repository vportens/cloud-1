#!/bin/bash

# Arrête et supprime tous les conteneurs et services définis dans le fichier docker-compose.yml
docker-compose down

# Supprime tous les volumes qui ne sont pas utilisés
docker volume prune -f

# Si vous voulez vraiment supprimer tous les volumes, même ceux qui sont utilisés, utilisez cette commande à la place :
# docker volume rm $(docker volume ls -q)