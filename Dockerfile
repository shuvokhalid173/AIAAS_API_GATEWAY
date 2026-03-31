FROM node:22-alpine

WORKDIR /app

COPY package*.json ./
RUN npm ci --only=production

COPY . .

EXPOSE ${PORT}

CMD ["node", "src/server.js"]

# docker run -d -p 5555:5555 --name aiaas_api_gateway_service shuvo173/khalid_bin_arif_aiaas-api-gateway-service1.0.0
# docker run -d -p 5555:5555 --name aiaas_api_gateway_service -e PORT=5555 shuvo173/khalid_bin_arif_aiaas-api-gateway-service1.0.0