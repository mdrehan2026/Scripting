#!/bin/bash
#way to run commands 
#type1 directly write command one by one
pwd
#type2 write command in varibale then execute
PWD="pwd"
$PWD
echo "list of all files inside this folder is"
List=$(ls)
echo "$List"
user=$(whoami)
echo "username is $user"
#type3


