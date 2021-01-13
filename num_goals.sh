#!/bin/bash

if [[ $# -ne 2 ]] ; then
	echo -e "\nUsage: $0 <matches-file> <team-name>\n"
	exit
fi

matches_file="$1"
team_name="$2"

toal_num_goals=0
while read line ; do
	if [[ `echo $line | grep $team_name | wc -l` -eq 0 ]] ; then
		continue
	fi
	if [[ `echo $line | cut -f1 -d" "` == $team_name ]] ; then
		ngoals=`echo $line | cut -f3 -d" "`
	else
		ngoals=`echo $line | cut -f4 -d" "`
	fi
	toal_num_goals=$((toal_num_goals+ngoals))
done < "$matches_file"

echo "$team_name scored $toal_num_goals goals"
