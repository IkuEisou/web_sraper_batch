#!/bin/bash
. .env
param_file=$1

for line in $(cat $param_file); do
    curl --location --request GET 'https://api.webscraper.io/api/v1/scraping-job/'${line}'/json?api_token='${WS_TOCKEN} >>result.json
done
sed -e "s/web-scraper-start-url/key/g" result.json >result_r.json
jq '.key |= (sub("https://www.bloomberg.com/quote/";"")) | [.key, .title] | @csv' result_r.json >result.csv
# sed -e "s/\"//g" result.csv >result_r.csv
