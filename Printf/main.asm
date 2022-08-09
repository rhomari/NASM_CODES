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
    call getStdout
    call setTextColor
    lea     RCX, [msg]
    call    printf

    xor     rax, rax
    call    ExitProcess

getStdout:
    MOV RCX, stdout
    CALL GetStdHandle
    ret

setTextColor :
    MOV RCX, RAX
    MOV RDX,1
    CALL SetConsoleTextAttribute
    ret
   
    

    ;nasm -f win64 -o main.obj main.asm
    ;gcc main.obj -o main.exe