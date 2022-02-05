; Enter and array , input a digit and 
; find how many times this digit 
; is in the array 
; 1 2 2 5 5 6 6 6 8 8 8 
; Enter digit 5 -> 2
; Enter digit 8 -> 3
; Enter digti 1 -> 1

MODEL small

stack 256

.data
;definint an array
arr db ?,?,?,?,?,?,?,?,?,?
; defining count to count numbers
count db 0
; 1 -> '1' -> 1 + 30h (40d) -> 49d (31h) -> '1'
; 49 - 48 = 1
; '1' -> 49 (al)
message1 db "Enter array of digits [0 - 9]: $" 
message2 db 10 , "Enter digit to find:$"	
.code
main:
	mov ax , @data
	mov ds, ax
; printing message1
	mov ah , 09h
	mov dx , offset message1
	int 21h
; loop for entering 10 digits
	mov cx , 10
	mov ah , 01h
	xor bx , bx
enterLoop:	
	int 21h
	mov arr[bx] , al
	inc bx
	loop enterLoop

; printing message2	
	mov ah , 09h
	mov dx , offset message2
	int 21h

; Enter a digit to find	
	mov ah , 01h
	int 21h
; cx is like a counter to the loop
	mov cx, 10
; realization of loop
; Nulling the bx
	xor bx, bx ; zanulqvame
lopatar:
; comparing elements in array with digit which we inputed
	 cmp arr[bx] , al
; jump if equal	 
	 jne notEqual
; increment coount with 1 
; we find eleent in array equal to our inputed digit
	 inc count
; increment index
notEqual:
	inc bx
; if it is not equal like else
;	 jmp notEqual
	 loop lopatar
; printing our count 
; if count is > 9
	cmp count , 10
	je twoDigitPrint
	mov ah, 02h
	mov dl , count
; add '0' to dl to make it real digit
	add dl , 30h
	int 21h	
	jmp exit
twoDigitPrint:
	mov ah , 02h
	mov dl , '1'
	int 21h
	mov dl, '0'
	int 21h
exit: 
; return 0 statement
	mov ax , 4c00h
	int 21h

end main