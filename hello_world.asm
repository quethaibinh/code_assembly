.model small
.stack 100h
.data
    crlf db 13, 10, '$'
    str db 'hello world$'
.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov si, offset str
    lap:   
        mov al, [si]
        cmp al, '$'
        je break
        mov dl, al
        mov ah, 2
        int 21h  
        inc si  
        jmp lap
        
    break:    
    mov ah, 4ch
    int 21h
    
main endp  

END main