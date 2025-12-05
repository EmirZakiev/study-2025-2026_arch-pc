section .data
    ; Сообщение-приглашение для ввода
    prompt db 'Введите ФИО: ', 0
    prompt_len equ $ - prompt
    
    newline db 10  ; символ новой строки

section .bss
    ; Буфер для ввода (256 байт)
    buffer resb 256
    buffer_len resd 1

section .text
    global _start

_start:
    ; Вывод приглашения для ввода
    mov eax, 4          ; sys_write
    mov ebx, 1          ; stdout
    mov ecx, prompt     ; указатель на сообщение
    mov edx, prompt_len ; длина сообщения
    int 0x80

    ; Чтение ввода от пользователя
    mov eax, 3          ; sys_read
    mov ebx, 0          ; stdin
    mov ecx, buffer     ; указатель на буфер
    mov edx, 256        ; максимальная длина
    int 0x80
    
    ; Сохраняем длину введенных данных
    mov [buffer_len], eax

    ; Вывод введенного ФИО
    mov eax, 4          ; sys_write
    mov ebx, 1          ; stdout
    mov ecx, buffer     ; указатель на введенные данные
    mov edx, [buffer_len] ; длина введенных данных
    int 0x80

    ; Завершение программы
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; код возврата 0
    int 0x80
