#!/bin/sh
find .nuxt -type f -print0 | xargs -0  sed -i "s|PLACEHOLDERURL|$AGGREGATOR_URL|g"
yarn start
