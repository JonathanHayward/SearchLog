#!/bin/bash
#
# searchlog	Script to start SearchLog search engine server.
#
# Author:       Jonathan Hayward <jonathan.hayward@pobox.com>
#
# description: SearchLog combines functionality from weblogs and search
#              engines, and has other applications, including PIM and keeping
#              track of ideas.

. /etc/init.d/functions

# See how we were called.
case "$1" in
  start)
    SERVER_EXECUTABLE_PATH 2>> PRIVATE_DATA_DIRECTORY/log
	;;
  stop)
	killall PROCESS_NAME
	;;
  status)
	if [ "`ps wwaux | grep PROCESS_NAME | grep nobody | grep -v grep | grep -v vim`a" == "a" ]
    then
        echo "SearchLog server not running."
    else
        echo "SearchLog server running."
    fi
	;;
  restart|reload)
	# do not do anything; this is unreasonable
	:
	;;
  *)
	# do not advertise unreasonable commands that there is no reason
	# to use with this device
	echo $"Usage: $0 {start|stop|status|restart|reload}"
	exit 1
    ;;
esac

exit 0
