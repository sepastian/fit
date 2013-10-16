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

echo "total_elapsed_time;total_timer_time;total_dist;avg_speed;max_speed;total_asc;total_desc"
grep "^Data,9,session" "$FILE" | awk -F "," '{printf "%s;%s;%s;%s;%s;%s;%s\n",$17,$20,$23,$47,$50,$53,$56}'
