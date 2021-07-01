#!/bin/bash

repo=$1

# Get directory of the script.
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

mkdir -p $SCRIPT_DIR/../violations

for pkg in $(yq e '.evaluator.violations[] | .pkg' $SCRIPT_DIR/../ort-results/$repo/evaluate/evaluation-result.yml );
do
  echo "Listing violations for $pkg"
  $SCRIPT_DIR/list-licenses.sh $repo $pkg > $SCRIPT_DIR/../violations/$pkg
done

