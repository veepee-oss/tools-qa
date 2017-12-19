#!/bin/bash

KEEP_ALIVE=${KEEP_ALIVE:-"0"}

/bin/bash /usr/local/bin/mvn-entrypoint.sh "$@"

if [ "x$KEEP_ALIVE" == "x1" ]; then
	echo "Running container in interactive mode"
	trap "exit 0" SIGINT SIGTERM
	while :
	do
		echo `date` $ME - "Ping"
		sleep 600
	done
fi
exit 0

