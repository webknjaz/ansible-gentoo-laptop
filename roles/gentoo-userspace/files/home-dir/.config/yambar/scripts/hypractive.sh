#!/bin/bash

while :
do
  hypractive="$(hyprctl activeworkspace -j)"
  hyprwindow="$(echo "${hypractive}" | grep -E '"id": ' | tr -dc '0-9')"

  if [ $hyprwindow -gt 10 ]
  then
    workspace=$((hyprwindow - 10))
  else
    workspace="${hyprwindow}"
  fi

  echo "workspace|int|${workspace}"
  echo ""

  sleep 0.5
done
