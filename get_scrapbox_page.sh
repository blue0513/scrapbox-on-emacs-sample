#!/bin/bash

page=$1

response=$(curl -s "[Your Request]")
# [Your Request]: "https://scrapbox.io/api/pages/[Your Project Name]/${page}"

# If You want to access private project, Plz do a bit hack as follows
# On Chrome, You can get Request as cURL format
# 1. Open dev tool network tab
# 2. Right Click the Target Request
# 3. Select: Copy as cURL
# 4. Replace the Target Page Name to ${page}
# Ex: "https://scrapbox.io/api/pages/YOUR_PROJECT_NAME/${page}" -H .... 'Cache-Control: no-cache' --compressed

# After that the variable `response` is as follows
#
# response=$(curl -s "https://scrapbox.io/api/pages/YOUR_PROJECT_NAME/${page}" -H 'Pragma: no-cache' -H .... 'Cache-Control: no-cache' --compressed)
#

raw_descriptions=$(echo $response | jq -r '.descriptions')
descriptions=$(echo $raw_descriptions | sed 's/"//g' | cut -c 2- | rev | cut -c 2- | rev)

cat <<EOF
$(echo $descriptions | tr "," "\n")
EOF
