# Start from golang base image
FROM golang:alpine as builder

# Add Maintainer info
LABEL maintainer="Rogério Aguiar <rfaguiar1@gmail.com>"


# Set the current working directory inside the container
WORKDIR /app

# Copy the source from the current directory to the working Directory inside the container
COPY main.go ./sonar-validate.go

# Build the Go app
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o sonar-validate .

# Start a new stage from scratch
FROM alpine:latest
RUN apk --no-cache add ca-certificates

WORKDIR /root/

# Copy the Pre-built binary file from the previous stage
COPY --from=builder /app/sonar-validate .
#COPY --from=builder /app/database/migrations ./database/migrations

# Expose port 9000 to the outside world
#EXPOSE 9000

#Command to run the executable
CMD ["./sonar-validate"]