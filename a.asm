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

	ENDS
	END	START

