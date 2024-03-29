#!/usr/bin/env bash
git pull
helm del --purge riot


if  [ "$(hostname)" == "scicat01.esss.lu.se" ]; then
    envarray=(ess)
    INGRESS_NAME="-f ./riot/lund.yaml"
    BUILD="false"
elif  [ "$(hostname)" == "k8-lrg-serv-prod.esss.dk" ]; then
    envarray=(dmscprod)
    INGRESS_NAME="-f ./riot/dmscprod.yaml"
    BUILD="false"
fi

helm install riot --name riot --namespace dev ${INGRESS_NAME}
