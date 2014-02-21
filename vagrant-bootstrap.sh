$USER = 'alexanderjulo'

# update package lists
apt-get -y update

# install git to be able to build from git with docker
apt-get -y install git

# install my custom docker image
docker build -t $USER/lamp git://github.com/alexex/docker-lamp.git

# that's it. :)
