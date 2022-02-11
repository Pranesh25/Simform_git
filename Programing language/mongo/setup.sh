#! /bin/bash

# refernce for the mongodb setup
#https://docs.mongodb.com/manual/tutorial/install-mongodb-on-ubuntu/

wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/5.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-5.0.list
sudo apt-get update
sudo apt-get install -y mongodb-org
sudo systemctl start mongod
sudo systemctl status mongod
sudo systemctl enable mongod
sudo systemctl stop mongod
sudo systemctl restart mongod
sudo systemctl enable mongod

#run this command to run mongo on terminal
mongosh

# below is optional if you donot have a dataset to play with we can download it from the net

wget https://raw.githubusercontent.com/mongodb/docs-assets/primer-dataset/primer-dataset.json

sudo mongoimport --db <your database name> --collection restaurants --file primer-dataset.json

sudo mongo <database name>

# run the below commands in mongodb to see the datasets is working or not

db.restaurants.count()

db.restaurants.findOne() 

# if you have a dataset and you want to export it then use the following command accordingly

sudo mongoexport --db <database name> -c restaurants --out newdbexport.json

# to makeup backup use the following command
sudo mkdir /tmp/mongobackups

sudo mongodump --db <database name> --out /tmp/mongobackups/`date +"%m-%d-%y"`
# 				out here is used to dump the backup
sudo crontab -e

0 11 * * * bash /home/praneshprashar/Desktop/mongo/mongodb.sh

# if you want to remove database for specif date use the following command

find /var/backups/mongobackups/ -mtime +7 -exec rm -rf {} \;

# if you want to restore the file
sudo mongorestore --db newdb --drop /var/backups/mongobackups/10-29-20/newdb/











