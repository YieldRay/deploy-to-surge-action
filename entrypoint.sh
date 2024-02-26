#!/bin/sh -l

bin_url=$(curl -sk https://api.github.com/repos/yieldray/surgecli/releases/latest | jq -r .assets[].browser_download_url | grep linux-amd64)

echo "downloading $bin_url"
curl -fSskL "$bin_url" -o surgecli

chmod 777 ./surgecli

if ! SURGE_TOKEN="$3" ./surgecli deploy --silent --json "$1" "$2" >info.json; then
    exit $?
fi

echo "preview=$(jq -r .metadata.preview <info.json)" >>"$GITHUB_OUTPUT"

cat info.json
