export $(cat .env)

#docker run \
#    --rm --name sonar-validate  \
#    -e SONAR_URL=${SONAR_URL} \
#    -e SONAR_PROJECT_KEY=${SONAR_PROJECT_KEY} \
#    -e SONAR_LOGIN=${SONAR_LOGIN} \
#    --network="host" \
#    rfaguiar/sonar-validate:2.0.0

IMAGE_NAME=sonar-validate

docker build \
    -t $IMAGE_NAME \
    --build-arg SONAR_URL=${SONAR_URL} \
    --build-arg SONAR_PROJECT_KEY=${SONAR_PROJECT_KEY} \
    --build-arg SONAR_LOGIN=${SONAR_LOGIN} \
    -f Dockerfile.run \
    https://github.com/rfaguiar/sonar-validate.git#master
    
docker rmi $IMAGE_NAME
