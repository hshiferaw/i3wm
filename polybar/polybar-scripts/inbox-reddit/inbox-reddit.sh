#!/bin/sh

url="https://www.reddit.com/user/TeslaTeam"
unread=$(curl -sf "$url" | jq '.["data"]["children"] | length')

case "$unread" in
    ''|*[!0-9]*)
	unread=0
esac;

if [ "$unread" -gt 0 ]; then
   echo "#1 $unread"
else
   echo "#2"
fi
