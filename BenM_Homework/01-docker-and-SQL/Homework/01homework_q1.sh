#!/bin/sh
# Shebang explainer: https://www.shellcheck.net/wiki/SC2148
# https://www.freecodecamp.org/news/bash-scripting-tutorial-linux-shell-script-and-command-line-for-beginners/

# $ cd  ~/gitProjectFlr/zoomcamp/BenM_Homework/01-docker-and-SQL/Homework
# $ chmod u+x 01homework_q1.sh # assign execution rights
# $ bash 01homework_q1.sh  # run this script 
# Save output to 01homework_q1.md

# ">" will replace file, ">>" will append file
echo "##  Module01 Homework"   > 01homework_q1.md
echo "
###  Docker & SQL "   >> 01homework_q1.md

echo "

# #################################  Question 1. Knowing docker tags  ################################# "   >> 01homework_q1.md


echo "

#   ________________________________________  $ docker --help    ________________________________________ 


"  >> 01homework_q1.md
docker --help  >> 01homework_q1.md #docker info


echo "

#   ________________________________________  $ docker build --help    ________________________________________ 


"  >> 01homework_q1.md
docker build --help  >> 01homework_q1.md # docker build command info


echo "

#   ________________________________________  $ docker run --help    ________________________________________ 


"  >> 01homework_q1.md
docker run --help  >> 01homework_q1.md # docker rin command info


echo "

#  ???????????????????????????????????????????   Automatically remove the container when it exits   ??????????????????????????????????????????? 
#
#
#    ________________________________________  $ docker run --rm    ________________________________________ 

"  >> 01homework_q1.md

