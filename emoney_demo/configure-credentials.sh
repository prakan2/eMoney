#!/usr/bin/env bash

. magic.sh

load_config

echo '----------------------------------------------'
echo '     Configuring Credentials in Dev cluster'
echo '----------------------------------------------'

echo ''
echo 'Continue to switch to the Dev Cluster...'
pe "kubectx ${DEV_CLUSTER}"

echo ''
echo 'Continue to create required namespaces'
pe "kubectl create ns ${DEV_NAMESPACE}"

echo '----------------------------------------------'
echo '     Configuring Credentials in Prod cluster'
echo '----------------------------------------------'

echo ''
echo 'Continue to switch to the Prod Cluster...'
pe "kubectx ${PROD_CLUSTER}"

echo ''
echo 'Continue to create required namespaces'
pe "kubectl create ns ${PROD_NAMESPACE}"
