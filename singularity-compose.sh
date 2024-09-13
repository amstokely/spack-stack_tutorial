#!/bin/bash

IMAGE_NAME=${2:-}

case $1 in
build)
    if [ -z "$IMAGE_NAME" ]; then
    echo "Building images..."
    singularity build --fakeroot images/npm_install.sif images/npm_install.def
    singularity build --fakeroot images/spack-stack_tutorial.sif images/spack-stack_tutorial.def
    elif [ "$IMAGE_NAME" == "npm_install" ]; then
    echo "Building npm_install image..."
    singularity build --fakeroot images/npm_install.sif images/npm_install.def
    elif [ "$IMAGE_NAME" == "spack-stack_tutorial" ]; then
    echo "Building spack-stack_tutorial image..."
    singularity build --fakeroot images/spack-stack_tutorial.sif images/spack-stack_tutorial.def
    else
    echo "Supported images: npm_install, spack-stack_tutorial"
    fi
    ;;
up)
    if [[ -z $IMAGE_NAME ]]; then
    echo "Starting services..."
    singularity instance start images/spack-stack_tutorial.sif spack-stack_tutorial
    elif [ "$IMAGE_NAME" == "spack-stack_tutorial" ]; then
      echo "Starting spack-stack_tutorial service..."
    singularity instance start images/spack-stack_tutorial.sif spack-stack_tutorial
    else
    echo "Supported images: spack-stack_tutorial"
    fi
    ;;
down)
  if [[ -z $IMAGE_NAME ]]; then
    echo "Stopping services..."
    singularity instance stop spack-stack_tutorial
  elif [ "$IMAGE_NAME" == "spack-stack_tutorial" ]; then
    echo "Stopping spack-stack_tutorial service..."
    singularity instance stop spack-stack_tutorial
  else
    echo "Supported images: spack-stack_tutorial"
  fi
    ;;
run)
    if [[ -z $IMAGE_NAME ]]; then
    echo "Running services..."
    singularity run instance://spack-stack_tutorial &
    elif [ "$IMAGE_NAME" == "spack-stack_tutorial" ]; then
    echo "Running spack-stack_tutorial service..."
    singularity run instance://spack-stack_tutorial &
    else
    echo "Supported images: spack-stack_tutorial"
    fi
    ;;
  prune)
    if [[ -z $IMAGE_NAME ]]; then
    echo "Pruning services..."
    rm -rf images/*.sif
    elif [ "$IMAGE_NAME" == "npm_install" ]; then
    echo "Pruning npm_install service..."
    rm -rf images/npm_install.sif
    elif [ "$IMAGE_NAME" == "spack-stack_tutorial" ]; then
    echo "Pruning spack-stack_tutorial service..."
    rm -rf images/spack-stack_tutorial.sif
    else
    echo "Supported images: npm_install, spack-stack_tutorial"
    fi
    ;;
*)
    echo "Supported commands: up, down, build, run"
    ;;

esac