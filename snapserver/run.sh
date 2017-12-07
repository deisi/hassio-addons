CONFIG_PATH=/data/options.json

ARGS="$(jq --raw-output '.args' $CONFIG_PATH)"
cd /usr/src/snapcast/server/
./snapserver $ARGS
