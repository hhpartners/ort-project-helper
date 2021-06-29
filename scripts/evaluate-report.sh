#!/bin/bash

repo=$1

# Get directory of the script.
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

ort --info --force-overwrite evaluate \
  --ort-file $SCRIPT_DIR/../ort-results/$repo/scan-result.yml \
  --output-dir $SCRIPT_DIR/../ort-results/$repo/evaluate \
  --rules-file $SCRIPT_DIR/../ort-configuration-files/rules.kts \
  --license-classifications-file $SCRIPT_DIR/../ort-configuration-files/license-classifications.yml \
  --package-curations-file $SCRIPT_DIR/../ort-configuration-files/curations.yml \
  --repository-configuration-file $SCRIPT_DIR/../ort-configuration-files/$repo.ort.yml \
  --package-configuration-dir $SCRIPT_DIR/../ort-configuration-files/package-configurations/ || true

ort --info --force-overwrite report \
  --ort-file $SCRIPT_DIR/../ort-results/$repo/evaluate/evaluation-result.yml \
  --output-dir $SCRIPT_DIR/../ort-results/$repo/report \
  --report-formats StaticHtml,NoticeTemplate \
  --report-option NoticeTemplate=template.id=summary,default \
  --package-configuration-dir $SCRIPT_DIR/../ort-configuration-files/package-configurations/ \
  --license-classifications-file $SCRIPT_DIR/../ort-configuration-files/license-classifications.yml \
  --repository-configuration-file $SCRIPT_DIR/../ort-configuration-files/$repo.ort.yml \
  --resolutions-file $SCRIPT_DIR/../ort-configuration-files/resolutions.yml

