#Display a list of all the users on your system who log in with the Bash shell as a default.
#!/bin/bash
w | grep "/bin/bash"
echo
#From the /etc/group directory, display all lines starting with the string "daemon"
echo
grep ^daemon /etc/group 
#Print all the lines from the same file that don't contain the string.
echo 
grep -v daemon /etc/group
#Display localhost information from the /etc/hosts file, display the line number(s) matching the search string 
# and count the number of occurrences of the string.
echo
grep -n localhost /etc/hosts
grep -c localhost /etc/hosts
#Display a list of /usr/share/doc subdirectories containing information about shells.
echo 
# ls -R /usr/shar/doc , correct but too much info
#Since shell names usually end in "sh" (bash, zsh, dash), searching for "sh" is a great start.
ls /usr/share/doc | grep "sh"
#How many README files do these subdirectories contain? Don't count anything in the form of "README.a_string"
echo 
ls /usr/share/doc | grep -c "README" 
# Make a list of files in your home directory that were changed less that 10 hours ago, using grep, 
# but leave out directories.
#ls /home | grep 
