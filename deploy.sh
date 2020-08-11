#!/usr/bin/env sh

yarn generate:gh-pages

cd dist

git init
git add -A
git commit -m 'deploy'

git push -f https://github.com/kungfuboy/mymy.git master:gh-pages

cd -