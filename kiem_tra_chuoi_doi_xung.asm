.model small
.stack 100h
.data
    crlt db 13, 10, '$'  
    strk db 'No$'
    strc db 'Yes$'
    str db 50 dup('$')
.code

main proc
    
    mov ax, @data
    mov ds, ax
    
    lea si, str 
    mov cx, 0
    lap:
        mov ah, 1
        int 21h
        
        cmp al, 13
        je break
        
        mov [si], al
        mov ah, 0
        push ax  
        inc cx
        inc si
        jmp lap
        
    break:   
    call xuongdong
    
    lea di, str
    lap2:
        pop ax 
        cmp [di], al
        jne break2   
        inc di
        loop lap2 
        
    lea dx, strc
    mov ah, 9
    int 21h
    jmp kthuc
            
    break2:
    lea dx, strk
    mov ah, 9
    int 21h
    
    kthuc:
    
    mov ah, 4ch
    int 21h  
    
    
main endp 

xuongdong proc
    
    push ax
    push dx
    
    lea dx, crlt
    mov ah, 9
    int 21h
    
    pop dx
    pop ax
    
    ret
xuongdong endp

end main