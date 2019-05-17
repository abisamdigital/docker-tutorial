# docker-tutorial
Docker tutorial for The Bureau

# Quick tips:
* A docker file is a set of instructions to Docker on what to install in your image when it is built.

* Docker image repositories are Docker certified images that you can use to build your base image. https://hub.docker.com/search/?type=image

* Dockerfile base images: This is the base image of your container. For instance, if you're looking to deploy a Node JS based container, you'd say this:
  * `FROM node:10.15.3-alpine` (this will build a container with the node 10.15.3 base image.)
  * You can find NodeJS images at https://hub.docker.com/_/node.
  * [Dev tip] Generally it’s good to match up your local node version with this container’s version so you can debug more easily. Do this by going to Terminal and typing `node --version` and match it up with the `FROM node:<version>`.

* Once docker file is built using:
  * `docker build .` (builds with no tag)
  * `docker build . -t foo-node:latest` (builds image with tag specified)

* Type `docker images` to see all images.
* Type `docker run <image ID>` to run the container, but if the container isn’t told to do anything, *it starts up and shuts down immediately*.
* However, you can simply use the `-it` flag to map to keyboard input. So do `docker run -it <image ID> /bin/sh` to use the shell inside the container.
  * In the shell that's opened, type `ls` to confirm you're actually inside the container (you'll see the source files from the repo).
* Open a different shell window and type `docker ps` (where ps = processes), and you’ll see the running container.
* Type `exit` into the running container (whose bash you're interacting with) so that shell exits, which will cause the container to shut down.
* Now do `docker ps` in the second terminal window; you’ll find that no container is running.
# Testing with a Node Server
* Now to make sure that we can see how the container is running the node server, we do this:
  * Since docker containers run in a virtual network, we need to map their port to a local port using the -p flag.
  * Docker also will capture the input in bash if we don’t run it in the background. To to this, use the -detatch or -d flag.
  * `docker run -d -p 8000:8000 -it <image ID> node server.js`

* You can stop a running container using:
  * `docker ps` (to get all running container processes)
  * `docker stop container_id`
