print_string:
  pusha
  mov ah, 0x0e

  _loop:
    mov al, [bx]
    cmp al, 0
    je _end

    int 0x10
    add bx, 1
    jmp _loop

  _end:
    mov al, 10
    int 0x10
    mov al, 13
    int 0x10
    popa
    ret

  ret
