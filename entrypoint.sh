#!/bin/sh -l
set -e 

#args="--json --regex --rules /regexes.json --entropy=False" 

if [ -n "${INPUT_THARGS}" ]; then
  args="${INPUT_THARGS}"  
fi

if [ -n "${INPUT_GITHUBTOKEN}" ]; then
  grepo="https://$INPUT_GITHUBTOKEN@github.com/$GITHUB_REPOSITORY"  
else
  grepo="https://github.com/$GITHUB_REPOSITORY" 
fi

q="$args $grepo"  

if [ -n "${INPUT_EMAILTO}" -a -n "${INPUT_EMAILFROM}"]; then
	trufflehog $q | curl -X POST --header 'Authorization: Bearer $SENDGRIDAPIKEY' --header 'Content-Type: application/json' --data-binary @- https://api.sendgrid.com/v3/mail/send
else
	trufflehog $q

fi
