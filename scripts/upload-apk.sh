#!/bin/sh

git config --global user.name "Github Actions"
git config --global user.email "no-reply@gactions.com"

git clone --quiet --branch=apk https://kaustubhakalucifer:$PAT@github.com/kaustubhakalucifer/flutter_TMDB apk > /dev/null
cd apk
find ../build/app/outputs/apk/release/ -type f -name '*.apk' -exec cp -v {} . \;

git checkout --orphan temporary

git add --all .
git commit -am "[Auto] Update Apk ($(date +%Y-%m-%d.%H:%M:%S))"

git branch -D apk
git branch -m apk

git push origin apk --force --quiet > /dev/null