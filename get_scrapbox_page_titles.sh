#!/bin/bash

response=$(curl -s "[Your Request]")
raw_descriptions=$(echo $response | jq '.[] | .title')
descriptions=$(echo $raw_descriptions | sed 's/"//g')

for i in ${descriptions[@]}
do
    echo $i
done
