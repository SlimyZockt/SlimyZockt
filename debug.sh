#!/usr/bin/env bash
set -e

DIR=$(dirname $(readlink -f $0))
declare -a pids

pushd $DIR
cleanup(){
for pid in ${pids[@]}; do
    kill "$pid"
    echo "Killed process $pid"
done
wait
echo "Cleanup complete."
}

trap cleanup EXIT
bun tailwindcss -i ./style.css -o ./docs/output.css --watch=always &
pids+=($!)
templ generate -watch &
pids+=($!)
air . &
pids+=($!)

popd
wait
