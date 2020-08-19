#!/bin/sh -l
set -e 

args="--regex --rules /regexes.json --entropy=False" 

if [ -n "${INPUT_THARGS}" ]; then
  args="${INPUT_THARGS}"  
fi

if [ -n "${INPUT_GITHUBTOKEN}" ]; then
  grepo="https://$INPUT_GITHUBTOKEN@github.com/$GITHUB_REPOSITORY"  
else
  grepo="https://github.com/$GITHUB_REPOSITORY" 
fi

q="$args $grepo"  
trufflehog $q
