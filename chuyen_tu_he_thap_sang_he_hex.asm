.model small
.stack 100h
.data
    crlf db 13, 10, '$'
    x db ? 
    d dw 10 
    h dw 16
.code

main proc
    
    mov ax, @data
    mov ds, ax
    
    call nhapSo
    call endl 
    mov ah, 0
    call decToHex
    
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

decToHex proc
    
    push ax
    push dx
    push cx
    mov cx, 0
    lap2:
        mov dx, 0
        cmp ax, 0
        je break2
        
        div h
        cmp dx, d
        jge xuly1
        jl xuly2
        
        xuly1:
            sub dx, 10
            add dx, 'A' 
            push dx  
            jmp ra
        xuly2:
            add dx, '0'
            push dx
            
        ra: 
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
decToHex endp

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