#! /bin/bash

os=('ubuntu' 'windows' 'kali')
os[0]='mac'
#to replace the value we use

os[3]='ubuntu'

unset os[2]
#to delete from the array we use unset 


echo ${os[0]}
echo ${os[1]}
echo ${os[2]}
echo ${os[3]}

echo 

echo "${os[@]}"
echo "${!os[@]}"


echo

string=asdlfjla

echo "${string[@]}" #prints the array
echo "${string[0]}" #prints the array which is at pos 1
echo "${string[1]}"
echo "${string[2]}"
echo "${#string[@]}" #prints the length of the array








