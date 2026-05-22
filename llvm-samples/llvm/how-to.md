## Install dependencies
Before you start building LLVM and Clang, make sure the following software is installed:

- CMake (version 3.13 or higher)
- Ninja (recommended for faster builds)
- Python (for running tests)

```shell
sudo apt-get install cmake ninja-build python3
# Clone llvm project, To save storage and speed up the checkout time, you may want to do a shallow clone
git clone --depth 1 https://github.com/llvm/llvm-project
cd llvm-project
```

## Build 
```shell
mkdir build
cd build

cmake -G "Ninja" -DCMAKE_BUILD_TYPE=Release \
  -DLLVM_ENABLE_PROJECTS="clang;lld" \
  -DCMAKE_INSTALL_PREFIX=/usr/local \
  -DLLVM_TARGETS_TO_BUILD="X86;AMDGPU" \
  ../llvm
# Once the configuration is completed, build the project with ninja, u can using make instead.
ninja
# After that, running test 
ninja check-all

```
