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

docker run --rm \
  -v $SCRIPT_DIR/../:/project \
  $ORT_DOCKER_IMAGE --info --force-overwrite analyze \
  --input-dir /project/source-repositories/$repo \
  --output-dir /project/ort-results/$repo/analyze \
  --package-curations-file /project/ort-config/curations.yml

docker run --rm \
  -v $SCRIPT_DIR/../:/project \
  $ORT_DOCKER_IMAGE --info --force-overwrite scan \
  --ort-file /project/ort-results/$repo/analyze/analyzer-result.yml \
  --output-dir /project/ort-results/$repo/scan

