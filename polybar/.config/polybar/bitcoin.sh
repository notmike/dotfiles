#!/bin/bash

####################################################
# CREATION     : 2016-11-19
# MODIFICATION : 2016-11-19

# I3block's blocklet which:
# - Shows current coinbase bitcoin price in USD

# Requirements:
# - curl
#
####################################################
icon=""

data=$(curl --silent "https://bitcoinwisdom.com/markets/coinbase/btcusd" | grep 'init_price' | awk '{print$3}' | grep -o -E "[[:digit:]]+\.[[:digit:]]+")
echo "$icon $data"
