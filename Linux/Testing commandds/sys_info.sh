#!bin/bash/

#mkdir ~/research 2>/dev/null

of="$HOME/research/sys_info.txt"

if [ ! -d = $of ]

then

mkdir ~/research 2>/dev/null

fi
#A title and today's date.
date >> $of
echo " " >>  $of
#The uname info for the machine.
echo "Machine type  info" >> $of
echo $MACHHTYPE >> $of
echo " "  >> $of
echo "Uname info: $(uname -a) \n" >> $of
#The machine's IP address. (Narrow this output down to one line.
echo "IP Info: $(ip addr | grep inet | tail -1 | head -2) \n" >> $of
#The Hostname
echo "Hostname: $(hostname -s) \n" >> $of
echo "DNS Servers: " >> $of
cat /etc/resolv.conf >> $of
echo "\nMemory Info:" >> $of
free >> $of
lscpu | grep CPU >> $of
echo "\nDisk Usage:" >> $of
df -H | head -2 >> $of
echo "\nWho is logged in: \n $(who -a) \n" >> $of
echo "\nSUID Files:" >> $of
find / -type f -perm /4000 >> $of
echo "\nTop 10 Processes" >> $of
ps aux -m | awk {'print $1, $2, $3, $4, $11'} | head >> $of

mkdir ~/scripts && 
echo "export PATH=$PATH:~/scripts" >> ~/.bashrc

else
echo "do nothing"

fi
