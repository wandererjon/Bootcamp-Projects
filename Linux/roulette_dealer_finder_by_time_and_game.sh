#!/bin/bash
# This should allow you to search the game, date, time, and give you the corresponding table dealer.

echo "Enter 1 for Black Jack, 2 for Roulette, 3 for Texas Hold'Em, followed by [enter]:"

read game

grep 0 ~/Lucky_Duck_Investigation/Roulette_Loss_Investigation/Dealer_Analysis/DS$game > ~/Lucky_Duck_Investigation/Roulette_Loss_Investigation/Dealer_Analysis/AB |

echo "Enter the date in MMDD format, followed by [enter]:"

read date

grep $date ~/Lucky_Duck_Investigation/Roulette_Loss_Investigation/Dealer_Analysis/AB | awk -F'["\t" ]' '{print $2, $3, $4, $5, $6, $7, $8}' > ~/Lucky_Duck_Investigation/Roulette_Loss_Investigation/Dealer_Analysis/CD |

echo "Enter the time (01-12), followed by [enter]:"

read hour

grep $hour ~/Lucky_Duck_Investigation/Roulette_Loss_Investigation/Dealer_Analysis/CD | awk -F'["\t" ]' '{print $3, $4, $5, $6}' > ~/Lucky_Duck_Investigation/Roulette_Loss_Investigation/Dealer_Analysis/EF |

echo "Enter AM or PM, followed by [enter]:"

read xm

grep -i $xm ~/Lucky_Duck_Investigation/Roulette_Loss_Investigation/Dealer_Analysis/EF | awk -F'["\t" ]' '{print $2, $3, $4}'

echo "...is the table dealer you're looking for on" $date "at" $hour $xm
