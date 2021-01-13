#!/bin/bash

# This script will report the number of goals scored by each team
if [[ $# -ne 1 ]] ; then
	echo -e "\nUsage: $0 <matches-file>\n"
	exit
fi

matches_file="$1"

for team in `cut -f1 $matches_file | sort -u` ; do
	./num_goals.sh $matches_file $team
done
