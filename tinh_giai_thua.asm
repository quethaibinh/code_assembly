.model small
.stack 100h
.data
    crlf db 13, 10, '$'
    a dw ?
    n dw ?
    x db ? 
    d dw 10
.code

main proc
    
    mov ax, @data
    mov ds, ax
    
    call nhapSo
    mov ah, 0
    mov a, ax  
    call endl
    
    mov cx, a
    mov n, 1
    lap3:
        mov ax, n
        mul cx
        mov n, ax
        loop lap3
        
    mov ax, n
    call inSo    
    
    mov ah, 4ch
    int 21h
    
main endp  

nhapSo proc
    
    mov x, 0
    lap1:
        mov ah, 1
        int 21h
        
        cmp al, 13
        je break1
        
        sub al, '0'
        mov bl, al
        mov al, x
        mul d
        add al, bl
        mov x, al
        
        jmp lap1
        
    break1:
    mov al, x
    
    ret
nhapSo endp

inSo proc
    
    mov cx, 0
    lap2:
        mov dx, 0
        cmp ax, 0
        je break2
        
        div d
        add dx, '0'
        push dx
        
        inc cx
        jmp lap2
        
    break2:
    xong:
        pop dx
        mov ah, 2
        int 21h
        loop xong
    
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