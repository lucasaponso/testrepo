#!/bin/bash

HOST1=10.20.212.50
HOST2=10.20.212.60
HOST3=10.20.212.61
HOST4=10.20.212.62

HOST5=10.20.220.230
HOST6=10.10.109.20
HOST7=10.10.107.6

HOST9=192.168.0.20
HOST10=172.105.180.73



count=0
myArray=("$HOST1" "$HOST2" "$HOST3" "$HOST4" "$HOST5" "$HOST6" "$HOST7" "$HOST9" "$HOST10")
for i in "${myArray[@]}"
do sudo ping $i -c 1 >> /log/network.log
    ping -c1 $i 1>/dev/null 2>/dev/null
    SUCCESS=$?
    if [ $SUCCESS -eq 0 ]
    then
        
        echo "$i has replied"
        
        let "count++"
       
    
    else
        echo "$i didn't reply, check /log/network.log"
    
    fi
    sudo nmap $i >> /log/security.log  
    
    
  
done
echo "$count/9 Successful Pings!!"