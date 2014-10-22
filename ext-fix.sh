#!/bin/bash


# getopts


PROB_FILE_COUNT=0

operation()
{
	echo "dasdas"
}

check()
{
	if [ $# -eq 1 ]; then
		if [ ! -f $1 ]; then
			echo "* that's a directory! "
			exit 1
		fi
		TYPE=$(file -b $1 | cut -d ' ' -f 1)
		TYPE=${TYPE,,}						# file type from `file`
		EXT=$(echo $1 | cut -d '.' -f 2)	# file extension from file name
		if [ $TYPE == $EXT ];then
			echo "+ file type and extension match"
		else
			echo -e "- $1\tfile type and extension does not match"
			((PROB_FILE_COUNT++))
		fi
	else
		for file in *
		do
			if [ -f $file ]; then
				TYPE=$(file -b $file | cut -d ' ' -f 1)
				TYPE=${TYPE,,}						# file type from `file`
				EXT=$(echo $file | cut -d '.' -f 2)	# file extension from file name
				if [ $TYPE != $EXT ];then
					echo -e "- $file\tfile type and extension does not match"
					((PROB_FILE_COUNT++))
				fi
			fi
		done
	fi
	echo "$PROB_FILE_COUNT files"
}

# while getopts ...

# if [ $1 == "list" ] || [ $1 == "check" ] || [ $1 == "-l" ] || [ $1 == "l" ]; then
	# if [ $# -eq 1 ]; then
		check $1
