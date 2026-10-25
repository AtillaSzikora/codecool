FROM node:24-alpine3.24

WORKDIR /app

RUN apk add bash

COPY . .

RUN npm i

EXPOSE 8080

CMD ["node", "index.js"]
