#!/bin/sh

nexu() {
	echo "Running 'Nowina NexU'..."
	socat TCP4-LISTEN:9796,fork,reuseaddr TCP-CONNECT:127.0.0.1:9795 &
	socat TCP4-LISTEN:9896,fork,reuseaddr TCP-CONNECT:127.0.0.1:9895 &

	sudo -u user -H -- java -Djavafx.preloader=lu.nowina.nexu.NexUPreLoader -Dglass.accessible.force=false -jar nexu.jar
}


pcscd
"$@"
