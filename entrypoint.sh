#!/bin/sh -l

curl -fSsL https://github.com/YieldRay/surgecli/releases/download/v0.0.1/surgecli-linux-amd64 -O surgecli
chmod 777 ./surgecli
message=$(SURGE_TOKEN="$3" ./surgecli deploy --silent "$1" "$2")
echo "$message" >>$GITHUB_OUTPUT
