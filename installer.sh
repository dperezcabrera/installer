#! /bin/bash

wget -O - https://raw.githubusercontent.com/dperezcabrera/installer/master/installer.sh | bash

REPOSITORY="${REPOSITORY:-lab}"

REPO=https://github.com/dperezcabrera/$REPOSITORY.git
DIR=/tmp/temp_lab

function prepare() {
	if [ ! -d "$DIR" ]; then
		mkdir "$DIR"
	fi
	if [ -d "$DIR/lab" ]; then
		rm -rf "$DIR/lab"
	fi
}

function main() {
	prepare
	git clone $REPO "$DIR/lab"
	"$DIR/lab/install-services.sh"
}

main "$@"
