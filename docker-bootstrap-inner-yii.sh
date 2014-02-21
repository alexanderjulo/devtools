# run all the services of my image
supervisord &>/dev/null &
# create the DB
mysql -e "CREATE DATABASE $DB";
# change to the yii directory
cd /srv/http/protected
# run the migrations for mysql
./yiic migrate up --connectionID=dbMY
# stop mysqld to make sure everything is saved correctly
supervisorctl stop mysqld
