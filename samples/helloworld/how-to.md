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
# Use the llvm-dis util to take a look at lllvm assembly code
llvm-dis < helllo.bc | less
# Compile the program to native assembly using the LLC code generator
llc hello.bc -o hello.s
# Assemble the native assembly language file into a program
clang hello.s -o hello.native -no-pie #we need no pie here because llc by default emits code with abs addr incompatible with PIE. You can avoid that entirely by generating PIC-friendly assembly with llc -relocation-model=pic hello.bc -o hello.s                          

```
