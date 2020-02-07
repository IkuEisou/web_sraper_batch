#!/bin/bash
. .env

./create_sitemaps.sh srappingList.txt
./getSitemaps.sh
./scrap.sh sitemaps_id.txt
./getJobs.sh
./download.sh jobs_id.txt
