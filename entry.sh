#!/bin/bash

[[ $1 == '' ]] && echo 'Usage: docker run ... image git://url_to_git_repo_of_tm.recolic.net_gitrepo' && exit 1

git_="$1"
mkdir -p ./keys ./log &&
    touch ./keys/keys.list &&
    ln -s ./keys/keys.list ./src/keys.list &&
    git clone "$git_" src &&
    unbuffer python3 src/daemon.py >> ./log/tm.log 2>&1

exit $?



