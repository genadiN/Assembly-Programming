MODEL small 

stack 256

.data
	a db 0
	b db 0
	res db 0
	message1 db "Enter first digit: $"
	message2 db 10, "Enter second digit: $"
.code
main:
	mov ax , @data
	mov ds , ax
	
	mov ah, 09h
	mov dx , offset message1
	int 21h
	
	mov ah , 01h
	int 21h
	sub al , 30h
	mov a , al
	
	mov ah, 09h
	mov dx, offset message2
	int 21h
	
	mov ah, 01h
	int 21h
	sub al, 30h
	mov b, al

;new line
	mov ah , 02h
	mov dl , 10
	int 21h
	
; make numbers Binary	
	mov al, a
	mov bl, b
	
	cmp al, bl
	jbe aIslower
	sub al , bl
	mov res , al
	jmp display1

aIslower:
	sub bl , al
	mov res , bl
	
	mov ah, 02h
	mov dl, 2dh
	int 21h

display1:
	mov dl , res
	add dl , 30h
	mov ah, 02h
	int 21h
exit:
	mov ax , 4c00h
	int 21h
	
end main