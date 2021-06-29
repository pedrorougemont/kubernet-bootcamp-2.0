FROM node:14.16.1-alpine3.13
WORKDIR /app
COPY ./api-conversao/package*.json ./
RUN npm install
COPY ./api-conversao/ .
EXPOSE 8080
CMD ["node","index.js"]