#!/bin/bash

# # cd ~/apps/AIAAS_API_GATEWAY
# echo "User: $(whoami)"
# echo "PM2 list:"
# /usr/bin/pm2 list
# git pull origin main
# npm install

# /usr/bin/pm2 reload api-gateway


cd ~/apps/AIAAS_API_GATEWAY

echo "Pulling latest code..."
git pull origin main

echo "Pulling latest Docker image..."
sudo docker pull shuvo173/khalid_bin_arif_aiaas-api-gateway-service1.0.0

echo "Restarting containers..."
sudo docker-compose up -d

echo "Cleaning unused images..."
sudo docker image prune -f

echo "Deployment done 🚀"