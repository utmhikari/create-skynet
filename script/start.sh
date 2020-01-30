#!/usr/bin/env bash

CFG=$1
if [ ! $CFG ]; then
    CFG=./config/config.lua
fi

./bin/skynet $CFG
