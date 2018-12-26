#!/usr/bin/env bash
MYDIR=$(dirname "${BASH_SOURCE[0]}");
NGINX_SITE_ENABLED='/usr/local/etc/nginx/servers';

server=${1:-'default.loc'};
port=${2:-'80'};
entry_point=${3:-'public'};

if [[ ! -d $PWD/nginx ]]; then
    mkdir $PWD/nginx;
fi

NGINX_F=$PWD/nginx/${server};

if [[ ! -d ${NGINX_F} ]]; then
    mkdir ${NGINX_F};
fi

access_log=${4:-$NGINX_F};
errors_log=${5:-$NGINX_F};

cp $MYDIR/../patterns/nginx/nginx_default.conf.example  ${NGINX_F}/${server}.conf     \
    && sed -i '' "s|__PORT__|$port|g"                    "$MYDIR/../$server.conf" \
    && sed -i '' "s|__DOMEN__|$server|g"                 "$MYDIR/../$server.conf" \
    && sed -i '' "s|__ENTRY_POINT_PATH__|$entry_point|g" "$MYDIR/../$server.conf" \
    && sed -i '' "s|__ACCESS_LOG_PATH__|$access_log|g"   "$MYDIR/../$server.conf" \
    && sed -i '' "s|__ERRORS_LOG_PATH__|$errors_log|g"   "$MYDIR/../$server.conf" \
    && ln -sfn ${NGINX_F}/${server}.conf ${NGINX_SITE_ENABLED}/${server}.conf             \
;