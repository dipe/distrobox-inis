#!/bin/bash
apt-get update && apt-get upgrade -y
apt-get install -y libfuse2 libasound2t64 wget curl jq
DEB_URL=$(curl -s https://api.github.com/repos/thomasnordquist/MQTT-Explorer/releases \
  | jq -r 'first | .assets[] | select(.name | endswith(".deb")) | .browser_download_url' \
  | head -1)
# oder:
# DEB_URL=https://github.com/thomasnordquist/MQTT-Explorer/releases/download/v0.4.0-beta.6/MQTT-Explorer-0.4.0-beta.6.deb
wget -O /tmp/mqtt-explorer.deb "$DEB_URL"
apt-get install -y /tmp/mqtt-explorer.deb
rm /tmp/mqtt-explorer.deb
