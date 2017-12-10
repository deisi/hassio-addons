CONFIG_PATH=/data/options.json

ARGS="$(jq --raw-output '.args' $CONFIG_PATH)"
snapserver $ARGS
