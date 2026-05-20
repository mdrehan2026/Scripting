#!/bin/bash
#Script to fnd all error in linux
#type 1 terminal error, there output doesn't log in any files, in which app/services is not involes 
#type 2 Log files error, in which app/services is involes

#Type 1 terminal error
# Flow of commands from typing till executions
# step 1- write commands ls
# *step 2- ls pass to shell , check commands exits {pass to kernel} or not - ERROR {command not found} 
# *step 3- create process and execute the command - ls /fakefolder
# So it asks Linux kernel: “Does this directory exist?” Kernel checks filesystem
# if yes executed. ANd if no ERROR So kernel returns: ENOENT (Error NO ENTry) code & show to user

# if terminal error doest not store then how i can read as script , describe it belows
# ⚙️ Method 1: Redirect errors to a file (most common) :- command > output.log 2>&1
# 👀 Method 2: Read errors while still seeing them :- command 2> >(tee error.log)
# 🧪 Method 3: Real-time debugging (best for developers) :- strace ls /fakefolder or ltrace ls

#Method 1 Scripting below

#taking user input commands and if error arise captured it 

