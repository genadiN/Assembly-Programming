	; Importnat tasks for every programmer 
; input symbol from the keyboard - always we do when input a symbol
	; ah -> 01h
	; int 21h
    ; al -> value of the input symbol
; Print symbol on the screen
	; ah -> 02h
	; dl -> symbol for printing
	; int 21h
; Print symbols while meet symbol $
	; ah -> 09h
	; 1)dx -> offset data segment
	; 2) dx -> mov dx , offset string( leadx , stirng)
	; int 21h

; input symbol and print 
; 1  if it is a - alphabet ( bukva )
; 2 if it is a - digit ( cifra ) 
; 3 if it is a - another type ( inache ) 
; // always nescessary 
MODEL small 


stack 256 

.data 
symbol db ? 
message db 'Enter 1 symbol: ' , '$'
.code
.386 ; The code of processor 
main
	mov ax , @data
	mov ds , ax
	
	mov ah , 09h ; Printing the message = " Enter 1 symbol " 
	mov dx , offset message
	int 21h

	mov ah , 01h; Entering the symbol
	int 21h; Process for enter a symbol

; When we input a symbol it writes on 'al' part
	mov symbol , al ; move symbol which we inputed in symbol

	mov ah , 02h; Printing new Line
	mov dl , 10
	int 21h
	
; Process for make a difference between 
; digit alphabet and another type 
	cmp symbol , 'z'
; jump if lower or equal
; isBeforeZ - name of the jump
	jle isBeforeSmallZ
; another jump if symbol is bigger than 'z'	
	jmp asnwerIsOther
isBeforeSmallZ:
	cmp symbol, 'a'
	; jump if greater or equal
	jge answerIsLetter
	cmp symbol, 'Z'
	jle isBeforeBigZ
	jmp asnwerIsOther
isBeforeBigZ:
	cmp symbol, 'A' ; compare symbol with 'A'
	jge answerIsLetter
	cmp symbol, '9'
	jle isBefore9
	jmp asnwerIsOther ; jump without conditions
	
isBefore9: 
	cmp symbol, '0'
	jge asnwerIsDigit		
asnwerIsOther:
	mov ah , 02h ; Printing 3 if answer is other
	mov dl , '3' ; '3' == 33h
	int 21h
	jmp exit ; jump to exit if we print '3'
asnwerIsDigit:
	mov ah , 02h
	mov dl , '2'
	int 21h
	jmp exit
answerIsLetter:
	mov ah , 02h
	mov dl , '1'
	int 21h
	;
exit:
; Code for return statement
; ah-> 00h , ac-> 4c
	mov ax , 4c00h ; == mov ah, 4ch
	int 21h
	end main
; For running
; mount a C;\tasm\BIN
; a:
; task1
; tlink task1
; task1
; Enter 1 symbol: D1
 
 
