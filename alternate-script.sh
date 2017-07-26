#!/bin/bash

# Set MySQL Credentials
USERNAME=root
PASSWORD=changethis

# Set up Database and Table information
MYDATABASE=coursesurvey
MYTABLE=tblResponses

# Copy data into MySQL Secure directory
sudo cp ./response.csv /var/lib/mysql-files/

# Create Database in MySQL
# mysql -u"$USERNAME" -p"$PASSWORD" -e "CREATE DATABASE $MYDATABASE;"

# Create Table within Database
# mysql -u"$USERNAME" -p"$PASSWORD" -e "CREATE TABLE $MYTABLE (Identifier VARCHAR(255), Major VARCHAR(255), Origin VARCHAR(255), Color VARCHAR(255), Food VARCHAR(255), Rating INT, Timestamp TIMESTAMP); ALTER TABLE $MYTABLE ADD PRIMARY KEY (Identifier);" $MYDATABASE

# Write data into the Database
mysql -u"$USERNAME" -p"$PASSWORD" -e "LOAD DATA INFILE '/var/lib/mysql-files/response.csv' INTO TABLE $MYTABLE FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '\"';" $MYDATABASE

# Dump database into a .sql file
mysqldump -u"$USERNAME" -p"$PASSWORD" $MYDATABASE > `date --iso-8601`-$MYDATABASE-alternate.sql

# remove file in sql directory
sudo rm /var/lib/mysql-files/response.csv