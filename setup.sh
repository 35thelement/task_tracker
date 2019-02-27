#!/bin/bash

export MIX_ENV=prod
export PORT=4793
export NODEBIN=`pwd`/assets/node_modules/.bin
export PATH="$PATH:$NODEBIN"

echo "Construction has begun."

mkdir -p ~/.config
mkdir -p priv/static

mix deps.get
mix compile
(cd assets && npm install)
(cd assets &&  webpack --mode production)
(cd assets && npm install --save bootstrap jquery popper.js)
(cd assets && npm install --save-dev node-sass sass-loader)
mix phx.digest

echo "Creating Release."
mix release
