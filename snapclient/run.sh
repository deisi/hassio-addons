CONFIG_PATH=/data/options.json

HOST="$(jq --raw-output '.host' $CONFIG_PATH)"
ARGS="$(jq --raw-output '.args' $CONFIG_PATH)"
cd /usr/src/snapcast/client/
./snapclient --host $HOST $ARGS
