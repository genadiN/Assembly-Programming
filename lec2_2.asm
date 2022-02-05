masm 								;regime for wordk TASM: masm 
mode small							; model of the memory

.data								; data segment 
	message db 'Hello World!$'
	
.stack 256h							; stack segment

.code								; code segment
main:								
	mov ah , @data					; loading address of the segment with dates in register 'ax'
	mov ds , ax						; move ax in ds
	mov ah , 9						
	mov dx , offset message
	int 21h							; print the message
	
	mov ax , 4c00h					; loading 4c00h in ax register
	int 21h							;interrupt with 21h

end main							;finish of the program with enter point main