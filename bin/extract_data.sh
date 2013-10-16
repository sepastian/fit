#!/bin/bash

if [ $# != 1 ]; then
    echo "Usage: $(basename $0) CSV_FILE"
    exit 2
fi

FILE="$1"
if [ ! -f "$FILE" ]; then
    echo "Cannot read file '$FILE'."
    exit 1
fi

# The epoch in FIT files begins at 1989-12-31.
FIT_EPOCH="631062000"
echo "timestamp;lat;lon;dist;alt;speed;temp"
grep "^Data,.,record" "$FILE" | gawk -F "," -v e="$FIT_EPOCH" '{printf "%s;%s;%s;%s;%s;%s;%s\n",strftime("%c",($5+e)),$8,$11,$14,$17,$20,$23}'
