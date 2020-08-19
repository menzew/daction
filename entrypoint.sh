#!/bin/sh -l
set -e 

args="--regex --rules regexes.json --entropy=False" 

if [ -n "${INPUT_SCANARGUMENTS}" ]; then
  args="${INPUT_SCANARGUMENTS}" # Overwrite if new options string is provided
fi

if [ -n "${INPUT_GITHUBTOKEN}" ]; then
  githubRepo="https://$INPUT_GITHUBTOKEN@github.com/$GITHUB_REPOSITORY" # Overwrite for private repository if token provided
else
  githubRepo="https://github.com/$GITHUB_REPOSITORY" # Default target repository
  #githubRepo="https://github.com/menzew/ClassLoadGrapher" # Default target repository
fi

query="$args $githubRepo" # Build args query with repository url
trufflehog $query
