#!/bin/zsh

# PRINT System Information #

displayInfo() {
  ip=`/sbin/ifconfig $1 | grep "inet " | awk '{print $2}'`
  #printf "$1: $ip\n"
  if [ -z $ip ]; then
    printf "%-10s %15s" $1 "not connected"
  else
    printf "%-10s %15s" $1":" $ip
  fi
}

displayUpdateInfo() {
  if hash checkupdates 2>/dev/null; then
    printf "%s package updates available" `checkupdates | wc -l`
  fi
  if [ -e /usr/lib/update-notifier/apt-check ]; then
    printf "%s package updates available" `/usr/lib/update-notifier/apt-check`
  fi
}

printf "###################################################\n"
printf "#                                                 #\n"
printf "#  Machine: %-37s #\n" `uname -n`
printf "#  Network:                                       #\n"

for interface in `ls /sys/class/net`
do
    ip_info=`displayInfo $interface`
    printf "#           %-37s #\n" $ip_info
done

printf "#                                                 #\n"

update_info=`displayUpdateInfo`
printf "# %-47s #\n" $update_info

printf "#                                                 #\n"
printf "###################################################\n"
