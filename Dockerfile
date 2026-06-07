FROM node:12-alpine

WORKDIR /app

COPY package*.json ./

RUN npm install && \
    sed -i 's/process.EventEmitter/require("events").EventEmitter/g' node_modules/socket.io/lib/store.js

COPY . .

EXPOSE 8888

CMD ["node","index.js"]
