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

sed '1d' "$FILE" | \
awk -v columns="$(head -1 ${FILE})" -F ',' 'BEGIN{ split(columns,c,",") }{ for(i=1;i<=NF;i++){ printf("%03d %s: %s\n", i, c[i], $i) }; print "--------"}'
