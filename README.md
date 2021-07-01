# Template for OSS Review Toolkit project analysis

## Requirements

Requires Docker image of [OSS Review Toolkit](https://github.com/oss-review-toolkit/ort). Some scripts require
[yq](https://github.com/mikefarah/yq) to be installed and added to PATH.

## Setup

Clone ORT configuration to `ort-config`. Add ORT scan result to `ort-results/<repository-name>/scan/scan-result.yml` or
ORT evaluation result to `ort-results/<repository-name>/evaluate/evaluation-result.yml`.

To use the scripts, save the name of the ORT Docker image as `$ORT_DOCKER_IMAGE` environment variable.

## Helper scripts

[`scripts` directory](scripts/) includes helper scripts for working with ORT.
