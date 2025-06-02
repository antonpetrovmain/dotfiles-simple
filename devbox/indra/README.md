# How to setup MET development environment in docker

Build and run the container:

docker compose up --build -d

Copy the env tar to home directory if env is not setup:

docker cp met-env.tar devbox-indra-met:/home/ubuntu/
docker attach devbox-indra-met
su ubuntu
cd
tar -xvf env.tar

Setup the dotfiles:
./dotfiles/setup.sh
./dotfiles/setup_tools.sh

Once you exit the container, start it again using:

docker start -ai devbox-indra-met



