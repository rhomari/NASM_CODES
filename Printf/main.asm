bits 64
default rel

segment .data
    msg db "Hello world!", 0xd, 0xa, 0
    stdout  equ -11
segment .text
global main
extern ExitProcess
extern SetConsoleTextAttribute
extern GetStdHandle


extern printf

main:
    push    rbp
    mov     rbp, rsp
    sub     rsp, 32
    MOV RCX, stdout
    CALL GetStdHandle
    MOV EDX, 1
    MOV RCX,RAX
    CALL SetConsoleTextAttribute
    lea     rcx, [msg]
    call    printf

    xor     rax, rax
    call    ExitProcess
    ;nasm -f win64 -o main.obj main.asm
    ;