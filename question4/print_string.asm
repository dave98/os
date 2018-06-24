print_string:
  _loop:
    mov al, [si]
    cmp al, 0
    je _end

    mov ah, 0x0e;Teletype
    int 0x10
    add si, 1
    jmp _loop

  _end:
  ret
