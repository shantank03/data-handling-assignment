#!/bin/bash

# Set MySQL Credentials
USERNAME=root
PASSWORD=changethis

# Set up Database and Table information
MYDATABASE=coursesurvey
MYTABLE=tblSurveyResponses

# Copy data into MySQL Secure directory
sudo cp ./response.csv /var/lib/mysql-files/

# Check for the Database and create if it does not exist
echo "Searching for Database"
DBCHECK=`mysql -u"$USERNAME" -p"$PASSWORD" -e "SHOW DATABASES;" | grep -Fo $MYDATABASE`
if [ "$DBCHECK" == "$MYDATABASE" ]; then
  echo "Database exists"
else
  echo "Database not created. Creating database..."
  mysql -u"$USERNAME" -p"$PASSWORD" -e "CREATE DATABASE $MYDATABASE;"
fi

# Check for TABLE and create if it does not exists
TBLCHECK=`mysql -u"$USERNAME" -p"$PASSWORD" -e "SHOW TABLES;" $MYDATABASE | grep -Fo $MYTABLE`
if [ "$TBLCHECK" == "$MYTABLE" ]; then
   echo "Table exists"
else
   echo "Table does not exist. Creating table..."
   mysql -u"$USERNAME" -p"$PASSWORD" -e "CREATE TABLE $MYTABLE (Identifier VARCHAR(255), Date TIMESTAMP, Major VARCHAR(255), Origin VARCHAR(255), Color VARCHAR(255), Food VARCHAR(255), Rating NUMERIC(1); ALTER TABLE $MYTABLE ADD PRIMARY KEY (IDENTIFIER);" $MYDATABASE
fi

# Write data from tmp.csv into database table
echo "Writing new data to $MYTABLE in database $MYDATABASE."
mysql -u"$USERNAME" -p"$PASSWORD" -e "LOAD DATA INFILE '/var/lib/mysql-files/response.csv' INTO TABLE $MYTABLE FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '\"';" $MYDATABASE
echo "Data written successfully."
# Dump current version of database into export file
echo "Survey data dumped to file `date --iso-8601`-$MYDATABASE.sql"
mysqldump -u"$USERNAME" -p"$PASSWORD" $MYDATABASE > `date --iso-8601`-$MYDATABASE.sql

# remove file in sql directory
sudo rm /var/lib/mysql-files/response.csv