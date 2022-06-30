#!/bin/bash
while getopts v: flag
do
    case "${flag}" in
        v) version=${OPTARG};;
    esac
done

if [ $OPTIND -eq 1 ]; then 
    echo "USAGE: ./generate-dockerfile.sh -v [1C_VERSION]";
    echo "  -v [1C_VERSION] -- version of 1C"
    echo "EXAMPLE:"
    echo "  ./generate-dockerfile.sh -v 8.3.21.1302"
    exit 1;
fi

if [ ! -d "out" ]; then mkdir out; fi
if [ ! -d "out/${version}" ]; then mkdir out/$version; fi

ONEC_VERSION=$version envsubst < docker-compose.yml.template >> ./out/$version/docker-compose.yml;
ONEC_VERSION=$version envsubst < Dockerfile.template >> ./out/$version/Dockerfile;
cp start.sh out/$version/;