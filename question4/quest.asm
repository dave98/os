;
;
;
[org  0x7c00]
mov bp, 0x8000
mov sp, bp; Cabeza de la pila a la base

mov si, HELLO_MSG
call print_string

mov si, GOOD_BYE_MSG
call print_string

jmp $

%include "print_string.asm"
; FUNCTIONS
; Datos usados en el codigo

;DATA
HELLO_MSG:
  db 'Hola mundo', 0; El cero ayuda a detener la rutina de impresion

GOOD_BYE_MSG:
  db 'Ya nos vemos', 0;

;Magic Number
times 510 - ($-$$) db 0
dw 0xaa55
