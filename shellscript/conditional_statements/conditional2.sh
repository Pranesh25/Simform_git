#! /bin/bash

echo -e "enter the name of the file : \c"
read file_name

#-e is used to check if the file exist or not
# -f is used to check if the file exist and it is regular one or not

if [ -e $file_name ]
then
	echo "$file_name found"
else
	echo "$file_name not found"
fi

echo

# -f is used to check if the file exist and it is regular one or not


if [ -f $file_name ]
then
	echo "$file_name found"
else
	echo "$file_name not found"
fi



echo
# -d is used to check for the directory

echo -e "enter the name of the directory: \c"
read dir_name

if [ -d $dir_name ]
then
	echo "$dir_name found"
else
	echo "$dir_name not found"
fi

# -s for non empty file
# -r for file if it is read only
# -w for file if it is write only
#- x for file if it is executable only

