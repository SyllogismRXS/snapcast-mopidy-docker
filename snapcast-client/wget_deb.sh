#!/bin/bash

VERSION="${1}"
TYPE="${2}"
UNAME_ARCH=$(uname -m)

if [[ "${UNAME_ARCH}" == "x86_64" ]]; then
    ARCH="amd64"
elif [[ "${UNAME_ARCH}" == "armv7l" ]]; then
     ARCH="armhf"
else
    exit 1
fi

DEB_NAME="snap${TYPE}_${VERSION}-1_${ARCH}.deb"
wget https://github.com/badaix/snapcast/releases/download/v${VERSION}/${DEB_NAME}
echo ${DEB_NAME}
