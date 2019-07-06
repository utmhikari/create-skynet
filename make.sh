#!/usr/bin/env bash

WORKDIR=$(pwd)

PLAT=$1
if [ ! $PLAT ]; then
    PLAT=linux
fi

cd skynet && make $PLAT && cp ./skynet $WORKDIR/bin/skynet