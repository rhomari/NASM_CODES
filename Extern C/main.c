#include <stdio.h>

int main()
{
    extern int PrintColoredText();
    PrintColoredText();
    return 0;
}
// nasm -f win64 -o function.obj function.asm
// gcc function.obj main.c -o main.exe