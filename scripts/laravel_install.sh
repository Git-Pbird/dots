#!/usr/bin/env bash

defaultProject='default';
defaultAppName='default Application';
project=${1:-$defaultProject};
AppName=${2:-$defaultAppName};

requestFromDir=$PWD;
installationDir=$PWD'/'$project;
echo 'installing project `'$AppName'` into `'$installationDir'`\r\n';
composer create-project --prefer-dist laravel/laravel $project \
    && cp ~/repo/www/dots/patterns/docker-compose/docker-compose.yml $installationDir \
    && sed -i '' 's/_container_name/_'$project'/g' $project/docker-compose.yml