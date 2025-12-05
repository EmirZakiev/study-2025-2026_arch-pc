; lab.asm
; Программа использует библиотеку in_out.asm

%include 'in_out.asm' ; подключение внешнего файла

SECTION .data
msg: DB 'Введите строку: ',0h ; Приглашение (с нулевым символом в конце)

SECTION .bss
buf1: RESB 80 ; Буфер для вводимой строки

SECTION .text
GLOBAL _start

_start:
; 1. Выводим приглашение
    mov eax, msg       ; адрес сообщения в EAX
    call sprintLF      ; вызов функции печати с переводом строки

; 2. Читаем ввод в buf1
; sread ожидает адрес в ECX и длину в EDX
    mov ecx, buf1      ; адрес буфера в ECX
    mov edx, 80        ; максимальная длина ввода
    call sread         ; вызов функции чтения строки

; 3. Выводим содержимое buf1 на экран
    mov eax, buf1      ; адрес буфера в EAX
    call sprintLF      ; печатаем введенную строку с переводом строки

; 4. Выход
    call quit          ; завершение программы
