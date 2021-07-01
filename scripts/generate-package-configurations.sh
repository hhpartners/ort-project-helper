#!/bin/bash

repo=$1
package=$2

# Get directory of the script.
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

if [ -z ${ORT_DOCKER_IMAGE+x }];
then
  echo "\$ORT_DOCKER_IMAGE has not been set."
  echo "Set the variable to ORT image to use the scripts."
  exit 1
fi

docker run --entrypoint /opt/ort/bin/orth \
  -v $SCRIPT_DIR/../:/project \
  $ORT_DOCKER_IMAGE --info package-configuration create \
  --scan-results-storage-dir /project/scan-result-dirs/$repo \
  --output-dir /project/ort-config/package-configurations/ \
  --create-hierarchical-dirs \
  --package-id $package
