MODEL small 

stack 256

.data
	a db 2
	b db 8 
.code
main:
	mov ax , @data
	mov ds , ax
	
	mov bl , b
	mov al , a
	mul b
	
	mov ax, 4c00h
	int 21h
	
end main