#/bin/bash

pushd media-stream-library-js

just build

popd

cp ./media-stream-library-js/player/dist/media-stream-player.min.js ./src/public/js/media-stream-player.min.js
