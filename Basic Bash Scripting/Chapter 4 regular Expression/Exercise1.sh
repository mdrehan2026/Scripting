#Display a list of all the users on your system who log in with the Bash shell as a default.
#!/bin/bash
w
echo
#From the /etc/group directory, display all lines starting with the string "daemon"
grep ^daemon /etc/group 

