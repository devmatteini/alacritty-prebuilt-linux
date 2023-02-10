#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status
set -e

log() {
	BLUE="\e[1;37m"
	RESET="\e[0m"
	echo -e "${BLUE}${1}${RESET}"
}

log_info() {
	BLUE="\e[1;34m"
	RESET="\e[0m"
	echo -e "${BLUE}${1}${RESET}"
}

NAME="build-alacritty"
APP_BIN="$HOME/.local/bin"
APP_SHARE="$HOME/.local/share/applications"
APP_ICON="$HOME/.icons"
BASH_COMPLETION="$HOME/.local/share/bash-completion/completions"
CONTAINER_NAME="alacritty-assets"

log "Building docker image"
docker build -t "$NAME" .

log "Starting docker image daemon"
docker run --name ${CONTAINER_NAME} -d -i "$NAME"

log "Coping files from docker container"
docker cp ${CONTAINER_NAME}:/alacritty/target/release/alacritty ${APP_BIN}
docker cp ${CONTAINER_NAME}:/alacritty/extra/logo/alacritty-term.svg ${APP_ICON}/Alacritty.svg
docker cp ${CONTAINER_NAME}:/alacritty/extra/linux/Alacritty.desktop ${APP_SHARE}
docker cp ${CONTAINER_NAME}:/alacritty/extra/completions/alacritty.bash ${BASH_COMPLETION}/alacritty
log_info "To update desktop icons run 'sudo update-desktop-database'"

log "Stopping and removing docker containers"
docker stop ${CONTAINER_NAME}
docker rm ${CONTAINER_NAME}
