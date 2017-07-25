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

# Check for the Database and create if it does not exist
DBCHECK=`mysql -u"$USERNAME" -p"$PASSWORD" -e "SHOW DATABASES;" | grep -Fo $MYDATABASE`
if [ "$DBCHECK" == "$MYDATABASE"]; then
  echo "Database exists"
else
  echo "Database not created. Creating database..."
  mysql -u"$USERNAME" -p"$PASSWORD" -e "CREATE DATABASE $MYDATABASE"
fi

# Check for TABLE and create if it does not exists
TBLCHECK=`mysql -u"$USERNAME" -p"$PASSWORD" -e "SHOW TABLES;" $MYDATABASE | grep -Fo $MYTABLE`
if [ "$TBLCHECK" == "$MYTABLE" ]; then
   echo "Table exists"
else
   echo "Table does not exist. Creating table..."
   mysql -u"$USERNAME" -p"$PASSWORD" -e "CREATE TABLE $MYTABLE (IDENTIFIER VARCHAR(255), Date TIMESTAMP, Major VARCHAR(255), Origin VARCHAR(255), Color VARCHAR(255), Food VARCHAR(255), Rating NUMERIC(1); ALTER TABLE $MYTABLE ADD PRIMARY KEY (IDENTIFIER);" $MYDATABASE
fi

# Write data from tmp.csv into database table
echo "Writing new data to $MYTABLE in database $MYDATABASE."
mysql -u"$USERNAME" -p"$PASSWORD" -e "LOAD DATA INFILE '/var/lib/mysql-files/response.csv' INTO TABLE $MYTABLE FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '\"';" $MYDATABASE
echo "Data written successfully."
# Dump current version of database into export file
echo "Survey data dumped to file `date --iso-8601`-$MYDATABASE.sql"
mysqldump -u"$USERNAME" -p"$PASSWORD" $MYDATABASE > `date --iso-8601`-$MYDATABASE.sql
# Writing a temporary directory
TEMPDIR="./temp"

# Make temp directory
mkdir $TEMPDIR/
# Copy all CSV files into directory
cp ./*.csv $TEMPDIR/

# concatenate all data
cat $TEMPDIR/*.csv > ./compiled-data.csv

# clean up
rm -r $TEMPDIR