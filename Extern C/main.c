#include <stdio.h>

int main()
{
    extern int PrintColoredText(char*);
    char * text = "ASM is fun...";
    PrintColoredText(text);
    return 0;
}
// nasm -f win64 -o function.obj function.asm
// gcc function.obj main.c -o main.exe