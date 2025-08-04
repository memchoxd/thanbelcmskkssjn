#!/bin/sh
# Kill all processes that use "sh -c" continuously

while true; do
    ps -eo pid,cmd | grep "sh -c" | grep -v grep | awk '{print $1}' | xargs -r kill -9
    sleep 1
done
