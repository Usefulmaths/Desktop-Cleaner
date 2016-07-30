#!/bin/bash
# Cleans up desktop. Sorts files by extensions and stores them in temporary files.

echo "What file extensions would you like to clean up? (e.g. txt png mov)"
read ext_variable

if [ -d "temporary_files" ]
	then
	echo "temporary_files directory already exists."
else
	echo "Creating temporary_files directory."
	mkdir ~/desktop/temporary_files
fi

for ext in $ext_variable
do
	if [ -d temporary_files/temp_$ext ]
		then
		echo temp_$ext "already exists"
	else
		echo "Creating" temp_$ext "directory"
		mkdir ~/desktop/temporary_files/temp_$ext
	fi

	count=`ls -1 *.$ext 2>/dev/null | wc -l`

	if [ $count != 0 ]
		then
		echo "Moving all" $ext "files."
		mv ~/desktop/*.$ext ~/desktop/temporary_files/temp_$ext
	else
		echo "No files with this extension exists: "$ext
	fi
done

