#!/bin/bash
## Create 3 variables, VAR1, VAR2 and VAR3; initialize them to hold the values "thirteen", "13" and "Happy Birthday" respectively.
var1="thirteen"
var2="13"
var3="Happy Birthday"
# Display the values of all three variables.
echo "first:$var1 second:$var2 third:$var3"
#Are these local or global variables? ans = yes
# remove var3
unset var3
#Can you see the two remaining variables in a new terminal window?
echo "first:$var1 second:$var2"
echo "yes"
echo "third:$var3"
#Edit /etc/profile so that all users are greeted upon login (test this).?
#For the root account, set the prompt to something like "Danger!! root is doing stuff in \w", preferably in a bright color such as red or pink or in reverse video mode.?
#Make sure that newly created users also get a nice personalized prompt which informs them on which system in which directory they are working. Test your changes by adding a new user and logging in as that user.?

