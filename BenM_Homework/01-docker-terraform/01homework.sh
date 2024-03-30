#!/bin/sh
# Shebang explainer: https://www.shellcheck.net/wiki/SC2148
# https://www.freecodecamp.org/news/bash-scripting-tutorial-linux-shell-script-and-command-line-for-beginners/

# $ cd  ~/gitProjectFlr/data-engineering-zoomcamp/BenM/01-docker-terraform/
# $ chmod u+x 01Homework.sh # assign execution rights
# $ bash 01homework.sh  # run this script 
# Save output to 01homework.md

# ">" will replace file, ">>" will append file
echo "##  Module01 Homework"   > 01homework.md
echo "
###  Docker & SQL "   >> 01homework.md

echo "

# #################################  Question 1. Knowing docker tags  ################################# "   >> 01homework.md


echo "

#   ________________________________________  $ docker --help    ________________________________________ 


"  >> 01homework.md
docker --help  >> 01homework.md #docker info


echo "

#   ________________________________________  $ docker build --help    ________________________________________ 


"  >> 01homework.md
docker build --help  >> 01homework.md # docker build command info


echo "

#   ________________________________________  $ docker run --help    ________________________________________ 


"  >> 01homework.md
docker run --help  >> 01homework.md # docker rin command info


echo "

#  ???????????????????????????????????????????   Automatically remove the container when it exits   ??????????????????????????????????????????? 
#
#
#    ________________________________________  $ docker run --rm    ________________________________________ 

"  >> 01homework.md

