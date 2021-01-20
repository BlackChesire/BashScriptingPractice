#!/bin/bash

if [[ $# -ne 1 ]] ; then
	echo "Usage: $1 <file>.";
	 exit ;
fi

file_name=$1

if [[ !(( -f $file_name ))  ]] ; then
	echo "Error, $1 must be a file." ;
	exit ;
fi

words=$(cat $file_name | tr " " "\n")

for letter in {a..z} ; do
	count_letters=$(echo "$words" | egrep -i ^$letter | wc-l)
	echo -e "$letter\t$count_letters" 
done
