export $(cat .env)

docker build \
    -t rfaguiar/sonar-validate:2.0.0 \
    --build-arg SONAR_URL=${SONAR_URL} \
    --build-arg SONAR_PROJECT_KEY=${SONAR_PROJECT_KEY} \
    --build-arg SONAR_LOGIN=${SONAR_LOGIN} \
    -f Dockerfile \
    .