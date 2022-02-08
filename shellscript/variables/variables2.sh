#! /bin/bash

#to read from user
echo "enter name :"

read name

echo "your name is : $name"

# to read multiple names ;-

echo "enter 3 names"

read name1 name2 name3

echo "the names are :- $name1 , $name2 , $name3"


# to enter the value in the same line 

read -p 'enter your variable : ' user_var

echo "entered variable is :- $user_var"


# if you donot want to show what the user is entering on screen

read -p 'enter username : ' username
read -sp 'password : ' pass
echo
echo "user name is :- $username"
echo "password is  :- " $pass


echo

# to enter values as an array 

echo "enter names in an array :- " 
read -a array
echo
echo "Names : ${array[0]} , ${array[1]} "



echo
echo "enter anything"
read
echo $REPLY

