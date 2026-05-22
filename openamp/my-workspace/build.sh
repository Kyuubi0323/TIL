#!/bin/bash
export PROJECT_ROOT=${PWD}
cd ${PROJECT_ROOT}/openamp-system-reference/examples/legacy_apps
cmake -Bbuild \
-DCMAKE_INCLUDE_PATH="${PROJECT_ROOT}/libmetal/build/lib/include/;${PROJECT_ROOT}/open-amp/build/lib/include/" \
-DCMAKE_LIBRARY_PATH="${PROJECT_ROOT}/libmetal/build/lib/;${PROJECT_ROOT}/open-amp/build/lib/" \
-DCMAKE_INSTALL_PREFIX=${PROJECT_ROOT}/target
make -C build VERBOSE=1 install