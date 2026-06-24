   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.3 - 22 May 2025
   3                     ; Generator (Limited) V4.6.6 - 07 Jan 2026
  44                     ; 13 void PCF8563_init(void)//call after swi2c init
  44                     ; 14 {
  46                     .text:	section	.text,new
  47  0000               _PCF8563_init:
  51                     ; 15     PCF8563_write(PCF8563_CONTROL1, 0x00);
  53  0000 5f            	clrw	x
  54  0001 cd0000        	call	_PCF8563_write
  56                     ; 16     PCF8563_write(PCF8563_CONTROL2, 0x00);
  58  0004 ae0100        	ldw	x,#256
  59  0007 cd0000        	call	_PCF8563_write
  61                     ; 17 }
  64  000a 81            	ret
 108                     ; 19 unsigned char PCF8563_read(unsigned char address)
 108                     ; 20 {
 109                     .text:	section	.text,new
 110  0000               _PCF8563_read:
 112  0000 88            	push	a
 113       00000001      OFST:	set	1
 116                     ; 21     uint8_t value = 0x00;
 118  0001 0f01          	clr	(OFST+0,sp)
 120                     ; 22     swi2c_read_buf(PCF8563_ADDR, address, &value, 1);
 122  0003 ae0001        	ldw	x,#1
 123  0006 89            	pushw	x
 124  0007 96            	ldw	x,sp
 125  0008 1c0003        	addw	x,#OFST+2
 126  000b 89            	pushw	x
 127  000c aea200        	ldw	x,#41472
 128  000f 97            	ld	xl,a
 129  0010 cd0000        	call	_swi2c_read_buf
 131  0013 5b04          	addw	sp,#4
 132                     ; 23 		return value;
 134  0015 7b01          	ld	a,(OFST+0,sp)
 137  0017 5b01          	addw	sp,#1
 138  0019 81            	ret
 182                     ; 26 void PCF8563_write(unsigned char address, unsigned char value)
 182                     ; 27 {
 183                     .text:	section	.text,new
 184  0000               _PCF8563_write:
 186  0000 89            	pushw	x
 187       00000000      OFST:	set	0
 190                     ; 28     swi2c_write_buf(PCF8563_ADDR, address, &value, 1);
 192  0001 ae0001        	ldw	x,#1
 193  0004 89            	pushw	x
 194  0005 96            	ldw	x,sp
 195  0006 1c0004        	addw	x,#OFST+4
 196  0009 89            	pushw	x
 197  000a 7b05          	ld	a,(OFST+5,sp)
 198  000c aea200        	ldw	x,#41472
 199  000f 97            	ld	xl,a
 200  0010 cd0000        	call	_swi2c_write_buf
 202  0013 5b04          	addw	sp,#4
 203                     ; 29 }
 206  0015 85            	popw	x
 207  0016 81            	ret
 241                     ; 31 unsigned char bcd_to_decimal(unsigned char value)
 241                     ; 32 {
 242                     .text:	section	.text,new
 243  0000               _bcd_to_decimal:
 245  0000 88            	push	a
 246  0001 88            	push	a
 247       00000001      OFST:	set	1
 250                     ; 33     return ((value & 0x0F) + (((value >> 4) & 0x0F) * 10));
 252  0002 4e            	swap	a
 253  0003 a40f          	and	a,#15
 254  0005 97            	ld	xl,a
 255  0006 a60a          	ld	a,#10
 256  0008 42            	mul	x,a
 257  0009 9f            	ld	a,xl
 258  000a 6b01          	ld	(OFST+0,sp),a
 260  000c 7b02          	ld	a,(OFST+1,sp)
 261  000e a40f          	and	a,#15
 262  0010 1b01          	add	a,(OFST+0,sp)
 265  0012 85            	popw	x
 266  0013 81            	ret
 300                     ; 36 unsigned char decimal_to_bcd(unsigned char value)
 300                     ; 37 {
 301                     .text:	section	.text,new
 302  0000               _decimal_to_bcd:
 304  0000 88            	push	a
 305  0001 88            	push	a
 306       00000001      OFST:	set	1
 309                     ; 38     return (((value / 10) << 4) | (value % 10));
 311  0002 5f            	clrw	x
 312  0003 97            	ld	xl,a
 313  0004 a60a          	ld	a,#10
 314  0006 62            	div	x,a
 315  0007 5f            	clrw	x
 316  0008 97            	ld	xl,a
 317  0009 9f            	ld	a,xl
 318  000a 6b01          	ld	(OFST+0,sp),a
 320  000c 7b02          	ld	a,(OFST+1,sp)
 321  000e 5f            	clrw	x
 322  000f 97            	ld	xl,a
 323  0010 a60a          	ld	a,#10
 324  0012 62            	div	x,a
 325  0013 9f            	ld	a,xl
 326  0014 97            	ld	xl,a
 327  0015 a610          	ld	a,#16
 328  0017 42            	mul	x,a
 329  0018 9f            	ld	a,xl
 330  0019 1a01          	or	a,(OFST+0,sp)
 333  001b 85            	popw	x
 334  001c 81            	ret
 373                     ; 41 void PCF8563_get_time(void)
 373                     ; 42 {
 374                     .text:	section	.text,new
 375  0000               _PCF8563_get_time:
 377  0000 5207          	subw	sp,#7
 378       00000007      OFST:	set	7
 381                     ; 44 		if (swi2c_read_buf(PCF8563_ADDR, PCF8563_SEC_REG, buf, 7) != 0) {
 383  0002 ae0007        	ldw	x,#7
 384  0005 89            	pushw	x
 385  0006 96            	ldw	x,sp
 386  0007 1c0003        	addw	x,#OFST-4
 387  000a 89            	pushw	x
 388  000b aea202        	ldw	x,#41474
 389  000e cd0000        	call	_swi2c_read_buf
 391  0011 5b04          	addw	sp,#4
 392  0013 4d            	tnz	a
 393  0014 2706          	jreq	L731
 394                     ; 45         err=true;
 396  0016 72100000      	bset	_err
 398  001a 2004          	jra	L141
 399  001c               L731:
 400                     ; 48 			  err=false;
 402  001c 72110000      	bres	_err
 403  0020               L141:
 404                     ; 50     time.s  = bcd_to_decimal(buf[0] & 0x7F);
 406  0020 7b01          	ld	a,(OFST-6,sp)
 407  0022 a47f          	and	a,#127
 408  0024 cd0000        	call	_bcd_to_decimal
 410  0027 b700          	ld	_time,a
 411                     ; 51     time.m  = bcd_to_decimal(buf[1] & 0x7F);
 413  0029 7b02          	ld	a,(OFST-5,sp)
 414  002b a47f          	and	a,#127
 415  002d cd0000        	call	_bcd_to_decimal
 417  0030 b701          	ld	_time+1,a
 418                     ; 52     time.h  = bcd_to_decimal(buf[2] & 0x3F);
 420  0032 7b03          	ld	a,(OFST-4,sp)
 421  0034 a43f          	and	a,#63
 422  0036 cd0000        	call	_bcd_to_decimal
 424  0039 b702          	ld	_time+2,a
 425                     ; 53     time.dt = bcd_to_decimal(buf[3] & 0x3F);
 427  003b 7b04          	ld	a,(OFST-3,sp)
 428  003d a43f          	and	a,#63
 429  003f cd0000        	call	_bcd_to_decimal
 431  0042 b704          	ld	_time+4,a
 432                     ; 54     time.dy = bcd_to_decimal(buf[4] & 0x07);
 434  0044 7b05          	ld	a,(OFST-2,sp)
 435  0046 a407          	and	a,#7
 436  0048 cd0000        	call	_bcd_to_decimal
 438  004b b703          	ld	_time+3,a
 439                     ; 55     time.mt = bcd_to_decimal(buf[5] & 0x1F);
 441  004d 7b06          	ld	a,(OFST-1,sp)
 442  004f a41f          	and	a,#31
 443  0051 cd0000        	call	_bcd_to_decimal
 445  0054 b705          	ld	_time+5,a
 446                     ; 56     time.yr = bcd_to_decimal(buf[6]);
 448  0056 7b07          	ld	a,(OFST+0,sp)
 449  0058 cd0000        	call	_bcd_to_decimal
 451  005b b706          	ld	_time+6,a
 452                     ; 57 }
 455  005d 5b07          	addw	sp,#7
 456  005f 81            	ret
 494                     ; 59 void PCF8563_set_time(void)
 494                     ; 60 {
 495                     .text:	section	.text,new
 496  0000               _PCF8563_set_time:
 498  0000 5207          	subw	sp,#7
 499       00000007      OFST:	set	7
 502                     ; 63     buf[0] = decimal_to_bcd(time.s) & 0x7F;
 504  0002 b600          	ld	a,_time
 505  0004 cd0000        	call	_decimal_to_bcd
 507  0007 a47f          	and	a,#127
 508  0009 6b01          	ld	(OFST-6,sp),a
 510                     ; 64     buf[1] = decimal_to_bcd(time.m) & 0x7F;
 512  000b b601          	ld	a,_time+1
 513  000d cd0000        	call	_decimal_to_bcd
 515  0010 a47f          	and	a,#127
 516  0012 6b02          	ld	(OFST-5,sp),a
 518                     ; 65     buf[2] = decimal_to_bcd(time.h) & 0x3F;
 520  0014 b602          	ld	a,_time+2
 521  0016 cd0000        	call	_decimal_to_bcd
 523  0019 a43f          	and	a,#63
 524  001b 6b03          	ld	(OFST-4,sp),a
 526                     ; 66     buf[3] = decimal_to_bcd(time.dt) & 0x3F;
 528  001d b604          	ld	a,_time+4
 529  001f cd0000        	call	_decimal_to_bcd
 531  0022 a43f          	and	a,#63
 532  0024 6b04          	ld	(OFST-3,sp),a
 534                     ; 67     buf[4] = decimal_to_bcd(time.dy) & 0x07;
 536  0026 b603          	ld	a,_time+3
 537  0028 cd0000        	call	_decimal_to_bcd
 539  002b a407          	and	a,#7
 540  002d 6b05          	ld	(OFST-2,sp),a
 542                     ; 68     buf[5] = decimal_to_bcd(time.mt) & 0x1F;
 544  002f b605          	ld	a,_time+5
 545  0031 cd0000        	call	_decimal_to_bcd
 547  0034 a41f          	and	a,#31
 548  0036 6b06          	ld	(OFST-1,sp),a
 550                     ; 69     buf[6] = decimal_to_bcd(time.yr);
 552  0038 b606          	ld	a,_time+6
 553  003a cd0000        	call	_decimal_to_bcd
 555  003d 6b07          	ld	(OFST+0,sp),a
 557                     ; 71     swi2c_write_buf(PCF8563_ADDR, PCF8563_SEC_REG, buf, 7);
 559  003f ae0007        	ldw	x,#7
 560  0042 89            	pushw	x
 561  0043 96            	ldw	x,sp
 562  0044 1c0003        	addw	x,#OFST-4
 563  0047 89            	pushw	x
 564  0048 aea202        	ldw	x,#41474
 565  004b cd0000        	call	_swi2c_write_buf
 567  004e 5b04          	addw	sp,#4
 568                     ; 72 }
 571  0050 5b07          	addw	sp,#7
 572  0052 81            	ret
 575                     	bsct
 576  0000               L161_last_s:
 577  0000 ff            	dc.b	255
 612                     ; 74 void display_time(void)
 612                     ; 75 {
 613                     .text:	section	.text,new
 614  0000               _display_time:
 618                     ; 77     PCF8563_get_time();
 620  0000 cd0000        	call	_PCF8563_get_time
 622                     ; 87 		pt6311_clock_format(3,time.h,1); //write int (good for 4 digits max)
 624  0003 4b01          	push	#1
 625  0005 b602          	ld	a,_time+2
 626  0007 ae0300        	ldw	x,#768
 627  000a 97            	ld	xl,a
 628  000b cd0000        	call	_pt6311_clock_format
 630  000e 84            	pop	a
 631                     ; 88 		pt6311_clock_format(5,time.m,1);
 633  000f 4b01          	push	#1
 634  0011 b601          	ld	a,_time+1
 635  0013 ae0500        	ldw	x,#1280
 636  0016 97            	ld	xl,a
 637  0017 cd0000        	call	_pt6311_clock_format
 639  001a 84            	pop	a
 640                     ; 89 		pt6311_clock_format(7,time.s,0);
 642  001b 4b00          	push	#0
 643  001d b600          	ld	a,_time
 644  001f ae0700        	ldw	x,#1792
 645  0022 97            	ld	xl,a
 646  0023 cd0000        	call	_pt6311_clock_format
 648  0026 84            	pop	a
 649                     ; 90 }
 652  0027 81            	ret
 676                     ; 113 void PCF8563_clk_sec(void)
 676                     ; 114 {
 677                     .text:	section	.text,new
 678  0000               _PCF8563_clk_sec:
 682                     ; 115     PCF8563_write(0x0D, 0x83);
 684  0000 ae0d83        	ldw	x,#3459
 685  0003 cd0000        	call	_PCF8563_write
 687                     ; 116 }
 690  0006 81            	ret
 715                     ; 118 void custom_time(void)
 715                     ; 119 {
 716                     .text:	section	.text,new
 717  0000               _custom_time:
 721                     ; 120     time.h  = 0;
 723  0000 3f02          	clr	_time+2
 724                     ; 121     time.m  = 0;
 726  0002 3f01          	clr	_time+1
 727                     ; 122     time.s  = 0;
 729  0004 3f00          	clr	_time
 730                     ; 123     time.dt = 0;
 732  0006 3f04          	clr	_time+4
 733                     ; 124     time.mt = 0;
 735  0008 3f05          	clr	_time+5
 736                     ; 125     time.yr = 0;
 738  000a 3f06          	clr	_time+6
 739                     ; 126     time.dy = 0;
 741  000c 3f03          	clr	_time+3
 742                     ; 127 		PCF8563_set_time();
 744  000e cd0000        	call	_PCF8563_set_time
 746                     ; 128 }
 749  0011 81            	ret
 840                     	switch	.ubsct
 841  0000               _time:
 842  0000 000000000000  	ds.b	7
 843                     	xdef	_time
 844                     .bit:	section	.data,bit
 845  0000               _err:
 846  0000 00            	ds.b	1
 847                     	xdef	_err
 848                     	xdef	_decimal_to_bcd
 849                     	xdef	_bcd_to_decimal
 850                     	xdef	_PCF8563_clk_sec
 851                     	xdef	_PCF8563_get_time
 852                     	xdef	_PCF8563_set_time
 853                     	xdef	_PCF8563_read
 854                     	xdef	_PCF8563_write
 855                     	xdef	_display_time
 856                     	xdef	_custom_time
 857                     	xdef	_PCF8563_init
 858                     	xref	_pt6311_clock_format
 859                     	xref	_swi2c_read_buf
 860                     	xref	_swi2c_write_buf
 880                     	end
