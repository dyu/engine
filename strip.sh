#!/bin/sh

TARGET=host_release
[ "$1" != "" ] && TARGET=$1

# default target is built in src/ dir via:
# ./flutter/tools/gn --runtime-mode=release

[ -e src/out/$TARGET/libflutter_engine.so ] || { echo "src/out/$TARGET/libflutter_engine.so does not exist."; exit 1; }

SUFFIX=_strip
OUT_DIR="$TARGET$SUFFIX"

cd src/out && mkdir -p $OUT_DIR && cp $TARGET/libflutter_engine.so $OUT_DIR/ && strip $OUT_DIR/libflutter_engine.so
