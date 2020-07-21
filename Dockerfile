FROM node:10-alpine

WORKDIR /home/src

COPY validate-nodejs-inline.js /home/src
COPY package.json /home/src

RUN npm i

ENTRYPOINT node validate-nodejs-inline.js