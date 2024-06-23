.model small
.stack 100h
.data   
    crlf db 13, 10, '$'
    a dw ?
    d dw 10 
    b dw 2
    x db ?
.code

main proc
    
    mov ax, @data
    mov ds, ax
    
    call nhapSo
    call endl  
    mov ah, 0
    call decToBin
    
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

decToBin proc
    
    push ax
    push dx
    push cx
    
    mov cx, 0
    lap2:
        mov dx, 0 
        cmp ax, 0
        je break2
       
        mov ah, 0
        div b
        add dx, '0'
        push dx
        
        inc cx
        jmp lap2  
    
    break2:
    xong1:
        pop dx
        mov ah, 2
        int 21h  
        
        loop xong1
    
    pop cx
    pop dx
    pop ax
    
    ret
decToBin endp

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