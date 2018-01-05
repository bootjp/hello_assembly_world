;section .text
;org 0x100
	;mov	ah, 0x9
	;mov	dx, hello
	;int	0x21

	;mov	ax, 0x4c00
	;int	0x21

;section .data
;hello:	db 'Hello, world!', 13, 10, '$'

CODE	SEGMENT
	ASSUME	DS:CODE,CS:CODE,ES:CODE,SS:CODE
	.186
	ORG	100h

START:
    mov	ah,2
	mov	dl,'A'
	int	21h

	mov	ax,4c00h
	int	21h
    ;ENDS
    ;END	START
CODE	ENDS
	END	START
;hello:	db 'Hello, world!', 13, 10, '$'
