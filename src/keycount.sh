#!/usr/bin/env bash

if [[ -z "${IBMCLOUD_API_KEY}" ]]; then
    echo "Set IBMCLOUD_API_KEY To Run This Script"
    exit
else
    APIKEY="${IBMCLOUD_API_KEY}"
fi

ibmcloud login -apikey $APIKEY --no-region -a cloud.ibm.com
ibmcloud resource service-instances --long | grep "GUID:\|Location" | awk '/GUID:/{ thing = $2; } /Location/ { print thing,":",$NF; }' >  instances.txt
truncate -s -1 instances.txt

rm countperinstance.txt
touch countperinstance.txt; chmod +x countperinstance.txt
while read -r line; do 
    arrLine=(${line//:/})
    instance=${arrLine[0]}
    region=${arrLine[1]}

    size=${#instance} 

    if [[ size -gt 36 ]]; then
        continue
    fi
    echo $instance
    echo $region
    
    case $region in
        "us-south")
            BASE_URL="https://us-south.kms.cloud.ibm.com"
            ;;
        "us-east")
            BASE_URL="https://us-east.kms.cloud.ibm.com"
            ;;
        "br-sao")
            BASE_URL="https://br-sao.kms.cloud.ibm.com"
            ;;
        "au-syd")
            BASE_URL="https://au-syd.kms.cloud.ibm.com"
            ;;
        "jp-tok")
            BASE_URL="https://jp-tok.kms.cloud.ibm.com"
            ;;
        "ca-tor")
            BASE_URL="https://ca-tor.kms.cloud.ibm.com"
            ;;
        "jp-osa")
            BASE_URL="https://jp-osa.kms.cloud.ibm.com"
            ;;
        "eu-gb")
            BASE_URL="https://eu-gb.kms.cloud.ibm.com"
            ;;
        "eu-de")
            BASE_URL="https://eu-de.kms.cloud.ibm.com"
            ;;
        *)
            continue
            ;;
    esac

    go run keycount.go $BASE_URL $APIKEY ${arrLine[0]};
done < instances.txt

totalsum=0
while read -r line; do
    arrLine=(${line//:/ })
    totalsum=$(($totalsum + ${arrLine[1]}))
done < countperinstance.txt

echo "The total sum for all keyversions across all instances in your account is: " $totalsum
