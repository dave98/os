
[org  0x7c00]
mov bp, 0x8000
mov sp, bp; Cabeza de la pila a la base

mov dx, 0x3122
call print_hex

jmp $

%include "print_string.asm"
; FUNCTIONS
; Datos usados en el codigo
print_hex:
  pusha
  mov bx, HEX_TEMPLATE; bx para almacenamiento
  add bx, 5
  mov cx, 4
  ;mov si, HEX_TEMPLATE
  ;call print_string
  ;ret

hex_loop:
  cmp cx, 0
  je end_loop

  mov ax, dx
  and ax, 0x000f

  cmp ax, 10
  jl is_digit
  add ax, 39

is_digit:
  add ax, 48
  mov [bx], al
  sub bx, 1
  shr dx, 4
  sub cx, 1
  jmp hex_loop

end_loop:
  sub bx, 1
  call print_string
  popa
  ret
;DATA

HEX_TEMPLATE:
  db '0x0000', 0

HELLO_MSG:
  db 'Hola mundo', 0; El cero ayuda a detener la rutina de impresion

GOOD_BYE_MSG:
  db 'Ya nos vemos', 0;

;Magic Number
times 510 - ($-$$) db 0
dw 0xaa55
