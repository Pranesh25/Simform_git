#! /bin/bash

echo "learning variables"

# there are 2 types of varibales 1. user defined . 2. system defined

echo my shell name is :- $BASH
#bash is system defined variables

echo my shell version is :- $BASH_VERSION
echo my home directory is :- $HOME
echo my present working directory is :- $PWD
echo name of my host is :- $HOSTNAME


# above are some system variables


name=pranesh
echo  $name 
#prints the value of the variable
echo ""
echo the name is $name
echo ""
echo "the name is  $name"
