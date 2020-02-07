#!/bin/bash -x
. .env
param_file=$1

for line in $(cat $param_file); do
    curl --location --request GET 'https://api.webscraper.io/api/v1/scraping-job/'${line}'/json?api_token='${WS_TOCKEN} >>result.json
done
cat result.json | jq '.title' >>result.csv
