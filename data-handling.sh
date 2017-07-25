#!/bin/bash

# BEGIN SURVEY QUESTIONS
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

# Write the timestamp and unique identifier
TIMESTAMP=`date --iso-8601=seconds`
IDENTIFIER=`pwgen -n 5`

# Write data to a LIST File
echo "$IDENTIFIER,$MAJOR,$ORIGIN,$COLOR,$FOOD,$RATING,$TIMESTAMP" >> ./response.csv

# Write data to a database
# bash ./write-to-db.sh

# Set MySQL Credentials
USERNAME=root
PASSWORD=changethis
LOCATION=/var/lib/mysql-files
cp ./response.csv $LOCATION
mysql -u USERNAME --password="$PASSWORD" 
