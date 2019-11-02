#! /bin/bash

if [ $# -ne 1 ];then
  echo "Error: usage: $0 <repo>"
  exit 1
fi

wget -O - https://raw.githubusercontent.com/dperezcabrera/installer/master/installer.sh | bash

REPO=https://github.com/dperezcabrera/$1.git
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
