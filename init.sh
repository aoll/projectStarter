#!/bin/bash

projecName=$1

mkdir $projecName;
cd $projecName;

#identification to github
# curl -i -u aoll https://api.github.com/users/aoll

#identification token to github username="aoll"
# curl -i -u aoll -d '{"scopes": ["repo", "user"], "note": "getting-started"}' \
#    https://api.github.com/authorizations
#

#CREATE NEW REPO WITH PROJECTNAME
# curl -i -H 'Authorization: token exemple_token here' \
#     -d '{ "name": "'$projecName'",  "auto_init": true,  "private": false }' \
#     https://api.github.com/user/repos

mkdir src;
cd src;
cp /home/alex/c/main.c .;
cd ..;
mkdir inc;
cd inc;
cp /home/alex/c/project.h .;
cd ..;
cp /home/alex/c/Makefile .;
cp -r /home/alex/c/libft .;
touch README.md;
# git init;
# git add README.md;
# git commit -m "first commit";
# git remote add origin https://github.com/aoll/$projecName.git;
# git push -u origin master;
