   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.3 - 22 May 2025
   3                     ; Generator (Limited) V4.6.6 - 07 Jan 2026
  57                     ; 3 void visual_handler(void)//handle blink edge
  57                     ; 4 {
  59                     .text:	section	.text,new
  60  0000               _visual_handler:
  62  0000 88            	push	a
  63       00000001      OFST:	set	1
  66                     ; 6 		col = colonToggle;
  68  0001 b600          	ld	a,_colonToggle
  69  0003 6b01          	ld	(OFST+0,sp),a
  71                     ; 7 		if (col) HD1650_colonOn();
  73  0005 0d01          	tnz	(OFST+0,sp)
  74  0007 2705          	jreq	L72
  77  0009 cd0000        	call	_HD1650_colonOn
  80  000c 2003          	jra	L13
  81  000e               L72:
  82                     ; 8 		else     HD1650_colonOff();
  84  000e cd0000        	call	_HD1650_colonOff
  86  0011               L13:
  87                     ; 9 }
  90  0011 84            	pop	a
  91  0012 81            	ret
 115                     	switch	.ubsct
 116  0000               _colonToggle:
 117  0000 00            	ds.b	1
 118                     	xdef	_colonToggle
 119                     	xdef	_visual_handler
 120                     	xref	_HD1650_colonOff
 121                     	xref	_HD1650_colonOn
 141                     	end
