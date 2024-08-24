#!/bin/bash

# Execute SQL Parts Import via BigDump in Browser

# Set the domain and directory for BigDump
DOMAIN="URL"
BIGDUMP_DIR="_bdd"

# Total number of SQL parts
TOTAL_PARTS=37  # Replace with the actual number of parts

# Time to wait between imports (in seconds)
WAIT_TIME=60  # 1 minutes

for i in $(seq 1 $TOTAL_PARTS); do
    # Construct the URL for the current part
    SQL_PART="part_${i}.sql"
    URL="${DOMAIN}/${BIGDUMP_DIR}/bigdump.php?start=1&fn=${SQL_PART}&foffset=0&totalqueries=0&delimiter=%3B"

    # Open the URL in the default browser
    if command -v xdg-open > /dev/null; then
        xdg-open "$URL"
    elif command -v open > /dev/null; then
        open "$URL"
    elif command -v start > /dev/null; then
        start "$URL"
    else
        echo "Could not detect the default browser. Please open this URL manually: $URL"
    fi

    # Wait for the specified time before proceeding to the next part
    sleep $WAIT_TIME
done