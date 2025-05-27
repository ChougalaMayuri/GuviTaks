#!/bin/bash

# URL to check
# variable
URL="https://www.guvi.in"

#get the HTTP Status using URL
HTTP_STATUS=$(curl -o /dev/null -s -w "%{http_code}" "$URL")

#Check if the  STATUS CODE indicates success or failure.
if [[ "$HTTP_STATUS"  -ge 200 && "$HTTP_STATUS" -lt 300 ]]; then
echo "Success: The request to $URL successful. And the status code is $HTTP_STATUS"

elif [[ "$HTTP_STATUS" -ge 400 && "$HTTP_STATUS" -lt 600 ]]; then
echo "Failure: The request to $URL failed with status code $HTTP_STATUS."

else
echo "Other Response:Received unexpected status code $HTTP_STATUS."

fi

