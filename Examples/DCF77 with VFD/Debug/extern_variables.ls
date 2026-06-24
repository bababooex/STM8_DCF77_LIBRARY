   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.3 - 22 May 2025
   3                     ; Generator (Limited) V4.6.6 - 07 Jan 2026
  56                     ; 4 void visual_handler(void)//handle blink edge
  56                     ; 5 {
  58                     .text:	section	.text,new
  59  0000               _visual_handler:
  61  0000 88            	push	a
  62       00000001      OFST:	set	1
  65                     ; 7 		col = colonToggle;
  67  0001 b600          	ld	a,_colonToggle
  68  0003 6b01          	ld	(OFST+0,sp),a
  70                     ; 8 		if (col) pt6311_write_char(9, '8');//can be made differently, I used images on right
  72  0005 0d01          	tnz	(OFST+0,sp)
  73  0007 2708          	jreq	L72
  76  0009 ae0938        	ldw	x,#2360
  77  000c cd0000        	call	_pt6311_write_char
  80  000f 2006          	jra	L13
  81  0011               L72:
  82                     ; 9 		else     pt6311_write_char(9, ' ');
  84  0011 ae0920        	ldw	x,#2336
  85  0014 cd0000        	call	_pt6311_write_char
  87  0017               L13:
  88                     ; 10 }
  91  0017 84            	pop	a
  92  0018 81            	ret
 125                     	switch	.ubsct
 126  0000               _colonToggle:
 127  0000 00            	ds.b	1
 128                     	xdef	_colonToggle
 129  0001               _rtc_second:
 130  0001 00            	ds.b	1
 131                     	xdef	_rtc_second
 132                     	xdef	_visual_handler
 133                     	xref	_pt6311_write_char
 153                     	end
