#!/usr/bin/env bash

. magic.sh

load_config

echo '----------------------------------------------'
echo '         Configuring GitOps in OctopusDeploy'
echo '----------------------------------------------'

echo ''
echo 'Continue to switch back to CI/CD Cluster...'
pe "kubectx ${CICD_CLUSTER}"


echo '----------------------------------------------'
echo '         Configuring Applications'
echo '----------------------------------------------'
echo ''

echo 'Continue to configure the applications in octopusDeploy...'
cat kubernetes/cicd/octopusDeploy/nodejs-service.yml | sed "s/WORKLOAD_NAMESPACE/${DEV_NAMESPACE}/" | sed "s/CLUSTER_URL/${DEV_CLUSTER_URL//\//\\/}/" | sed "s/ENVIRONMENT/development/" | kubectl create -n octopusDeploy -f -
cat kubernetes/cicd/octopusDeploy/nodejs-service.yml | sed "s/WORKLOAD_NAMESPACE/${PROD_NAMESPACE}/" | sed "s/CLUSTER_URL/${PROD_CLUSTER_URL//\//\\/}/" | sed "s/ENVIRONMENT/production/" | kubectl create -n octopusDeploy -f -
echo ''

echo '----------------------------------------------'
echo '      GitOps configured successfully!'
echo '----------------------------------------------'
echo ''