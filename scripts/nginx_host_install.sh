#!/usr/bin/env bash
MYDIR=$(dirname "${BASH_SOURCE[0]}");
NGINX_SITE_ENABLED='/usr/local/etc/nginx/servers';

server=${1:-'default.loc'};
port=${2:-'80'};

if [[ ! $3 ]]; then
    installationDir=$PWD'/'${server};
    entry_point=${installationDir}"/public";
fi

if [[ ! -d $PWD/nginx ]]; then
    mkdir $PWD/nginx;
fi

NGINX_F=$PWD/nginx/${server};

if [[ ! -d ${NGINX_F} ]]; then
    mkdir ${NGINX_F};
fi

access_log=${4:-$NGINX_F};
errors_log=${5:-$NGINX_F};

cp $MYDIR/../patterns/nginx/nginx_default.conf.example   ${NGINX_F}/${server}.conf     \
    && sed -i '' "s|__PORT__|$port|g"                    ${NGINX_F}/${server}.conf \
    && sed -i '' "s|__DOMEN__|$server|g"                 ${NGINX_F}/${server}.conf \
    && sed -i '' "s|__ENTRY_POINT_PATH__|$entry_point|g" ${NGINX_F}/${server}.conf \
    && sed -i '' "s|__ACCESS_LOG_PATH__|$access_log|g"   ${NGINX_F}/${server}.conf \
    && sed -i '' "s|__ERRORS_LOG_PATH__|$errors_log|g"   ${NGINX_F}/${server}.conf \
    && ln -sfn ${NGINX_F}/${server}.conf ${NGINX_SITE_ENABLED}/${server}.conf             \
;
echo "You should add new site into '/etc/hosts' manually, or just run command bellow : \n";
#echo "127.0.0.1:${port} ${server}"  |   sudo tee -a /etc/hosts
echo '>>> echo 127.0.0.1:'${port} ${server}'|sudo tee -a /etc/hosts';