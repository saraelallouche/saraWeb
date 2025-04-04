#!/usr/bin/env bash
# Arrêter en cas d'erreur
set -o errexit
pip install -r requirements.txt

cd base

# Installer les dépendances Python

# Construire Tailwind (si nécessaire)
python manage.py tailwind build || echo "Tailwind build failed, continuing..."

# Collecter les fichiers statiques
python manage.py collectstatic --no-input

# Appliquer les migrations
python manage.py migrate

cd ..

