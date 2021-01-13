#!/bin/bash
#Q1
if [[ $# -ne 1 ]] ; then
	echo -e "Usage: $0 <song-file>"
	exit
fi

song_name="$1"

#Q2
if [[ -z $(ls -a | cut -f1 | grep "$song_name" | wc -l) ]] ; then
	echo -e "File $song_name not found !"
	exit
	else
	echo "song found !"
fi
#Q3
if [[ -z $(cat Abbey_Road.info.txt | grep $song_name | wc -l) ]] ; then
	echo -e "File $song_name not found at Abbey_Road.info.txt"
	exit
	else
	echo -e "song found !"
fi

song_file=$(cat /home/asaf/lab12/lab12/Abbey_Road.info.txt | grep "$song_name" | cut -f2)

#Q4
echo $(cat $song_file | tail -n+3 | wc -l);

#Q5
echo $(cat $song_file | tail -n+3 | wc -w);

#Q6
echo $(cat $song_file | head -n 3|tail -n1);

#Q7
echo "the most frequent word is " $(tail -n +3 $song_file | tr " " "\n" | sort | uniq -c | sort -rn | head -n1);
