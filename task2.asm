; Input 3 symbols and print in reverse order
; a b c -> c b a
; We will work with stack to do it 
MODEL small 
stk segment stack
		db 256 dup('?') ; segment on stack
stk ends	

.data

.code

.386
main:

	mov ax , @data
	mov ds , ax
; Input one symbol
	mov ah , 01h
	int 21h
; Push in the stack
	push ax 
; Input second symbol
	int 21h
	push ax
; Input third symbol
	int 21h
	push ax
; Printing top symbol from stack
	pop dx
	mov ah, 02h
	int 21h
; Printing second sybol from the stack
	pop dx
	int 21h
; Printing third symbol from the stack
	pop dx
	int 21h
	
	mov ax , 4c00h
	int 21h
end main
	