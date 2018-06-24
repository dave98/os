 mov ah, 0x0e; teletype

 ;mov al, [the_secret]
 ;int 0x10; NO IMPRIME

 ;mov bx, 0x7c0
 ;mov ds, bx
 ;mov al, [the_secret]
 ;int 0x10; IMPRIME

 ;mov al, [es:the_secret]
 ;int 0x10 ; NO IMPRIME

 mov bx, 0x7c0
 mov es, bx
 mov al, [es:the_secret]
 int 0x10; IMPRIME

 jmp $

 the_secret:
  db "X"

  ;Padding
  times 510 - ($-$$) db 0
  dw 0xaa55
