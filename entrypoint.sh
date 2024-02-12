#!/bin/sh -l

bin_url=$(curl -sk https://api.github.com/repos/yieldray/surgecli/releases/latest | awk -F \" -v RS="," '/browser_download_url/ {print $(NF-1)}' | grep linux-amd64)

echo "downloading $bin_url"
curl -fSskL "$bin_url" -o surgecli

chmod 777 ./surgecli
SURGE_TOKEN="$3" ./surgecli deploy --silent "$1" "$2"
exit $?
