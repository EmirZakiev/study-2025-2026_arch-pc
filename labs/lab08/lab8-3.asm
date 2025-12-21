%include "in_out.asm"
SECTION .data
msg db "Result: ", 0
SECTION .text
global _start
_start:
pop ecx
pop edx
sub ecx, 1
cmp ecx, 0
jz _end
mov esi, 0
next_arg:
pop eax
call atoi
add esi, eax
loop next_arg
_end:
mov eax, msg
call sprint
mov eax, esi
call iprintLF
call quit
