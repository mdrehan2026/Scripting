#!/bin/bash
#Commment
#varibale
name="MD-Rehan"
echo "My name is $name"
#taking input from users type1
echo "what is your dream and hobbies"
read dream hobbies
echo $dream $hobbies
#taking input from users type2
read -p "which country and city are you from: " country city
echo $country $city
#taking input from users type3
#The Command-Line Argument Way (Best for Automation) using paramter
# $0 - script name , use paramter from 1
UserName=$1
Work=$2
Department=$3
echo " $UserName is wokr as $Work in department $Department "

