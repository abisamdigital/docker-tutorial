# Specify the base image to use for the container.
FROM node:10.15.3-alpine 

# Tells Docker what directory to use, creates it if it doesn't exist.
WORKDIR /app

# Takes 2 params: what to copy and where to copy it to.
COPY . /app
