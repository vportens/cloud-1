echo "[INFO]  STARTING Install dependencies"


apt update && sudo apt upgrade -y

apt install apt-transport-https ca-certificates curl software-properties-common -y


curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt update

apt install docker-ce -y

echo "[INFO]  FINISHED Install docker : $(docker --version) "

curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

chmod +x /usr/local/bin/docker-compose

apt install make

sudo apt-get update
sudo apt-get install openssl

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout server.key -out server.crt -subj "/C=FR/ST=Ile-de-France/L=Paris/O=42/OU=MonDepartement/CN=monserveur.local/emailAddress=viporten@student42.fr"

