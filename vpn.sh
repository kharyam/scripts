#!/bin/bash

# Fill out the password prompt with pin prefix
sleep 1 && xdotool search --name '^Authentication\ required$' windowactivate --sync type $(cat ~/.pin) &

# Toggle vpn on or off
nmcli connection up '1 - Red Hat Global VPN' || nmcli connection down '1 - Red Hat Global VPN'

