.model small
.stack 100h
.data
    str db 'kien TRUC MaY tiNh$'
.code
main proc
    mov ax, @data
    mov ds, ax
      
    lea si, str
    lap:
        mov al, ds:[si]
        cmp al, '$'
        je break 
        
        call inxong
        mov dl, al
        mov ah, 2
        int 21h
        inc si
        jmp lap      
        
    break:
    
    mov ah, 4ch
    int 21h
    
main endp  

inxong proc
    cmp al, 'A'
    jl continue
    cmp al, 'Z'
    jg continue
    add al, 32  
    
    continue:     
    ret
    
inxong endp

end main