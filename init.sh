#!/bin/bash

# Install Just
wget -qO - 'https://proget.makedeb.org/debian-feeds/prebuilt-mpr.pub' | gpg --dearmor | sudo tee /usr/share/keyrings/prebuilt-mpr-archive-keyring.gpg 1> /dev/null
echo "deb [arch=all,$(dpkg --print-architecture) signed-by=/usr/share/keyrings/prebuilt-mpr-archive-keyring.gpg] https://proget.makedeb.org prebuilt-mpr $(lsb_release -cs)" | sudo tee /etc/apt/sources.list.d/prebuilt-mpr.list
sudo apt update

sudo apt install just

# Install NodeJS & NPM
sudo apt install nodejs
sudo apt install npm
sudo npm install -g typescript

# Clone the media-stream-library-js
git submodule update

pushd media-stream-library-js

just
just build

popd


cp ./media-stream-library-js/player/dist/media-stream-player.min.js ./src/public/js/media-stream-player.min.js
