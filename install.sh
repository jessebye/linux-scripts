#!/usr/bin/env bash

sudo apt-get update
sudo apt-get upgrade -y

sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    wget \
    software-properties-common \
    git \
    zsh \
    python3 \
    python3-pip

# Chrome
wget -O chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i chrome.deb
sudo apt-get install -f -y
rm chrome.deb

# Slack
wget -O slack.deb https://downloads.slack-edge.com/linux_releases/slack-desktop-3.2.1-amd64.deb
sudo dpkg -i slack.deb
sudo apt-get install -f -y
rm slack.deb

# Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update
sudo apt-get install docker-ce docker-compose

sudo groupadd docker
sudo usermod -aG docker $USER

# Terraform
mkdir -p $HOME/.local/bin
wget -O terraform.zip https://releases.hashicorp.com/terraform/0.11.7/terraform_0.11.7_linux_amd64.zip
unzip terraform.zip terraform -d $HOME/.local/bin
rm terraform.zip

# VSCode
wget -O vscode.deb https://go.microsoft.com/fwlink/?LinkID=760868
sudo dpkg -i vscode.deb
sudo apt-get install -f -y
rm vscode.deb

# DBeaver
wget -O dbeaver.deb https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb
sudo dpkg -i dbeaver.deb
sudo apt-get install -f -y
rm dbeaver.deb

# Postman
wget https://dl.pstmn.io/download/latest/linux64 -O postman.tar.gz
sudo tar -xzf postman.tar.gz -C /opt
rm postman.tar.gz
sudo ln -s /opt/Postman/Postman /usr/bin/postman
cat > $HOME/.local/share/applications/postman.desktop <<EOL
[Desktop Entry]
Encoding=UTF-8
Name=Postman
Exec=postman
Icon=/opt/Postman/resources/app/assets/icon.png
Terminal=false
Type=Application
Categories=Development;
EOL

# Spotify
snap install spotify

# Salt
wget -O - https://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest/SALTSTACK-GPG-KEY.pub | sudo apt-key add -
echo 'deb http://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest xenial main' | sudo tee -a /etc/apt/sources.list.d/saltstack.list
sudo apt update && sudo apt install -y salt-master

# Python Dev
pip install yapf pylint
pip3 install yapf pylint
