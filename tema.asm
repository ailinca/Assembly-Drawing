org 100h

INCLUDE 'emu8086.inc'
PRINTN "Iti doresti o casa? "
PUTC 13 ; linie noua
PUTC 10
LEA SI, msg
CALL print_string
CALL scan_num
PUTC 13
PUTC 10
PRINT "Ai introdus:  "
MOV AX, CX
CALL print_num     
PRINTN ", ceea ce inseamna ca vrei chiar vila.  "

jmp code
code: mov ah, 0
    mov al, 13h ; trecere in mod grafic 320x200
    int 10h

;Desenarea structurii casei (3D)   

;afisare latura inferioare
    mov cx, 200
    mov dx, 150
    mov al, 15
u2: mov ah, 0ch
    int 10h
    dec cx
    cmp cx, 100
    ja u2

;latura din stanga
    mov cx, 100
    mov dx, 150
    mov al, 15
u3: mov ah, 0ch
    int 10h
    dec dx
    cmp dx, 80
    ja u3

;latura din dreapta
    mov cx, 200
    mov dx, 150
    mov al, 15 
u4: mov ah, 0ch
    int 10h
    dec dx
    cmp dx, 80
    ja u4  

;acoperis stanga
    mov cx, 100
    mov dx, 80
    mov al, 15
u5: mov ah, 0ch  
    int 10h
    inc cx
    dec dx
    cmp dx, 30
    ja u5

;acoperis dreapta
    mov cx, 200
    mov dx, 80
    mov al, 15
u6: mov ah, 0ch
    int 10h
    dec dx
    dec cx
    cmp dx, 30  
    ja u6 
 
;Desenarea usii

;usa latura dreapta
    mov cx, 160
    mov dx, 150
    mov al, 15 
u7: mov ah, 0ch
    int 10h
    dec dx
    cmp dx, 120
    ja u7  

;usa latura stanga  
    mov cx, 140
    mov dx, 150
    mov al, 15 
u8: mov ah, 0ch
    int 10h
    dec dx
    cmp dx, 120
    ja u8  

; usa latura superioara
    mov cx, 160
    mov dx, 120
    mov al, 15
u9: mov ah, 0ch
    int 10h
    dec cx
    cmp cx, 140
    ja u9
 
;Desenarea ferestrelor

;Fereastra stanga

;latura dreapta  
    mov cx, 135
    mov dx, 110
    mov al, 15 
u10:mov ah, 0ch
    int 10h
    dec dx
    cmp dx, 90
    ja u10   
    
;usa latura superioara
    mov cx, 135
    mov dx, 90
    mov al, 15
u11:mov ah, 0ch
    int 10h
    dec cx
    cmp cx, 115
    ja u11    
    
;usa latura stanga  
    mov cx, 115
    mov dx, 110
    mov al, 15 
u12:mov ah, 0ch
    int 10h
    dec dx
    cmp dx, 90
    ja u12  
    
;usa latura inferioara
    mov cx, 135
    mov dx, 110
    mov al, 15
u13:mov ah, 0ch
    int 10h
    dec cx
    cmp cx, 115
    ja u13
 
;Fereastra dreapta

;latura dreapta  
    mov cx, 185
    mov dx, 110
    mov al, 15 
u14:mov ah, 0ch
    int 10h
    dec dx
    cmp dx, 90
    ja u14  
 
;latura superioara
    mov cx, 185
    mov dx, 90
    mov al, 15
u15:mov ah, 0ch
    int 10h
    dec cx
    cmp cx, 165
    ja u15  
    
;latura stanga  
    mov cx, 165
    mov dx, 110
    mov al, 15 
u16:mov ah, 0ch
    int 10h
    dec dx
    cmp dx, 90
    ja u16  

;latura inferioara
    mov cx, 185
    mov dx, 110
    mov al, 15
u17:mov ah, 0ch
    int 10h
    dec cx
    cmp cx, 165
    ja u17    
 
;Desenare plan 3D 

;linie acoperis superioara
    mov cx, 150
    mov dx, 30
    mov al, 15
u18:mov ah, 0ch  
    int 10h
    inc cx
    inc cx
    dec dx
    cmp dx, 10
    ja u18    
 
;linie acoperis inferioara
    mov cx, 200
    mov dx, 80
    mov al, 15  
u19:mov ah, 0ch  
    int 10h
    inc cx
    inc cx
    dec dx
    cmp dx, 60
    ja u19     
 
;linie podea  
    mov cx, 200
    mov dx, 150
    mov al, 15   
u20:mov ah, 0ch  
    int 10h
    inc cx
    inc cx
    dec dx
    cmp dx, 130
    ja u20 

;linie perete 
    mov cx, 240
    mov dx, 130
    mov al, 15 
u21:mov ah, 0ch
    int 10h
    dec dx
    cmp dx, 60
    ja u21  

;linie acoperis spate
    mov cx, 240
    mov dx, 60
    mov al, 15
u22:mov ah, 0ch
    int 10h
    dec dx
    dec cx
    cmp dx, 10  
    ja u22   
 
PUTC 13 ; linie noua
PUTC 10
PRINTN "Sper ca esti multumit." 
PRINTN "Sedere placuta!"

;asteptare apasare tasta
    mov ah,00
    int 16h 
 
msg DB 'Daca da, introdu numarul tau preferat: ', 0
DEFINE_SCAN_NUM
DEFINE_PRINT_STRING
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS 
 

ret




