#!/bin/bash

. $(dirname ${BASH_SOURCE})/util.sh

Name="chandra" ##Variable example
echo "Chandra varibale $Name"
SPORT="SPORT N" ##Variable string concat
echo "Chandra varibale ${SPORT}, hello"
echo
echo "Test"

printForQuotaAndPods


echo "PATH"

echo $0
 
full_path=$(realpath $0)
echo $full_path
 
dir_path=$(dirname $full_path)
echo $dir_path
 
examples=$(dirname $dir_path )
echo $examples



trap "echo" EXIT