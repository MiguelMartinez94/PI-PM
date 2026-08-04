FROM node:20-alpine

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

ENV EXPO_USE_V2_RESOLVER=1
ENV EXPO_DEVTOOLS_LISTEN_ADDRESS=0.0.0.0

CMD ["npx", "expo", "start", "--web", "--host", "localhost", "--port", "8081"]
