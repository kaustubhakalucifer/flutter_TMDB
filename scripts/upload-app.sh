#!/bin/bash

git config --global user.name "Kaustubh Solanki"
git config --global user.email "kaustubhsolanki98@gmail.com"

git clone https://kaustubhakalucifer:$PAT@github.com/kaustubhakalucifer/AndroidAppReleases
cd AndroidAppReleases

rm -rf ${GITHUB_REPOSITORY#*/}*

find ../build/app/outputs/apk/release/ -type f -name '*.apk' -exec cp -v {} . \;

git checkout --orphan temporary

for file in app*; do
    mv $file ${GITHUB_REPOSITORY#*/}-${file#*-}
    git add ${GITHUB_REPOSITORY#*/}-${file#*-}
    git commit -am "Update ${GITHUB_REPOSITORY#*/}-${file#*-} ($(date +%Y-%m-%d.%H:%M:%S))"
done

git branch -D main
git branch -m main

git push origin main --force