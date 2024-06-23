.model small
.stack 100h
.data
    str db 50 dup('$')
    crlf db 13, 10, '$' 

.code
main proc
    mov ax, @data
    mov ds, ax
    
    lea si, str
    lap:     
        mov ah, 1
        int 21h
        
        cmp al, 13
        je break
        
        mov [si], al  
        inc si
        jmp lap
    break:
    
    mov byte ptr [si], '$'
    call xuongdong
          
    
    lea dx, str
    mov ah, 9
    int 21h
    
    mov ah, 4ch
    int 21h
    
main endp     

xuongdong proc   
    
    push dx
    push ax
    
    lea dx, crlf
    mov ah, 9
    int 21h  
    
    pop ax
    pop dx 
    
    ret
    
xuongdong endp

end main