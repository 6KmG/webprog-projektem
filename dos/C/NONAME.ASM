	ifndef	??version
?debug	macro
	endm
	endif
	?debug	S "noname.c"
_TEXT	segment	byte public 'CODE'
DGROUP	group	_DATA,_BSS
	assume	cs:_TEXT,ds:DGROUP,ss:DGROUP
_TEXT	ends
_DATA	segment word public 'DATA'
d@	label	byte
d@w	label	word
_DATA	ends
_BSS	segment word public 'BSS'
b@	label	byte
b@w	label	word
	?debug	C E977794A57086E6F6E616D652E63
	?debug	C E92010AB1207737464696F2E68
	?debug	C E92010AB12087374646172672E68
_BSS	ends
_TEXT	segment	byte public 'CODE'
;	?debug	L 2
_main	proc	near
	push	bp
	mov	bp,sp
	sub	sp,2
;	?debug	L 3
	mov	word ptr [bp-2],2
;	?debug	L 4
	xor	ax,ax
	jmp	short @1
@1:
;	?debug	L 5
	mov	sp,bp
	pop	bp
	ret	
_main	endp
_TEXT	ends
	?debug	C E9
_DATA	segment word public 'DATA'
s@	label	byte
_DATA	ends
_TEXT	segment	byte public 'CODE'
_TEXT	ends
	public	_main
	end
