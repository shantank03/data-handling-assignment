#!/bin/bash

# Set MySQL Credentials
USERNAME=root
PASSWORD=changethis
LOCATION=/var/lib/mysql-files/

# Set up Database and Table information
MYDATABASE=coursesurvey
MYTABLE=tblSurveyResponses

# Copy data into MySQL
sudo cp ./response.csv $LOCATION

mysql -u USERNAME --password="$PASSWORD" 


# Writing a temporary directory
TEMPDIR="./temp"

# Specify Variable Names
# VARNAMES="IDENTIFIER,MAJOR,ORIGIN,COLOR,FOOD,RATING,TIMESTAMP"

# Make temp directory
mkdir $TEMPDIR/
# Copy all CSV files into directory
cp ./*.csv $TEMPDIR/

# echo "$VARNAMES"
# Create a new csv with variables in a header row
# echo "$VARNAMES" > $TEMPDIR/00varheader.csv
# concatenate all data
cat $TEMPDIR/*.csv > ./compiled-data.csv

# clean up
rm -r $TEMPDIR