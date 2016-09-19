#!/bin/bash

#the value of the second entrie
projecName=$1

#create new file white the projectName
mkdir $projecName;
cd $projecName;

#identification to github
# curl -i -u aoll https://api.github.com/users/aoll

#identification token to github username="aoll"
# curl -i -u aoll -d '{"scopes": ["repo", "user"], "note": "getting-started"}' \
#    https://api.github.com/authorizations
# curlGit=$(curl -i -u aoll -d '{"scopes": ["repo", "user"], "note": "getting-started"}' \
#    https://api.github.com/authorizations)

# echo $curlGit

#CREATE NEW REPO WITH PROJECTNAME

# curl -i -H 'Authorization: token 8c208076f71df2261aaa8ac22460a9dd82cbdf7c' \
#     -d '{ "name": "'$projecName'",  "auto_init": false,  "private": false }' \
#     https://api.github.com/user/repos


mkdir src;
cd src;
cp ../../projectStarter/main.c .;
cd ..;
mkdir inc;
cd inc;
cp ../../projectStarter/project.h .;
cd ..;
git clone https://github.com/aoll/libft.git;
git clone https://github.com/aoll/unit_test.git;
# cd libft;
# rm -rf .git;
# cd ..;
cp ../projectStarter/Makefile .;
cp -r ../projectStarter/Documentation/.gitignore .;
echo "# ''$projecName''" >> README.md

# git init;
#
# git add -A;
#
# git commit -m "first commit";
# git remote add origin https://github.com/aoll/$projecName.git;
# git push -u origin master;
