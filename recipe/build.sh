#!/bin/bash

mkdir -p _build
pushd _build

# configure
cmake \
  ${CMAKE_ARGS} \
  -DCMAKE_INSTALL_DATADIR:PATH=${SRC_DIR}/trash \
  -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON \
  -DPython3_EXECUTABLE:FILE=${PYTHON} \
  ${SRC_DIR}

# build
cmake --build . --parallel ${CPU_COUNT}

# install
cmake --build . --parallel ${CPU_COUNT} --target install

# test
ctest --output-on-failure --parallel ${CPU_COUNT} --verbose
