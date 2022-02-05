data segment  para public 'data'
	message db 'Hello Word!$'
data ends
stk segment stack
	DB 256 dup('?')   		;segment on the stack
stk ends
code segment para public 'code'
	assume cs:code, ds:data , ss:stk    ; start of the code segment
main:
	mov ax ,data		;data segment in ax
	mov ds , ax			; ax in ds
	mov ah , 9
	mov dx , offset message
	int 21h						; print the message -> Hello Wordl!
	mov ax , 4c00h				; 4c00h in ax
	int 21h						; exit from the program like return 0;
code ends						; finish of the code segment
end main						; finish  of the program with entered point 