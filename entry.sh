#!/bin/bash

[[ $1 == '' ]] && echo 'Usage: docker run ... image git://url_to_git_repo_of_tm.recolic.net_gitrepo' && exit 1

git_="$1"
mkdir -p ./keys ./log &&
    git clone "$git_" src &&
    touch ./keys/keys.list &&
    ln -s $(pwd)/keys/keys.list ./src/keys.list &&
    cd /app/src &&
    unbuffer python3 ./daemon.py 80 >> ../log/tm.log 2>&1

exit $?


