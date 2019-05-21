#!/bin/bash
cp ./stable.sh ./stable.sh.bk
git checkout master
git submodule init
git submodule sync
git submodule update
git branch -D stable
git checkout -b stable
mv ./stable.sh.bk ./stable.sh
## merge PRs
hub merge https://github.com/DR08/mxnet/pull/5
## commit
git add stable.sh
git commit -m 'creation script'
git tag stable-$(date +%Y-%m-%d)
