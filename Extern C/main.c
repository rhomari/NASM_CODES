int main()
{
    extern int PrintColoredText(char*, int);
    char * text = "ASM is fun...";
    PrintColoredText(text, 5);
    return 0;
}
// nasm -f win64 -o function.obj function.asm
// gcc function.obj main.c -o main.exe