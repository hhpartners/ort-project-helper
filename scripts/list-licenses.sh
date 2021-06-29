#!/bin/bash

repo=$1
package=$2

# Get directory of the script.
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

orth --info list-licenses \
  --ort-file $SCRIPT_DIR/../ort-results/$repo/evaluate/evaluation-result.yml \
  --package-id $package \
  --offending-only \
  --offending-severity ERROR \
  --omit-excluded \
  --apply-license-finding-curations \
  --package-configuration-dir $SCRIPT_DIR/../ort-config/package-configurations/

