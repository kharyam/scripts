#!/bin/bash
if [ $1 -ge 3 ] 
  then
    /home/kmendez/.local/bin/lc off
  else
    /home/kmendez/.local/bin/lc on
fi

for i in {0..10}
do
  xdotool search --desktop $i --name '^OBS .+$' windowactivate --sync key alt+shift+$1 
  if [ $? -eq 0 ]
    then
      echo "Found it at desktop $i"
      exit 0
  fi
done
