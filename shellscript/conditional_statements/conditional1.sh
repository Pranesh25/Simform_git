#! /bin/bash

# if [condition]
# then
#statement
# fi
# syntax for if condition

count=10

if [ $count -eq 9 ]
then
	echo "$count is equal to 9"
fi

echo

if [ $count -gt 9 ]
then
	echo "$count is greater than 9 "
fi 

echo

if (($count <= 10))
then
	echo "$count is <=  10"
fi
echo


word=abc

if (($word == "abc"))
then
	echo "it is equal"
fi

echo


word=c
if [[ $word < "x" ]]
then
	echo "$word is less than x"
fi

echo


#using if else conditon

word1=abc
word2=abc

if [ $word1 == $word2 ]
then
	echo " word1 is equal to word2"
else
	echo "word1 is not equal to word2"
fi
echo


word=a
if [[ $word == "b" ]]
then
	echo "word is equal to b"
elif [[ $word == "a" ]] 
then
	echo "word is equal to a"
	#statements
else
	echo "none are correct"
fi
echo



