#!/bin/bash

export AFL_CC=aarch64-unknown-nto-qnx7.1.0-gcc
export AFL_CXX=aarch64-unknown-nto-qnx7.1.0-g++
export AFL_PATH=/local/mnt1/workspace/Fuzzing/AFL++/AFLplusplus
export PATH=$AFL_PATH:$PATH
export AFL_AS=aarch64-unknown-nto-qnx7.1.0-as
export AFL_KEEP_ASSEMBLY=1
export AFL_DEBUG=1
export AFL_QUIET=0
