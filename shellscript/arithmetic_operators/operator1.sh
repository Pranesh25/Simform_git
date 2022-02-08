#! /bin/bash

#using logic operatior &&

age=25

if [ "$age" -gt 18 ] && [ "$age" -lt 30 ]
then
	echo "valid age"
else
	echo "invalid age"
fi

echo

# the -a is similar to &&
if [ "$age" -gt 18  -a "$age" -lt 30 ]
then
	echo "valid age"
else
	echo "invalid age"
fi

echo

# if we want to use && then we have to use [[]]

if [[ "$age" -gt 18  &&  "$age" -lt 30 ]]
then
	echo "valid age"
else
	echo "invalid age"
fi

echo 
# using or operator

if [ "$age" -gt 18 ] || [ "$age" -lt 30 ]
then
	echo "valid age"
else
	echo "invalid age"
fi


echo

age=5

if [[ "$age" -gt 18  &&  "$age" -lt 30 ]]
then
	echo "valid age"
else
	echo "invalid age"
fi

echo

if [ "$age" -gt 18 -o "$age" -lt 30 ]
then
	echo "valid age"
else
	echo "invalid age"
fi