#!/bin/bash

repo=$1
package=$2

# Get directory of the script.
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

orth --info package-configuration create \
  --scan-results-storage-dir $SCRIPT_DIR/../scan-results/$repo \
  --output-dir $SCRIPT_DIR/../ort-configuration-files/package-configurations/ \
  --create-hierarchical-dirs \
  --package-id $package