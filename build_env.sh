#!/bin/bash

if [ ! -f afl-as -o ! -f afl-cc ]; then
    echo "Should run build_AFL++.sh first!"
    exit
fi

export AFL_CC=aarch64-unknown-nto-qnx7.1.0-gcc
export AFL_CXX=aarch64-unknown-nto-qnx7.1.0-g++
export AFL_PATH=/local/mnt1/workspace/Fuzzing/AFL++/AFLplusplus
export PATH=$AFL_PATH:$PATH
export AFL_AS=aarch64-unknown-nto-qnx7.1.0-as
export AFL_KEEP_ASSEMBLY=1
export AFL_DEBUG=1
export AFL_QUIET=0

mv $QNX_HOST/usr/bin/aarch64-unknown-nto-qnx7.1.0-as-2.32 $QNX_HOST/usr/bin/aarch64-unknown-nto-qnx7.1.0-as-2.32_
ln -sf $AFL_PATH/afl-as $QNX_HOST/usr/bin/aarch64-unknown-nto-qnx7.1.0-as-2.32
