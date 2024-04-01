#!/bin/sh
# Shebang explainer: https://www.shellcheck.net/wiki/SC2148
# https://www.freecodecamp.org/news/bash-scripting-tutorial-linux-shell-script-and-command-line-for-beginners/

# $ cd  ~/gitProjectFlr/zoomcamp/BenM_Homework/01-docker-and-SQL/Homework
# $ chmod u+x 01Homework_q2.sh # assign execution rights
# $ bash 01Homework_q2.sh # run this script 
# Save output to 01homework_q2.md

# ">" will replace file, ">>" will append file
echo "##  Module01 Homework"   > 01homework_q2.md
echo "
###  Docker & SQL "   >> 01homework_q2.md

echo "

# #######################  Question 2. Understanding docker first run  ####################### "   >> 01homework_q2.md

echo "

#   2.1______Run docker with the python:3.9 image in an interactive mode and the entrypoint of bash._______ 
$ winpty docker run -it --entrypoint=bash python:3.9 

"  >> 01homework_q2.md

winpty docker run -it --entrypoint=bash python:3.9 >> 01homework_q2.md # attach image python:3.9, Entrypoint is Bash (Git Bash),  -it Interactively allows you to enter python commands

echo "

#   2.2______Now check the python modules that are installed ( use pip list )._______ 
What is version of the package wheel ?
        
        #   Correct answer is: 0.42.0
"  >> 01homework_q2.md

winpty pip list >> 01homework_q2.md # list installed modules, What is version of the package wheel ?

# Commands run faster when prefixed with 'winpty', I guess it is because it does not have to throw/log error mintty…
#           the input device is not a TTY.  If you are using mintty, try prefixing the command with 'winpty'


# I Copy pasted the below Manually 
# Because, unlike Q1 I did not use a Script Bash because the Output was not from the Python Image, I ran the commands manually on Git Bash


echo "

# I Copy pasted the below Manually 
# Because, unlike Q1 I did not use a Script Bash because the Output was not from the Python Image, I ran the commands manually on Git Bash

#    $ winpty docker run -it --entrypoint=bash python:3.9
#    root@e75d27d9938c:/# pip list
#    Package    Version
#    ---------- -------
#    pip        23.0.1
#    setuptools 58.1.0
#    wheel      0.42.0
#
#    [notice] A new release of pip is available: 23.0.1 -> 24.0
#    [notice] To update, run: pip install --upgrade pip
#    root@e75d27d9938c:/# pip list >> exit
"  >> 01homework_q2.md


echo "

#   2.3.1______Prepare Postgres/Run Postgres_______ 
        
        #   Correct answer is: 0.42.0
"  >> 01homework_q2.md


echo "

#   2.3.2______Download nyc-tlc-data _______ 
        
        #   Correct answer is: 0.42.0
"  >> 01homework_q2.md


echo "

#   2.3.3______put data into Postgres_______ 
        use jupyter notebooks or pipeline script
        
        #   Correct answer is: 0.42.0
"  >> 01homework_q2.md