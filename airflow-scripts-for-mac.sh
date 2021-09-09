# open Terminal on my Mac and get to the root folder
cd ~

# create airflow_learning directory
mkdir airflow_learning && cd airflow_learning

# install python virtual environment
sudo -H pip3 install virtualenv

# create virtual environment and activate it
virtualenv -p python3 airflow_venv
source airflow_venv/bin/activate

# should see (airflow_venv) before the root folder name in Terminal

# install airflow in this virtual environment
sudo -H pip3 install apache-airflow

# create a new directory in this directory and name it airflow
mkdir airflow && cd airflow

# get the full path of airflow directory
pwd

# set the path of airflow directory, replace My_Username with relevant user name
export AIRFLOW_HOME=/Users/My_Username/airflow_learning/airflow

# leave the airflow directory
cd

# initialize the database
airflow db init

# create Apache Airflow user to solve WARNING: No user yet created, use flask fab command to do it.
FLASK_APP=airflow.www.app flask fab create-admin

# provide your user login credentials and save
# Username [admin]: 
# User first name [admin]: 
# User last name [user]: 
# Email [admin@fab.org]: 
# Password: 
# Repeat for confirmation: 

# you should see: 'Recognized Database Authentications. Admin User admin created.'

# go to the airflow_learning folder in new terminal and activate the virtual environment
cd airflow_learning
source airflow_venv/bin/activate

# set the path once again, - replace My_Username with relevant user name
export AIRFLOW_HOME=/Users/My_Username/airflow_learning/airflow

# check what is happening on port 8080
sudo lsof -i :8080 | grep LISTEN

# start the web server, use the old Terminal window
# default port for Airflow is 8080 but I already have some processes running on 8080, hence the need to choose a different port
airflow webserver -p 3000

# start the scheduler, open a new Terminal window
airflow scheduler

# visit "localhost:3000" in the browser and log in
