#!/bin/bash
# Make a script that checks whether a user exists in /etc/passwd. 
#For now, you can specify the user name in the script, you don't have to work with arguments and conditionals at this stage.
grep ^root /etc/passwd
# Display configuration files in /etc that contain numbers in their names.
ls /etc | grep [0-9]