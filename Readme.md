## Plugin Sonar Validate  

Plugin for use in docker build step to validade sonar analises after analise code using sonar api project status  

### Environments docker build args  

- SONAR_URL  
- SONAR_PROJECT_KEY  
- SONAR_LOGIN  

##### Example for use:
```Dockerfile
FROM rfaguiar/sonar-validate:1.0.0 as validate

ARG SONAR_URL
ARG SONAR_PROJECT_KEY
ARG SONAR_LOGIN
ENV SONAR_URL $SONAR_URL
ENV SONAR_PROJECT_KEY $SONAR_PROJECT_KEY
ENV SONAR_LOGIN $SONAR_LOGIN

RUN npm test
```
