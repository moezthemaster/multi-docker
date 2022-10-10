#!/bin/bash
TRAVIS_DEPLOY_USER=$1
TRAVIS_DEPLOY_PASSWORD=$2

if [ "$TRAVIS_BRANCH" == "prod" ]; then
    docker build -t moezthemaster/multi-client ./client
    docker build -t moezthemaster/multi-nginx ./nginx
    docker build -t moezthemaster/multi-server ./server
    docker build -t moezthemaster/multi-worker ./worker
  # Log in to the docker CLI
    echo "$TRAVIS_DEPLOY_PASSWORD" | docker login -u "$TRAVIS_DEPLOY_USER" --password-stdin
  # Take those images and push them to docker hub
    docker push moezthemaster/multi-client
    docker push moezthemaster/multi-nginx
    docker push moezthemaster/multi-server
    docker push moezthemaster/multi-worker
fi