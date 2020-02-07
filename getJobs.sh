#!/bin/bash
. .env

curl --location --request GET 'https://api.webscraper.io/api/v1/scraping-jobs?api_token='${WS_TOCKEN} >jobs.json
PAGES=$(cat jobs.json | jq '.last_page')

for page in $(seq 2 $PAGES); do
    curl --location --request GET 'https://api.webscraper.io/api/v1/scraping-jobs?api_token='${WS_TOCKEN}'&page='${page} >>jobs.json
done
cat jobs.json | jq '.data' | jq '.[]' | jq 'select(.status == "finished" and .id > 1858243)' | jq '.id' >jobs_id.txt
