#!/bin/bash

repo=$1

# Get directory of the script.
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

ort --info --force-overwrite analyze \
  --input-dir $SCRIPT_DIR/../source-repositories/$repo \
  --output-dir $SCRIPT_DIR/../ort-results/$repo/analyze \
  --package-curations-file $SCRIPT_DIR/../ort-config/curations.yml

ort --info --force-overwrite scan \
  --ort-file $SCRIPT_DIR/../ort-results/$repo/analyze/analyzer-result.yml \
  --output-dir $SCRIPT_DIR/../ort-results/$repo/scan

