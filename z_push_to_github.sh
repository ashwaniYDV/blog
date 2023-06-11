#!/bin/sh

echo "pull master"
git pull origin master

if [ -d "docs" ]; then  
    rm -rf docs
fi

echo "hugo"
hugo

git add .
git commit -m "updates"

echo "push to github"
git push origin master