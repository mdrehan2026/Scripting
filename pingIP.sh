# to ping the ip using script
read -p "list the ip you want to ping:" IP
echo "this is ip you have enter: $IP"
#echo "here below is your output:"
ping -c 4 $IP
#PING=$(ping -c 4 $IP)
#echo $PING

