#!/bin/bash

cd /home/steam/serverfiles/cfg

sed -i  "s/^headlessClients.*/headlessClients[]=\{\"$CLIENT_IP\", \"$CLIENT_IP2\", \"$CLIENT_IP3\", \"$CLIENT_IP4\", \"$CLIENT_IP5\", \"$CLIENT_IP6\" \};/" ./arma3-server.server.cfg
sed -i  "s/^localClient.*/localClient[]=\{\"$CLIENT_IP\", \"$CLIENT_IP2\", \"$CLIENT_IP3\", \"$CLIENT_IP4\", \"$CLIENT_IP5\", \"$CLIENT_IP6\" \};/" ./arma3-server.server.cfg
