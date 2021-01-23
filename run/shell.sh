#!/usr/bin/env bash

REPO_DIR="ros-vscode-docker"
ROS_PKG="ros_docker"

DOCKER_IMAGE="sheaffej/${REPO_DIR}"
LABEL="b2"

[ -z "$ROS_MASTER_URI" ] && echo "Please set ROS_MASTER_URI env" && exit 1

MYDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
PROJ_DIR=$MYDIR/../..  # Directory containing the cloned git repos
CODE_MOUNT="/workspaces"

docker run -it --rm \
--label ${LABEL} \
--net host \
--privileged \
--env DISPLAY \
--env ROS_MASTER_URI \
--mount type=bind,source=$PROJ_DIR/${REPO_DIR},target=$CODE_MOUNT/${REPO_DIR} \
--mount type=bind,source=$HOME/Downloads,target=/root/Downloads \
${DOCKER_IMAGE} $@
