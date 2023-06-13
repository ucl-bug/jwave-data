i#!/bin/bash
# Loads the test data from the jwave repository to the appropriate folders
# Usage: ./get_data.sh

# Check if a file called SETTINGS exists, otherwise exit
if [ ! -f SETTINGS ]; then
  echo "SETTINGS not found. Exiting."
  exit 1
fi

source SETTINGS

echo "jwave location is: $JWAVE_PATH"
echo "Syncing data..."

# Perform rsync on $JWAVE_PATH/tests/kwave_data to the kwave_data folder
rsync -av $JWAVE_PATH/tests/kwave_data/*.mat tests/kwave_data/
rsync -av $JWAVE_PATH/tests/regression_data/*.mat tests/regression_data/

echo "Data synced."

# Remove last line of README.md
sed -i '$ d' README.md

# Write the current date to the README.md file
echo "Last updated: $(date)" >> README.md
