#!/bin/bash

# target file name to be working on
file_source="Global YouTube Statistics.csv"

# column 8 value = country
country="United States"

# column 5 values = category
categories=("Music" "Entertainment" "Gaming" "Comedy")

# directory to save the result txt file
directory="./$country/"

# make sure there is directory
mkdir -p "$country"

for category in "${categories[@]}"; do
	# Try to see if correctly loop  
	#echo "$category" >> "${directory}temp.txt"

	# save catogory content to its txt file
	awk -F, -v country="$country" -v category="$category"  '$8==country && $5==category {print}' "$file_source" > "${directory}${category}.txt"

	# count line for each txt file after save it
	wc -l "${directory}${category}.txt" >> ws5.txt
done


