#!/bin/bash
echo "User: $(whoami)"

cd ~/apps/AIAAS_API_GATEWAY
git pull origin main
npm install

echo "PM2 list:"
/usr/bin/pm2 list
/usr/bin/pm2 reload api-gateway

# pm2 start src/server.js --name "api-gateway" -i max