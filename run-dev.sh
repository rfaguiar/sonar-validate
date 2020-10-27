export $(cat .env)

docker run \
  --rm --name sonar-validate \
  -e SONAR_URL=${SONAR_URL} \
  -e SONAR_PROJECT_KEY=${SONAR_PROJECT_KEY} \
  -e SONAR_LOGIN=${SONAR_LOGIN} \
  rfaguiar/sonar-validate:2.0.1
