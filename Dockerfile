FROM node:10-alpine

ARG SONAR_URL
ARG SONAR_PROJECT_KEY
ARG SONAR_LOGIN

ENV SONAR_URL=${SONAR_URL}
ENV SONAR_PROJECT_KEY=${SONAR_PROJECT_KEY}
ENV SONAR_LOGIN=${SONAR_LOGIN}

COPY index.js /home/src
COPY index.test.js /home/src
COPY package.json /home/src
WORKDIR /home/src

RUN npm i && npm run test