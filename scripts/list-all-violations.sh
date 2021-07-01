#!/bin/bash

repo=$1

# Get directory of the script.
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

if [ -z ${ORT_DOCKER_IMAGE+x }];
then
  echo "\$ORT_DOCKER_IMAGE has not been set."
  echo "Set the variable to ORT image to use the scripts."
  exit 1
fi

mkdir -p $SCRIPT_DIR/../violations/$repo

for pkg in $(yq e '.evaluator.violations[] | [select(.severity == "ERROR").pkg] | unique | .[]' $SCRIPT_DIR/../ort-results/$repo/evaluate/evaluation-result.yml );
do
  echo "Listing violations for $pkg"
  $SCRIPT_DIR/list-licenses.sh $repo $pkg > $SCRIPT_DIR/../violations/$repo/$pkg
done

