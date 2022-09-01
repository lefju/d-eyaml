#!/bin/bash

EYAML_FILE=$1
EYAML_KEY_DIR="${HOME}/.eyaml/keys"

if [ $# -ne 1 ]
then
  echo "Error: This script only accepts a single argument"
  exit 1  
fi

if [ ! -f ${EYAML_FILE} ]
then
  echo "Error: This script requires a path to an existing file"
  echo "Error: \"${EYAML_FILE}\" was not found"
  exit 1
fi

if [ ! -e ${EYAML_KEY_DIR}/private_key.pkcs7.pem ]
then
  echo "Error: Could not find private key in \"${EYAML_KEY_DIR}/private_key.pkcs7.pem\""
  exit 1
fi

if [ ! -e ${EYAML_KEY_DIR}/public_key.pkcs7.pem ]
then
  echo "Error: Could not find public key in \"${EYAML_KEY_DIR}/public_key.pkcs7.pem\""
  exit 1
fi

if [[ ! $(docker --version) ]]
then
  echo "Error: This script requires docker"
  exit 1
fi

docker run -v ${EYAML_KEY_DIR}:/keys/ -v ${PWD}/${EYAML_FILE}:/${EYAML_FILE} -it --rm --name d-eyaml lefju418/d-eyaml edit /${EYAML_FILE}
