#!/bin/bash

mkdir -p ./keys ./log &&
    [[ -e ./keys/keys.list ]] || touch ./keys/keys.list &&
    [[ -e ./src/keys.list ]] || ln -s $(pwd)/keys/keys.list ./src/keys.list &&
    cd /app/src &&
    unbuffer python3 ./daemon.py 80 >> ../log/tm.log 2>&1

exit $?


