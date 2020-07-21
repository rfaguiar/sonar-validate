## Plugin Sonar Validate  

Plugin for use in docker build step to validade sonar analises after analise code using sonar api project status  

### Environments docker build args  

- SONAR_URL  
- SONAR_PROJECT_KEY  
- SONAR_LOGIN  

##### Example for use:
```Shell
docker run \
    --rm --name sonar-validate  \
    -e SONAR_URL=${SONAR_URL} \
    -e SONAR_PROJECT_KEY=${SONAR_PROJECT_KEY} \
    -e SONAR_LOGIN=${SONAR_LOGIN} \
    rfaguiar/sonar-validate:2.0.1
```
