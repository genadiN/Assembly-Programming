;Enter symbol and print
; 1-> letter
; 2 -> digit
; 3 -> other

MODEL small 

stack 256

.data
	symbol db ?
	message1 db "Enter one symbol: $"
	message2 db  10 , "The symbol is from part: $"
.code
main:
	mov ax , @data
	mov ds , ax
;Print message1	
	mov ah, 09h
	mov dx, offset message1
	int 21h

;Input symbol	
	mov ah, 01h
	int 21h
	
	mov ah , 09h
	mov dx , offset message2
	int 21h
	
	cmp al , '0'
	jl symbolIsOther

	cmp al , '9'
	jle symbolIsDigit
	
	cmp al , 'A'
	jl symbolIsOther
	
	cmp al , 'Z'
	jle symbolIsLetter
	
	cmp al , 'a'
	jl symbolIsOther
	
	cmp al , 'z'
	jle symbolIsLetter
	jmp symbolIsOther
	
symbolIsLetter:
	mov ah , 02h
	mov dl , '1'
	int 21h
	jmp exit

symbolIsDigit:
	mov ah , 02h
	mov dl , '2'
	int 21h
	jmp exit
	
symbolIsOther:
	mov ah, 02h
	mov dl , '3'
	int 21h
	
exit: 
	mov ax , 4c00h
	int 21h
end main