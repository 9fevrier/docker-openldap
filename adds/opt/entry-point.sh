#!/bin/bash

set -e

SLAPD_HOST=${SLAPD_HOST:="ldap://0.0.0.0"}
SLAPD_LOGLEVEL=${SLAPD_LOGLEVEL:="3"}
SLAPD_CONF_DIR=${SLAPD_CONF_DIR:="/etc/openldap/slapd.d"}

if [ "$#" -eq 0 ]; then
  echo "=== Running slapd ==="
  /usr/sbin/slapd -d "${SLAPD_LOGLEVEL}" -h "${SLAPD_HOST}" -F ${SLAPD_CONF_DIR}
fi
