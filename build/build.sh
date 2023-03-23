#!/usr/bin/env bash

BUILD_ROOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [[ ${BUILD_ROOT_DIR} != *"/build"* ]]
then
  BUILD_ROOT_DIR="$BUILD_ROOT_DIR/build"
fi

ROOT_DIR=$(dirname "${BUILD_ROOT_DIR}")

cd ${ROOT_DIR}

# NODE_DIR="/home/developer/.nvm/versions/node/v16.13.0/bin"
NODE_DIR="/root/.nvm/versions/node/v19.8.1/bin"
PATH="${NODE_DIR}:$PATH"

echo "Start building..."

npm install --prefix ${ROOT_DIR}
npm run build --scripts-prepend-node-path=true  --prefix ${ROOT_DIR}

echo "Done..."