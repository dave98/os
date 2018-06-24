
mov bx, 50

cmp bx, 4
jle block_1
cmp bx, 40
jl block_2
jmp block_3


block_1:
  mov al, 'A'
  jmp the_end

block_2:
  mov al, 'B'
  jmp the_end

block_3:
  mov al, 'C'
  jmp the_end

the_end:
  mov ah, 0x0e
  int 0x10
  jmp $

;Añadiendo el numero magico
times 510 -($-$$) db 0
dw 0xaa55
