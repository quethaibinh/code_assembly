.model small    
.stack 100h
.data  
    crlt db 13, 10, '$'
    str db 50 dup('$')

.code

main proc
    
    mov ax, @data
    mov ds, ax 
    
    lea si, str
    mov cx, 0
    lap:
        mov ah, 1
        int 21h
        
        cmp al, 13
        je break
        
        mov [si], al
        inc si    
        inc cx
        jmp lap    
        
    break:
    
    call xuongdong
    add cx, '0'
    mov dx, cx
    mov ah, 2
    int 21h
    
    
    mov ah, 4ch
    int 21h
     
main endp  

xuongdong proc
    
    push ax
    push dx
    
    lea dx, crlt
    mov ah, 9
    int 21h
    
    pop dx
    pop ax
    
    ret
xuongdong endp

end main