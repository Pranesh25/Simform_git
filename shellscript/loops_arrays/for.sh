#! /bin/bash
# for loops

for i in 1 2 3 4 5
do
	echo $i
done	

echo

for i in {1..10}
do 
	echo $i
done

echo

#     {start end increment}
for i in {0..20..5}
do
	echo $i
done

echo



for (( i=0 ; i<5 ; i=i+2 ))
do
	echo $i
done

echo


# commands using loop

for cmd in ls pwd date
do
	echo "----------------------------------$cmd----------------------------"
	$cmd
done
echo


# * to iterate over each and every file or directory
for item in *
do
	if [ -d $item ]
	then
		echo $item
	else
		echo "no directory found"
	fi
done


echo

for item in *
do
	if [ -f $item ]
	then
		echo $item
	else
		echo "no file found"
	fi
done

