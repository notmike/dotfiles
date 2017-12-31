#!/bin/bash

# Private Internet Access Script
#     We need to take the ovpn files provided by PIA and convert 
#     them to conf files that can be used by python-pia 
#     (https://github.com/flamusdiu/python-pia/) to make them 
#     networkmanager-vpn preconfigs.
#     Below are the changes we're making.


FILES=/etc/openvpn/*.conf
shopt -s nullglob
for f in $FILES;
    do
        echo "Processing $f ..."
#*** CHANGE THE FOLLOWING LINES IN EACH OPVN FILE ***

#         auth-user-pass  ...to...  auth-user-pass /etc/private-internet-access/login.conf
            sed -i 's:auth-user-pass:auth-user-pass /etc/private-internet-access/login.conf:' "$f"
            
#         ca.rsaXXXXXX.crt ...to...  /etc/openvpn/ca.rsa.4096.crt
            sed -i "s:'ca.rsa.*':'/etc/openvpn/ca.rsa.4096.crt':" "$f"

#         change "group nogroup" to "group nobody"
            sed -i 's:group nogroup:group nobody:' "$f"

#*** ADD THE FOLLOWING LINES TO THE END OF THE OPVN FILES ***
#         Add verbosity setting
           sed -i '$ a verb 4' "$f"

#         Add crl-verify /etc/openvpn/crl.rsa.4096.pem
            sed -i '$ a crl-verify /etc/openvpn/crl.rsa.4096.pem' "$f"


# ***** Deprecated ******

#        *** Rename file Extension ***
#        ovpn
#        to ...
#        conf
#            mv -- "$f" "${f%.ovpn}.conf"
done
