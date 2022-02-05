; programa koqto ni 
;pozvolqva vuvejdaneto na 100 simvola 
;i gi zapisva vuv file
masm
model small

.data
filename db "EXAMPLE.TXT"
message db 100 dup  (?)
count dw 0
; 'dw' because we go to 'ax' , in the code
handle dw 0
.code

main:
;ALways write it
	mov ax , @data
	mov ds , ax
	
;Input 100 symbols in the loop
	mov cx , 100
;bx = 0 , zanulqvane na regirstur bx
	xor bx , bx
	
	mov ah , 01h
loopEnter:
; Input symbol
	int 21h
; comparvame stoinostta v 'al' koqto sme vuveli 
; ot keyboard sus 'space'
	cmp al , ' ' 
; jump if equal
; toest ako e izpulnan compare otivame pri 'exit:'
	je exit
; V 'al' se zapisva stoinostta koqto 
; sme vuveli ot klaviaturata
	mov message[bx], al 
;increment 'bx' and 'count'
	inc bx
	inc count
	loop loopEnter
exit: 
; Open a file
	mov ah , 3dh
	mov al , 02h
	lds dx, offset filename
	int 21h
	mov handle , ax
; Write in a file
	mov ah , 40h
	mov bx , handle
; Bytes which we want to read
	mov cx , count
	mov dx , offset message
; Value is saved in 'ax' part
	int 21h
; jump if carry flag == IF CarryFlag = 1 -> do something
;	jc -> it is not need for now
; Result from '21h' move to handle
	mov handle , ax
	
; Close a file
	mov ah , 3eh
; handle -> obrushtenie kum file
	mov bx , handle	
	int 21h
	
	mov ax , 4c00h
	int 21h
	
end main

; Go to tasm folder 
; Create  'EXAMPLE.TXt' file
; Go to DOSBOX and run the program
; compile the program 
; and it should save our data in a file 