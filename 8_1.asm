MASM
model small

stack 256

.data
	arr db ?,?,?,?,?,?,?,?,?,?
	mes1 db 10, 'Enter array: ', '$' 
	mes2 db 10 , 'Print array: ' , '$'
	mes3 db 10 , 'Enter digit: $'
	count db 0
.code
main:
	mov ax , @data
	mov ds , ax
	
	
	mov ah , 09h
	lea dx , mes1
	int 21h
	
	mov cx, 10
	xor bx , bx
	mov ah , 01h
enterLoop:
	int 21h
	mov arr[bx] , al
	inc bx
loop enterLoop
	
	mov ah, 09h
	mov dx , offset mes3
	int 21h
	
	mov ah , 01h
	int 21h
	
	mov ah , 09h
	lea dx , mes2
	int 21h
	
	mov cx , 10
	xor bx , bx
countDigit:
	cmp al , arr[bx]
	jne notEqual
	inc count
notEqual:
	inc bx
loop countDigit
	
	cmp count , 10
	je countIs10
	
	mov ah , 02h
	mov dl , count
	add dl , 30h
	int 21h
	jmp exit
countIs10:
	mov ah , 02h
	mov dl, '1'
	int 21h
	mov dl , '0'
	int 21h
exit:
	mov ax , 4c00h
	int 21h
end main