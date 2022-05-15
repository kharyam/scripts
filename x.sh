#!/bin/bash
export DISPLAY=$(echo $SSH_CLIENT | awk '{print $1}'):0
echo $DISPLAY

# Fix vscode
#cp /usr/lib64/libxcb.so.1 ~/lib
#sed -i 's/BIG-REQUESTS/_IG-REQUESTS/' ~/lib/libxcb.so.1
alias code='LD_PRELOAD=$HOME/lib/libxcb.so.1 code'

