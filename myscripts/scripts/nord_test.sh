#!/bin/bash
#
###

echo -n "us330 = " 
sudo nordvpn ping us330 

echo -n "us438 = " 
sudo nordvpn ping us438 

echo -n "us475 = " 
sudo nordvpn ping us475 

echo -n "us478 = " 
sudo nordvpn ping us478 

echo -n "us482 = " 
sudo nordvpn ping us482 

echo -n "us725 = " 
sudo nordvpn ping us725

# message() {
#   echo "usage:"  
#   echo
#   echo "  $0 M"
#   echo "     show me what i've upgraded looking back"
#   echo "     a maximum M -Syu 's (default 1)"
#   echo
#   echo "  $0 M N"
#   echo "     show me what i've upgraded looking back"
#   echo "     between minimum N and maximum M -Syu 's"
#   echo
#   exit 1
# }

# # pacman log
# log='/var/log/pacman.log'

# # some temp files
# tmp='/tmp/timelime'
# tmp2='/tmp/upgrades'

# # a help
# [ "$1" = "help" ] && message

# # $0 M maybe N
# case $# in
#   0) M=1  ; N=0  ;;
#   1) M=$1 ; N=0  ;;
#   2) M=$1 ; N=$2 ;;
#   *) message     ;;
# esac

# grep '.*upgraded.*(.*)$\|starting full system upgrade' $log | cut -d ']' -f 2 | uniq > $tmp

# max=$(grep -c '^ starting' $tmp)

# count=1
# grep -n '^ starting' $tmp | while read line; do
#   echo "$count $line" >> $tmp2
#   count=$((count+1))
# done

# line_M=$(awk "/^$((max-M+1))\ /"'{print $2}' $tmp2 | cut -d ":" -f 1)

# if [ $N -eq 0 ]; then
#   line_N=$(wc -l < $tmp)
# else
#   line_N=$(awk "/^$((max-N+1))\ /"'{print $2}' $tmp2 | cut -d ":" -f 1)
# fi

# echo "-------------[  -Syu $M  ]---------------<"
# head -n$((line_N-1)) $tmp | tail -n$((line_N-line_M-1))

# if [ $N -eq 0 ]; then
#   echo "-------------[    Now    ]---------------<"
# else
#   echo "-------------[  -Syu $N  ]---------------<"
# fi

# rm $tmp $tmp2
