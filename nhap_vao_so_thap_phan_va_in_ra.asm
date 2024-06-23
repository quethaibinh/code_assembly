.model small
.stack 100h
.data
    
    crlf db 13, 10, '$'
    a dw ?
    b dw ?
    x db ? 
    str db 'hello$'

.code

main proc
    
    mov ax, @data
    mov ds, ax   
    mov bx, 10
    
    call nhapSo
    
    call endl
    
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
        je break
        
        sub al, '0'
        mov cl, al
        mov al, x
        mul bx 
        add al, cl
        mov x, al
        
        jmp lap1
        
    break:
    
    mov al, x
    
    ret
nhapSo endp

inSo proc 
    
    push ax
    push dx
    mov cx, 0
    lap2:
        mov dx, 0
        cmp ax, 0
        je break1 
        mov ah, 0    ; de ax / bx khong bi sai
        div bx
        push dx
        inc cx
        jmp lap2
        
    break1:
 
    lap3:
        pop dx
        add dl, '0'
        mov ah, 2
        int 21h
        loop lap3
    
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