# YOUR NAME
$USER = ''
# configure the project name
$PROJECT = ''

# DATABASE NAME
$DB = ''

#HOST
# create a new container with the given data (this is just for the mount)
$ID=(docker run -d -name $PROJECT -v /vagrant/$PROJECT/:/srv/http -p 80  $USER/lamp)
# stop it
docker stop $ID
# save changes as project image with base tag
docker commit $ID $USER/$PROJECT:base
# remove the container
docker rm $ID

# create a new container of the image and configure/whatever is necessary
$ID=(docker run -t -v /vagrant/$PROJECT/:/srv/http -p 80 $USER/$PROJECT:base /srv/http/bootstrap-docker-inner.sh)

# save the state
docker commit $ID $USER/$PROJECT:app
# remove the container
docker rm $ID

