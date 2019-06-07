
	section code,code

;---------------------------------------------------------
; Calculate length of a zero-terminated string
; in
;	a0	string
; out
;	d0.l	string length

	XDEF	strlen
strlen
	moveq	#-1,d0
.next_char
	addq.l	#1,d0
	tst.b	(a0)+
	bne.s	.next_char
	rts
