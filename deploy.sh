# #!/bin/bash
# echo "Hello"; 
# export NVM_DIR="$HOME/.nvm"
# source ~/.bashrc

# cd ~/apps/AIAAS_API_GATEWAY

# git pull origin main
# npm install

# /usr/bin/pm2 reload api-gateway

echo "User: $(whoami)"
echo "PM2 list:"
/usr/bin/pm2 list