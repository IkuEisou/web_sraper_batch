#!/bin/bash
. .env
param_file=$1

for line in $(cat $param_file); do
    ID=$(echo $line | cut -d ":" -f1)
    curl --location --request POST 'https://api.webscraper.io/api/v1/sitemap?api_token='${WS_TOCKEN} \
        --header 'Content-Type: application/json' \
        --header 'Content-Type: text/plain' \
        --data-raw '{"_id":"bloomberg_stock_'${ID}'","startUrl":["https://www.bloomberg.com/quote/'${line}'"],"selectors":[{"id":"title","type":"SelectorText","parentSelectors":["_root"],"selector":"h1","multiple":false,"regex":"","delay":0}]}'
done
