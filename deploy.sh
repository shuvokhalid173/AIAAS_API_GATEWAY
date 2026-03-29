#!/bin/bash

cd ~/apps/AIAAS_API_GATEWAY
git pull origin main
npm install
pm2 reload server