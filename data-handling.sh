#!/bin/bash

# Question 1
echo "What is your area of study?"
read MAJOR
# Question 2
echo "Where are you from?"
read ORIGIN
# Question 3
echo "What is your favorite color?"
read COLOR
# Question 4
echo "What is your favorite food?"
read FOOD
# Question 5
echo "From 1-5, how do you rate pizza?"
read RATING

TIMESTAMP=`date --iso-8601=seconds`
echo "$MAJOR, $ORIGIN, $COLOR, $FOOD, $RATING, $TIMESTAMP"

cat $RESPONSE > data-handling-assignment/response.list