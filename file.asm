MODEL small

stack 256

.data
 fname db 'genadi.txt' , 0
 handle dw ?
 msg db 'Print the data: $'
 buffer db 100 dup ('$')
 
.code
main:
	mov ax , @data
	mov ds , ax
	
; Creae a new file
;	mov ah , 3ch
;	lea dx, fname
;	mov cl , 0
;	int 21h
;	mov handle , ax

;Open an existing file
	mov ah, 3dh
	lea dx, fname
	mov al, 2
	int 21h
	mov handle ,ax

;Print the msg	
	lea dx , msg
	mov ah, 09h
	int 21h

;Make si and cx equal to 0
	mov si, 0
	mov cx, 0

;again:
; Input the text	
;	mov ah, 01h
;	int 21h
;	cmp al , 13
;	je exit
;	mov buffer[si] , al
;	inc si
;	inc cx
;	jmp again
	
;exit:

;How to write a text in File
;	mov ah, 40h
;	mov bx , handle
;	lea dx , buffer
;	;mov cx
;	int 21h

;How to read text from a file
	mov ah , 3fh
	lea dx,buffer
	mov cx , 100
	mov bx , handle
	int 21h

;Print the the text from file

	lea dx , buffer
	mov ah, 09h
	int 21h

;CLose a file
	mov ah , 3eh
	mov bx , handle
	int 21h
	
;Exit
	mov ax , 4c00h
	int 21h
end main