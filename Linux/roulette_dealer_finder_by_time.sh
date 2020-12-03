#!/bin/bash
# This should allow you to search the date and time, and give you the corresponding Roulette dealer.

echo "Enter the date in MMDD format, followed by [enter]:"

read date

grep $date ~/Lucky_Duck_Investigation/Roulette_Loss_Investigation/Dealer_Analysis/RTN | awk -F'["\t" ]' '{print $2, $4, $5, $6, $7}' > ~/Lucky_Duck_Investigation/Roulette_Loss_Investigation/Dealer_Analysis/MACRO |

echo "Enter the time (01-12), followed by [enter]:"

read hour

grep $hour ~/Lucky_Duck_Investigation/Roulette_Loss_Investigation/Dealer_Analysis/MACRO | awk -F'["\t" ]' '{print $2, $3, $4, $5}' > ~/Lucky_Duck_Investigation/Roulette_Loss_Investigation/Dealer_Analysis/MICRO |

echo "Enter AM or PM, followed by [enter]:"

read xm

grep -i $xm ~/Lucky_Duck_Investigation/Roulette_Loss_Investigation/Dealer_Analysis/MICRO | awk -F'["\t" ]' '{print $2, $3, $4}' 

echo "...was the Roulette dealer on" $date "at" $hour $xm
