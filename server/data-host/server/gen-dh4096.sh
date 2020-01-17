#!/usr/bin/env bash

SCRIPT_PATH="$(dirname "${PWD}/${BASH_SOURCE[0]}")" # Absolute path this script is in

FILE_DH4096="${SCRIPT_PATH}/dh4096.pem"

if [[ -f "${FILE_DH4096}" ]]; then
  echo "[gen-dh4096] skip exist: ${FILE_DH4096}"
else
  echo "[gen-dh4096] generate: ${FILE_DH4096} (slow)"
  openssl dhparam \
    -out "${FILE_DH4096}" \
    -outform PEM \
    -dsaparam \
    4096
fi
