#!/bin/bash

# check QNX toolchain set properly
if [ ! ${QNX_HOST} ]; then
    echo "QNX env not set!"
    exit
fi

sed -i '/"-lrt"/d' src/afl-cc.c
make TEST_MMAP=1 afl-as
make TEST_MMAP=1 -f GNUmakefile.llvm afl-cc
make TEST_MMAP=1 -f GNUmakefile.llvm afl-compiler-rt.o afl-compiler-rt-32.o afl-compiler-rt-64.o

rm -f instrumentation/*.o
sed -i 's/-ldl//g' GNUmakefile
sed -i 's/-lrt//g' GNUmakefile
sed -i 's/-lm/& -lsocket/g' GNUmakefile
make AFL_NO_X86=1 TEST_MMAP=1 CC=aarch64-unknown-nto-qnx7.1.0-gcc afl-fuzz afl-showmap afl-tmin
