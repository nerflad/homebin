#!/usr/bin/env sh

# Download lists, unpack and filter, write to stdout
curl -s https://www.iblocklist.com/lists.php \
    | sed -n "s/.*value='\(http[^']*\)'.*/'\1'/p" \
    | xargs wget -O - \
    | gunzip \
    | egrep -v '^#' > ~/Documents/torrent_blocklist_url.txt
