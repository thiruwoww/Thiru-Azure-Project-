#!/bin/bash


states=('Nebraska' 'Hawaii' 'California' 'New_york' 'washington')


for state in ${states[@]}; 
do

	if [ $state == 'Hawaii' ];
	then

	  echo "it is here"

	else

	  echo "ot is not there"
	fi
done



