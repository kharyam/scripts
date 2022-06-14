#!/bin/bash

echo -n Loading...

API_KEY=$(cat ~/.financialmodelingprep.com.pin)

while [[ true ]]
do
	curl https://financialmodelingprep.com/api/v3/quote/IBM?apikey=$API_KEY > ibm.txt
	IBM_PRICE=$(cat ibm.txt | jq '.[0].price')
	IBM_CHANGE=$(cat ibm.txt | jq '.[0].change')
	IBM_LOW=$(cat ibm.txt | jq '.[0].dayLow')
	IBM_HIGH=$(cat ibm.txt | jq '.[0].dayHigh')

	echo -n "IBM: \$${IBM_PRICE} | change: ${IBM_CHANGE} | high: \$$IBM_HIGH | low: \$$IBM_LOW  "
	sleep 720
done
