##  compile the C file into a native executable:
```shell
clang hello.c -o hello.o
```

## compile the C file into an LLVM bitcode file:
The -emit-llvm option can be used with the -S or -c options to emit an LLVM .ll or .bc file (respectively) for the code. This allows you to use the standard LLVM tools on the bitcode file.
```shell
clang -O3 -emit-llvm hello.c -c -o hello.bc
```

## Run the program in both forms
```shell
./hello
# AND The second example shows how to invoke the LLVM JIT, lli.
lli hello.bc
```