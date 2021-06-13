#!/bin/bash

. $(dirname ${BASH_SOURCE})/util.sh

Name="chandra" ##Variable example
echo "Chandra varibale $Name"
SPORT="SPORT N" ##Variable string concat
echo "Chandra varibale ${SPORT}, hello"
echo
echo "Test"
printForQuotaAndPods