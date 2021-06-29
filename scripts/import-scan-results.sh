#!/bin/bash

repo=$1

# Get directory of the script.
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

orth --info import-scan-results \
  --ort-file $SCRIPT_DIR/../ort-results/$repo/evaluate/evaluation-result.yml \
  --scan-results-storage-dir $SCRIPT_DIR/../scan-result-dirs/$repo

