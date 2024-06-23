.model small
.stack 100h
.data
    crlf db 13, 10, '$'
    a dw ?
    b dw ? 
    x dw ?
    d dw 10
 
.code

main proc
    
    mov ax, @data
    mov ds, ax
    
    call nhapSo
    mov a, ax
    call endl
    mov ah, 0
    call nhapSo
    mov b, ax 
    call endl
    
    lap3:
        mov bx, b
        cmp a, bx
        je break3
        jg xuly1
        jl xuly2
        
        xuly1:
            mov ax, a
            sub ax, b
            mov a, ax
            jmp ra
            
        xuly2:
            mov ax, b
            sub ax, a
            mov b, ax  
            
        ra:
        jmp lap3
        
    break3:  
    mov ah, 0
    mov ax, a
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
        mov ah, 0
        mov bx, ax
        mov ax, x
        mul d
        add ax, bx
        mov x, ax
        
        jmp lap1
        
    break1: 
    mov ah, 0
    mov ax, x
    
    ret
nhapSo endp  

inSo proc
    
    push ax
    push dx
    push cx
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
    
    pop cx
    pop dx
    pop ax
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