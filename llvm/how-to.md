## Install dependencies
Before you start building LLVM and Clang, make sure the following software is installed:

- CMake (version 3.13 or higher)
- Ninja (recommended for faster builds)
- Python (for running tests)

```shell
sudo apt-get install cmake ninja-build python3
# Clone llvm project, can using --depth=1 for faster speed
git clone https://github.com/llvm/llvm-project
cd llvm-project
```

## Build 
```shell
mkdir build
cd build

cmake -G "Ninja" -DCMAKE_BUILD_TYPE=Release \
  -DLLVM_ENABLE_PROJECTS="clang;lld" \
  -DLLVM_TARGETS_TO_BUILD="X86;AMDGPU" \
  ../llvm
```
