# Scripts to help working with ORT

Add name of ORT Docker image as environment variable `$ORT_DOCKER_IMAGE`.

## evaluate-report.sh

`./scripts/evaluate-report.sh <repository-name>`

Evaluate the given repository and create new reports. Requires scan result for the repository to exist in
`ort-results/<repository-name>/scan/scan-result.yml`. Outputs the evaluation result to 
`ort-results/<repository-name>/evaluate/` and the reports to `ort-results/<repository-name>/report/`.

## generate-package-configurations.sh

`./scripts/generate-package-configurations.sh <repository-name> <package-id>`

Creates package configuration file for the given package id in `config/package-configurations/`. Requires scan results
from the evaluation result to be extracted to a directory. Can be done with
[`import-scan-results.sh`](#import-scan-resultssh)

## import-scan-results.sh

`./scripts/import-scan-results.sh <repository-name>`

Exports scan results from the evaluation result for the given repository to
`ort-results/scan-result-dirs/<repository-name>`.

## list-licenses.sh

`./scripts/list-licenses.sh <repository-name> <package-id>`

List license locations for the given package id that cause `ERROR` level rule violations.

## list-all-violations.sh

`./scripts/list-all-violation <repository-same>`

Run [`list-licenses.sh`](#list-licensessh) for all violations.
