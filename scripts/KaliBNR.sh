#!/bin/bash
# @dotato
# TODO - change dir to locate based on where it was installed

# Increment latest tag
tags=( $(docker images --format '{{.Tag}}' tdalonzo/kali) )
latestnum=$(echo ${tags[0]} | tr -dc '0-9')
let "latestnum++"

echo "Rebuilding Kali Image"
docker build -t tdalonzo/kali:base$latestnum -f /Users/dotato/Desktop/Docker/Kali/base/Dockerfile.Dockerfile .
echo "Starting Latest Kali Image"
docker run --net kali_network --hostname kali4 --name kali -it tdalonzo/kali:base$latestnum