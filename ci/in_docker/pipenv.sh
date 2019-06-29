#!/bin/bash

set -euxo pipefail

THISDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
BASEDIR="$( dirname "$( dirname "${THISDIR}" )" )"

MAIN_MODULE="pymodulenamegoeshere"
MODULES=( "${MAIN_MODULE}" "test" )

cd "${BASEDIR}"
for PYVER in ${PYTHONVERS} ; do
  cd "${BASEDIR}/app/pipenv/${PYVER}"
  "python${PYVER}" -m pipenv "$@"
done