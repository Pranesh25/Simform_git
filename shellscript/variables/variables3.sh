#! /bin/bash


#passing  arguments to a bash script

echo $0 $1 $2  '> echo $1 $2'

args=("$@")

echo ${args[0]} , ${args[1]} ${args[2]}

echo 
echo $@
#to print the arguments

echo $#
#to print the number of arguments