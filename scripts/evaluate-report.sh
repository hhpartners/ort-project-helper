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

docker run \
  -v $SCRIPT_DIR/../:/project \
  $ORT_DOCKER_IMAGE --info --force-overwrite evaluate \
  --ort-file /project/ort-results/$repo/scan/scan-result.yml \
  --output-dir /project/ort-results/$repo/evaluate \
  --rules-file /project/ort-config/rules.kts \
  --license-classifications-file project/ort-config/license-classifications.yml \
  --package-curations-file /project/ort-config/curations.yml \
  --repository-configuration-file /project/ort-config/$repo.ort.yml \
  --package-configuration-dir /project/ort-config/package-configurations/ || true

docker run \
  -v $SCRIPT_DIR/../:/project \
  $ORT_DOCKER_IMAGE --info --force-overwrite report \
  --ort-file /project/ort-results/$repo/evaluate/evaluation-result.yml \
  --output-dir /project/ort-results/$repo/report \
  --report-formats StaticHtml,NoticeTemplate \
  --report-option NoticeTemplate=template.id=summary,default \
  --package-configuration-dir /project/ort-config/package-configurations/ \
  --license-classifications-file /project/ort-config/license-classifications.yml \
  --repository-configuration-file /project/ort-config/$repo.ort.yml \
  --resolutions-file /project/ort-config/resolutions.yml

