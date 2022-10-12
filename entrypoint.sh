#!/bin/bash

set -e

BUILD_ROOT=`cat sourceknight.yaml | yq '.project.root' | tr -d '"'`
BUILD_OUTPUT=`cat sourceknight.yaml | yq '.project.output' | tr -d '"'`
if [[ "$BUILD_OUTPUT" == "null" || "$BUILD_OUTPUT" == "" ]]; then
    BUILD_OUTPUT="${BUILD_ROOT}/addons/sourcemod/plugins"
fi

if [[ ${BUILD_OUTPUT::1} == "/" ]]; then
    BUILD_OUTPUT=".${BUILD_OUTPUT}"
fi

echo "Build output: $BUILD_OUTPUT"

sh -c "sourceknight $*"

mkdir -p /tmp/package/addons/sourcemod/plugins

if [[ -d "${BUILD_OUTPUT}" ]]; then
    cp -R ${BUILD_OUTPUT}/* /tmp/package/addons/sourcemod/plugins
fi
