#! /bin/bash

#using while loops

# while [ condition ]
# do
# 	cmnd1
# 	cmnd2
# done
#

num=1

while [ $num -le 10 ]
do
	echo "$num"
	num=$(( num+1 ))
done

echo

#another way to evaluate

num=1

while [ $num -le 10 ]
do
	echo "$num"
	(( num++ ))
done



# open gnome-terminal using while loop

n=1
while (( $n <= 3 ))
do 
	echo "$n"
	(( ++n ))
	gnome-terminal &
done



