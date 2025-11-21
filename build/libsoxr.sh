#!/bin/bash
set -euxo pipefail

cd /src
mkdir -p build && cd build
emcmake cmake \
  -DWITH_PTHREADS=OFF \
  -DWITH_OPENMP=OFF \
  -DWITH_CR32S=OFF \
  -DWITH_CR64S=OFF \
  -DWITH_PFFFT=OFF \
  -DWITH_AVFFT=OFF \
  -DBUILD_TESTS=OFF \
  -DBUILD_EXAMPLES=OFF \
  -DBUILD_SHARED_LIBS=OFF \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX=$INSTALL_DIR \
  ..
emmake make -j"$(nproc)"
emmake make install
