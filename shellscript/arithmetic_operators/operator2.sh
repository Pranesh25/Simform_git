#! /bin/bash

# basic arithmetic operators

num1=100
num2=5

echo $(( num1 + num2 ))
echo $(( num1 - num2 ))
echo $(( num1 * num2 ))
echo $(( num1 / num2 ))
echo $(( num1 % num2 ))


echo

echo $( expr $num1 + $num2 )
echo $( expr $num1 - $num2 )
echo $( expr $num1 \* $num2 )
echo $( expr $num1 / $num2 )
echo $( expr $num1 % $num2 )


echo
echo

#performing on decimal numbers

num1=20.5
num2=0.5
echo "$num1 + $num2" | bc
echo "$num1 - $num2" | bc
echo "$num1 * $num2"| bc
echo "$num1 / $num2 "| bc
echo "$num1 % $num2" | bc


echo
#to perform the square root of a number

num=144
echo "scale=2;sqrt($num)" | bc -l # l is used to use math library
echo "scale=2;3^3" | bc -l # l is used to use math library from binary count command





