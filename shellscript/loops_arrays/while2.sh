#! /bin/bash

while read p
do
	echo $p

done < while2.sh


# another way to read file
echo
echo


cat while2.sh | while read p
do
	echo $p

done

#anohter way to read file
# we are assigning space to IFS(internal field seperator) used to read word boundary
# -r prevents backslashes
while IFS=' ' read -r line
do
	echo $line

done < while2.sh


echo
echo

while IFS=' ' read -r line
do
	echo $line

done < /etc/host.conf

