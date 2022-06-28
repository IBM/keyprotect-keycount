#!/usr/bin/env bash

if [[ -z "${IBMCLOUD_API_KEY}" ]]; then
    echo "Set IBMCLOUD_API_KEY To Run This Script"
    exit
else
    APIKEY="${IBMCLOUD_API_KEY}"
fi

if [[ -z "${BASE_URL}" ]]; then
   BASE_URL="https://us-south.kms.cloud.ibm.com"
else
   BASE_URL="${BASE_URL}"
fi

ibmcloud login -apikey $APIKEY --no-region
ibmcloud config --check-version=false
ibmcloud resource service-instances --long | grep "GUID:" | awk -F "GUID:" '{print $2}' > instances.txt

rm countperinstance.txt
touch countperinstance.txt; chmod +x countperinstance.txt
while read -r line; do go run keycount.go $BASE_URL $APIKEY $line; done < instances.txt

totalsum=0
while read -r line; do
    arrLine=(${line//:/ })
    totalsum=$(($totalsum + ${arrLine[1]}))
done < countperinstance.txt

echo "The total sum for all keyversions across all instances in your account is: " $totalsum
