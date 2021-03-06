#!/bin/bash
# @dotato

# Increment latest tag
tags=( $(docker images --format '{{.Tag}}' tdalonzo/kali) )
latestnum=$(echo ${tags[0]} | tr -dc '0-9')
let "latestnum++"

parentdir="$(dirname "$PWD")"

echo "Rebuilding Kali Image"
docker build -t tdalonzo/kali:base$latestnum -f $parentdir/base/Dockerfile.Dockerfile .
echo "Starting Latest Kali Image"
docker run --net kali_network --hostname kali4 --name kali -it tdalonzo/kali:base$latestnum