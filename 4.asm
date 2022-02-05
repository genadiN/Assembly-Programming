; input 2 digits
; and find their subtraction
; a = 2 , b = 3 
; print a + b = 5

MODEL small

stack 256 

.data
; input variables a , b ,c
; int a = 0 , b = 0, c = 0
	a db 0
;b db 0
; c db 0
	res db 0, 0
.code
main:

	mov ax , @data
	mov ds , ax
; Make bx = zero ( 0 )	
	xor bx , bx
; Input variable 'a'
	mov ah, 01h
	int 21h
	mov a , al
;Input variable 'b'	
	int 21h
;dobavish resultata ot al kum a 
; a = a + al
; a = a + b( al = b)
	;adc a , ala
	add al , a
; Ascii adjust for addition
; dali CarryFlag da stava 1
	aaa 
	mov res[bx] , al
	
	inc bx
; addition with carry flag	
; 09 + 09 = 18
 
  	adc res[bx] , 0
	
	
; Printing two symbols
	mov ah , 02h
	
	mov dl , res[bx]
	add dl , 30h
	int 21h
	
	dec bx
	mov dl , res[bx]
	add dl , 30h
	int 21h
	
;Return 0 statement
	mov ax , 4c00h
	int 21h
end main