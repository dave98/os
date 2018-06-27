print_string:
    pusha          ;pusheo el valor de los registros originales para que no se pierdan
    mov ah, 0x0e   ;modo teletype para imprimir en pantalla
compare:
    mov al, [bx]   ;guardo el valor almacenado en la direccion almacenada en bx,
                   ;en el byte al, para despues imprimirlo
    cmp al, 0      ;comparo el valor en al con el el byte nulo
    je the_end     ;salto a the_end si es que se llego al fin de cadena
    int 0x10       ;caso contrario imprimo el caracter actual de la cadena
    add bx, 1      ;sumo a la direccion almacenada en bx para la siguiente iteracion
    jmp compare    ;regreso hacia arriba para volver a comparar
the_end: 
    popa           ;hago pop a todos los valores de los registros para recuperarlos y
                   ;restablecerlos a su valor original antes de la llamada a la funcion
    ret            ;hago pop a la direccion de retorno, y salto hacia ella