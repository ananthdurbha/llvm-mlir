# llvm-mlir
llvm fork with mlir sub module

# build instructions
```
mkdir build
cd build
cmake  ../llvm -G Ninja -DLLVM_ENABLE_PROJECTS="clang;libcxx;libcxxabi;polly" -DCMAKE_INSTALL_PREFIX=/home/ananth.durbha/Tools/bin/ -DCMAKE_BUILD_TYPE=Debug -DLLVM_BUILD_EXAMPLES=ON -DLLVM_TARGETS_TO_BUILD=all -DLLVM_PARALLEL_LINK_JOBS=4
ninja
```
