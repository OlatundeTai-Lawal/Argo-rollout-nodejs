# Set the base image to use for subsequent instructions
FROM node:alpine

# Set the working directory for any subsequent ADD, COPY, CMD, ENTRYPOINT,
# or RUN instructions that follow it in the Dockerfile
WORKDIR /app

# Copy files or folders from source to the dest path in the image's filesystem.
COPY package.json /app/
COPY . /app/

# Execute any commands on top of the current image as a new layer and commit the results.
RUN npm install --production

# Define the network ports that this container will listen to at runtime.
EXPOSE 3000

# Configure the container to be run as an executable.
ENTRYPOINT ["npm", "start"]
