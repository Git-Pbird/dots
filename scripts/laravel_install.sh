#!/usr/bin/env bash
source $DOTDIR/.aliases;
requestFromDir=$PWD;

#    ${  foo  <-- from variable foo
#        ##   <-- greedy front trim
#        *    <-- matches anything
#        :    <-- until the last ':'
#    }

#    string="1;2"
#    echo $string | cut -d';' -f1 # output is 1
#    echo $string | cut -d';' -f2 # output is 2

domain=${1:-'default.loc'};
appName=${2:-'app name'};

## Using `project` only as variable for docker-compose container's
project=$(echo ${domain} | cut -d'.' -f1);
installationDir=${requestFromDir}'/'${domain};

echo 'installing project `'${appName}'` into `'${installationDir}'`\r\n';
composer create-project --prefer-dist laravel/laravel ${domain}                         \
    && cp ~/repo/www/dots/patterns/docker-compose/docker-compose.yml ${installationDir} \
    && sed -i '' 's|_container_name|_'${project}'|g' ${domain}/docker-compose.yml       \
;
echo $( newSite ${domain});
