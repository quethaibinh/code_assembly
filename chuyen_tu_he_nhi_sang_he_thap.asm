.model small
.stack 100h
.data
    crlf db 13, 10, '$'
    b dw 2
    d dw 10
    x db ?
.code

main proc
    
    mov ax, @data
    mov ds, ax
    
    call binToDec   
    call endl
    mov ah, 0
    call inSo
    
    mov ah, 4ch
    int 21h
    
main endp

binToDec proc
             
    lap1:
        mov ah, 1
        int 21h
        
        cmp al, 13
        je break1
        
        sub al, '0'
        mov ah, 0
        mov bx, ax
        mov al, x
        mul b
        add al, bl
        mov x, al
        
        jmp lap1
        
    break1:
    mov al, x           
             
    ret
binToDec endp

inSo proc
    
    mov cx, 0
    lap3:
        mov dx, 0
        cmp ax, 0
        je break3
        
        div d
        add dx, '0'
        push dx
        
        inc cx
        jmp lap3
        
    break3:
    
    xong2: 
        pop dx  
        mov ah, 2
        int 21h
        loop xong2
    
    ret
inSo endp

endl proc
    
    push ax
    push dx
    lea dx, crlf
    mov ah, 9
    int 21h
    pop dx
    pop ax
    
    ret
endl endp

end main