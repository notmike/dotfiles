#!/bin/bash

# Private Internet Access Script
#     We need to take the PIA ovpn files provided by PIA and convert 
#     them to conf files that can be used by python-pia 
#     (https://github.com/flamusdiu/python-pia/) to make them 
#     networkmanager-vpn preconfigs.
#     Below are the changes we're making.

FILES=/etc/openvpn/*.ovpn
shopt -s nullglob
for f in $FILES;
    do
        echo "Processing $f ..."
#         *** CHANGE THE FOLLOWING LINES IN EACH OPVN FILE ***

#         auth-user-pass
#         to ...
#         auth-user-pass /etc/private-internet-access/login.conf

            sed -i 's:auth-user-pass:auth-user-pass /etc/private-internet-access/login.conf:' "$f"
#         crl-verify crl.rsa.4096.pem
#         to ...
#         crl-verify /etc/openvpn/crl.rsa.4096.pem

            sed -i 's:crl-verify crl.rsa.4096.pem:crl-verify /etc/openvpn/crl.rsa.4096.pem:' "$f"

#         ca ca.rsa.4096.crt
#         to ...
#         ca /etc/openvpn/ca.rsa.4096.crt

            sed -i 's:ca ca.rsa.4096.crt:ca /etc/openvpn/ca.rsa.4096.crt:' "$f"

#         *** ADD THE FOLLOWING LINES TO THE END OF THE OPVN FILES ***

#         up /etc/openvpn/update-resolv-conf.sh
#         down /etc/openvpn/update-resolv-conf.sh
#       
            sed -i '$ a up /etc/openvpn/update-resolv-conf.sh\ndown /etc/openvpn/update-resolv-conf.sh' "$f"

#        *** Rename file Extension ***
#        ovpn
#        to ...
#        conf
            mv -- "$f" "${f%.ovpn}.conf"
done

