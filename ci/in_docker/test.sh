#!/bin/bash

set -euxo pipefail

THISDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
BASEDIR="$( dirname "$( dirname "${THISDIR}" )" )"

MAIN_MODULE="pymodulenamegoeshere"
MODULES=( "${MAIN_MODULE}" "test" )

cd "${BASEDIR}/app"
for PYVER in ${PYTHONVERS} ; do
  true
  # "python${PYVER}" -m flake8 "${MODULES[@]}"
  # "python${PYVER}" -m pylint "${MODULES[@]}"
  # "python${PYVER}" -m bandit -r "${MAIN_MODULE}"
  "python${PYVER}" -m pytest --cov-config=.coveragerc --cov-fail-under=100 "--cov=${MAIN_MODULE}"
done
echo 'Testing Complete'
