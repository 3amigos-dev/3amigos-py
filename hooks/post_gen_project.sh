#!/bin/bash

set -euxo pipefail

BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
TOP="$(dirname "${BASEDIR}")"

cd "${TOP}"
FILES="$(git status -s docs | grep -E ^.D | sed s/^...//)"
if [ ! -z "${FILES}" ] ; then
    git checkout ${FILES} # shellcheck SC2086
fi
git checkout -- \
 docs/index.rst
