#!/bin/bash
# @dotato

# Obtain latest tag for Kali image
tags=( $(docker images --format '{{.Tag}}' tdalonzo/kali) )
latestnum=$(echo ${tags[0]} | tr -dc '0-9')

echo "Starting Latest Kali Image"
docker run --net kali_network --hostname kali4 --name kali -it tdalonzo/kali:base$latestnum