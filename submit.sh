#!/bin/bash
test_name="hiring-test-$(whoami).txt"

echo -e "### GIT PATCH ###\n" > ${test_name}
git format-patch --stdout $(git rev-list --max-parents=0 HEAD)..HEAD >> ${test_name} 2>&1
echo -e "\n\n### K8S RESOURCES FOR RANCHER-DESKTOP ###\n" >> ${test_name}
kubectl get pods,services,deployments,configmaps,secrets,pv,pvc,ingresses --context rancher-desktop -A >> ${test_name} 2>&1
echo -e "\n\n### BITCOIN METRIC ###\n" >> ${test_name}
curl -sG http://localhost/api/v1/query --data-urlencode "query=bitcoin_price" >> ${test_name} 2>&1
echo -e "\n\n### RANDO METRIC ###\n" >> ${test_name}
curl -sG http://localhost/api/v1/query --data-urlencode "query=node_boot_time_seconds" >> ${test_name} 2>&1

echo 'Thank you for completing our hiring test!'
echo
echo "Please send your results (${test_name}) to da-sre-hiring-exercise@wix.com for us to review"
