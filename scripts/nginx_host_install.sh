#!/usr/bin/env bash
MYDIR=$(dirname "${BASH_SOURCE[0]}");

defaultPort='80';
port=${1:-$defaultPort};

defaultServer='default.loc';
server=${2:-$defaultServer};
