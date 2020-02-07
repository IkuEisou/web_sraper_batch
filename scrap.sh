#!/bin/bash

. .env
param_file=$1

for line in $(cat $param_file); do
    curl --location --request POST 'https://api.webscraper.io/api/v1/scraping-job?api_token='${WS_TOCKEN} \
        --header 'Content-Type: application/json' \
        --data-raw '{
    "sitemap_id":'$line',
    "driver": "fulljs",
    "page_load_delay": 2000,
    "request_interval": 2000,
    "proxy": 0
    }'
done
