##  Module01 Homework

###  Docker & SQL 


# #######################  Question 2. Understanding docker first run  ####################### 


#   ______Run docker with the python:3.9 image in an interactive mode and the entrypoint of bash._______ 
$ winpty docker run -it --entrypoint=bash python:3.9 




#   ______Now check the python modules that are installed ( use pip list )._______ 
What is version of the package wheel ?
        
        #   Correct answer is: 0.42.0



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

