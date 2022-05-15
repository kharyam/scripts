#!/bin/bash
for i in {0..10}
do
  xdotool search --desktop $i --name '^OBS .+$' windowactivate --sync key ctrl+BackSpace
done
