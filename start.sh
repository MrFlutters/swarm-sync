#! /bin/sh

echo "LOADING SECRETS..."
source ./env_secrets_expand.sh

echo "START THE APP..."
yarn run start:dist
