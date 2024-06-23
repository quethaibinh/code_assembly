.model small
.stack 100h
.data    

    str dw 100 dup('$')
    crlf db 13, 10, '$'

.code
main proc
    
    mov ax, @data
    mov ds, ax
    
    lea si, str
    lap1:
        mov ah, 1
        int 21h
        cmp al, 13
        je break1
         
        cmp al, 'a'
        jl inhoa
        sub al, 32 
        
        inhoa:
        mov [si], al
        inc si 
        jmp lap1
        
    break1:
    
    call endl
    
    lea dx, str
    mov ah, 9
    int 21h
    
    mov ah, 4ch
    int 21h
main endp     

endl proc
    
    push dx
    push ax
    lea dx, crlf
    mov ah, 9
    int 21h
    pop ax
    pop dx     
         
    ret
endl endp

end main