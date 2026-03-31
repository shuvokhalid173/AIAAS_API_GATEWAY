#!/bin/bash

cd ~/apps/AIAAS_API_GATEWAY
git pull origin main
npm install
pm2 reload api-gateway

# pm2 start src/server.js --name "api-gateway" -i max