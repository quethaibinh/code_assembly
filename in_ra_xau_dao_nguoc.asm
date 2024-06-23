.model small
.stack 100h
.data
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
        
        mov ah, 0
        push ax
        inc si 
        inc cx
        jmp lap
        
    break:
    
    lap2:
        pop ax
        mov dl, al
        mov ah, 2
        int 21h
        loop lap2
    
    mov ah, 4ch
    int 21h
    
main endp

end main