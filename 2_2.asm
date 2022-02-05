MODEL small

stack 256

.data
	a db ?
	b db ?
	third db ?
	messageA db 'Enter a: ' , '$'
	messageB db 'Enter b: ' , '$'
	messageC db 'Enter c: ' , '$'
.code
.386
main:
	mov ax , @data
	mov ds , ax
	
	mov ah , 09h
	mov dx , offset messageA
	int 21h
	
	mov ah , 01h
	int 21h
	mov a , al
	
	mov ah , 02h
	mov dl , 10
	int 21h
	
	mov ah , 09h
	mov dx , offset messageB
	int 21h
	
	mov ah , 01h
	int 21h
	mov b , al
	
	mov ah , 02h
	mov dl, 10
	int 21h
	
	mov ah , 09h
	mov dx , offset messageC
	int 21h
	
	mov ah , 01h
	int 21h
	mov third, al
	
	mov ah , 02h
	mov dl , 10
	int 21h
	
	mov ah , 02h
	mov dl , third
	int 21h
	
	
	mov dl, b
	int 21h
	
	mov dl , a
	int 21h
	
	mov ax , 4c00h
	int 21h
end main
	
	