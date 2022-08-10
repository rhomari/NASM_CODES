Section .data
    msg : db "This text is from asm code", 10
    stdout equ -11
section .text
    global PrintColoredText
    extern ExitProcess
    extern SetConsoleTextAttribute
    extern GetStdHandle
    extern printf

PrintColoredText :
    push    rbp
    mov     rbp, rsp
    sub     rsp, 32
    mov rdi, RCX
    call getStdout
    call setTextColor
    mov RCX,RDI
    call    printf

    xor     rax, rax
    call    ExitProcess

getStdout:
    MOV RCX, stdout
    CALL GetStdHandle
    RET

setTextColor :
    MOV RCX, RAX
    MOV RDX,1
    CALL SetConsoleTextAttribute
    RET
    
   