section .data
    msg db "Введите строку:", 10
    msg_len equ $ - msg

section .bss
    buf1 resb 80

section .text
    global _start

_start:
    ; Системный вызов write - вывод сообщения
    mov eax, 4          ; sys_write
    mov ebx, 1          ; stdout
    mov ecx, msg        ; адрес сообщения
    mov edx, msg_len    ; длина сообщения
    int 0x80

    ; Системный вызов read - ввод строки
    mov eax, 3          ; sys_read
    mov ebx, 0          ; stdin
    mov ecx, buf1       ; адрес буфера
    mov edx, 80         ; максимальная длина
    int 0x80

    ; Системный вызов exit - завершение программы
    mov eax, 1          ; sys_exit
    mov ebx, 0          ; код возврата 0
    int 0x80
