FROM node:8-alpine

WORKDIR /home/src

COPY validate.js /home/src
COPY validate.test.js /home/src
COPY package.json /home/src

RUN npm i
#command to run sonar validate
#ARG SONAR_URL
#ARG SONAR_PROJECT_KEY
#ARG SONAR_LOGIN
#ENV SONAR_URL=${SONAR_URL}
#ENV SONAR_PROJECT_KEY=${SONAR_PROJECT_KEY}
#ENV SONAR_LOGIN=${SONAR_LOGIN}
#RUN npm test