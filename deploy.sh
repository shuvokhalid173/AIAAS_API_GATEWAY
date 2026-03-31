#!/bin/bash

# cd ~/apps/AIAAS_API_GATEWAY
echo "User: $(whoami)"
echo "PM2 list:"
/usr/bin/pm2 list
git pull origin main
npm install

/usr/bin/pm2 reload api-gateway