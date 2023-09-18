#!/bin/bash

# Chemin par défaut du fichier .env
DEFAULT_ENV_PATH="$(dirname "$0")/.env"

# Si un argument est fourni, utilisez-le comme chemin. Sinon, utilisez le chemin par défaut.
ENV_PATH=${1:-$DEFAULT_ENV_PATH}

# Vérifie si le fichier fourni existe
if [ ! -f "$ENV_PATH" ]; then
    echo "Error: $ENV_PATH does not exist."
    exit 1
fi

# Exporte les variables d'environnement depuis le fichier choisi
export $(grep -v '^#' $ENV_PATH | xargs)

# Lance docker-compose
docker-compose up -d

# Optionnel : si vous voulez le lancer en arrière-plan, utilisez `docker-compose up -d`
