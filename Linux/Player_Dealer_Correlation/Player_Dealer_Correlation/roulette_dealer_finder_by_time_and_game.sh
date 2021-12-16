#!/bin/bash


Aug_Game=$2
echo $2
echo Date: $1
cat ~/Desktop/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Dealer_Analysis/$1_Dealer_schedule | awk -F" " '{print $1, $2, $3, $4}' | grep "$3"
if
cat ~/Desktop/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Dealer_Analysis/$1_Dealer_schedule | awk -F" " '{print $1, $2, $5, $6}' | grep "$3"
if
cat ~/Desktop/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Dealer_Analysis/$1_Dealer_schedule | awk -F" " '{print $1, $2, $7, $8}' | grep "$3"

else
echo 'No dealer found!!'
fi

