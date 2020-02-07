#!/bin/bash
. .env

curl --location --request GET 'https://api.webscraper.io/api/v1/sitemaps?api_token='${WS_TOCKEN} >sitemaps.json
PAGES=$(cat sitemaps.json | jq '.last_page')

for page in {2..$PAGES}; do
    curl --location --request GET 'https://api.webscraper.io/api/v1/sitemaps?api_token='${WS_TOCKEN}'&page='${page} >>sitemaps.json
done
cat sitemaps.json | jq '.data' | jq '.[]' | jq '.id' >sitemaps_id.txt
