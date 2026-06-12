#! /bin/bash
clear
echo "this is testing script"
echo "hi , $USER!" 
echo 

echo "I will list the user currently login in your shell:"
echo 
w   # show who is logged on and what are they doing
echo 

echo "I'm setting two variable now."
COLOUR="black" # setting local varibale in string
VALUE="9"      # setting local var in number
echo "this is a string: $COLOUR"
echo "and this is its number: $VALUE"
echo 

echo "I'm giving you back yoour prompt now."
echo 
