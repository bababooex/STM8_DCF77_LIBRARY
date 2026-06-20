   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.3 - 22 May 2025
   3                     ; Generator (Limited) V4.6.5 - 22 May 2025
  43                     ; 14 void PCF8563_init(void)//call after swi2c init
  43                     ; 15 {
  45                     	switch	.text
  46  0000               _PCF8563_init:
  50                     ; 16     PCF8563_write(PCF8563_CONTROL1, 0x00);
  52  0000 5f            	clrw	x
  53  0001 ad20          	call	_PCF8563_write
  55                     ; 17     PCF8563_write(PCF8563_CONTROL2, 0x00);
  57  0003 ae0100        	ldw	x,#256
  58  0006 ad1b          	call	_PCF8563_write
  60                     ; 18 }
  63  0008 81            	ret
 107                     ; 20 unsigned char PCF8563_read(unsigned char address)
 107                     ; 21 {
 108                     	switch	.text
 109  0009               _PCF8563_read:
 111  0009 88            	push	a
 112       00000001      OFST:	set	1
 115                     ; 22     uint8_t value = 0x00;
 117  000a 0f01          	clr	(OFST+0,sp)
 119                     ; 23     swi2c_read_buf(PCF8563_ADDR, address, &value, 1);
 121  000c ae0001        	ldw	x,#1
 122  000f 89            	pushw	x
 123  0010 96            	ldw	x,sp
 124  0011 1c0003        	addw	x,#OFST+2
 125  0014 89            	pushw	x
 126  0015 aea200        	ldw	x,#41472
 127  0018 97            	ld	xl,a
 128  0019 cd0000        	call	_swi2c_read_buf
 130  001c 5b04          	addw	sp,#4
 131                     ; 24 		return value;
 133  001e 7b01          	ld	a,(OFST+0,sp)
 136  0020 5b01          	addw	sp,#1
 137  0022 81            	ret
 181                     ; 27 void PCF8563_write(unsigned char address, unsigned char value)
 181                     ; 28 {
 182                     	switch	.text
 183  0023               _PCF8563_write:
 185  0023 89            	pushw	x
 186       00000000      OFST:	set	0
 189                     ; 29     swi2c_write_buf(PCF8563_ADDR, address, &value, 1);
 191  0024 ae0001        	ldw	x,#1
 192  0027 89            	pushw	x
 193  0028 96            	ldw	x,sp
 194  0029 1c0004        	addw	x,#OFST+4
 195  002c 89            	pushw	x
 196  002d 7b05          	ld	a,(OFST+5,sp)
 197  002f aea200        	ldw	x,#41472
 198  0032 97            	ld	xl,a
 199  0033 cd0000        	call	_swi2c_write_buf
 201  0036 5b04          	addw	sp,#4
 202                     ; 30 }
 205  0038 85            	popw	x
 206  0039 81            	ret
 240                     ; 32 unsigned char bcd_to_decimal(unsigned char value)
 240                     ; 33 {
 241                     	switch	.text
 242  003a               _bcd_to_decimal:
 244  003a 88            	push	a
 245  003b 88            	push	a
 246       00000001      OFST:	set	1
 249                     ; 34     return ((value & 0x0F) + (((value >> 4) & 0x0F) * 10));
 251  003c 4e            	swap	a
 252  003d a40f          	and	a,#15
 253  003f 97            	ld	xl,a
 254  0040 a60a          	ld	a,#10
 255  0042 42            	mul	x,a
 256  0043 9f            	ld	a,xl
 257  0044 6b01          	ld	(OFST+0,sp),a
 259  0046 7b02          	ld	a,(OFST+1,sp)
 260  0048 a40f          	and	a,#15
 261  004a 1b01          	add	a,(OFST+0,sp)
 264  004c 85            	popw	x
 265  004d 81            	ret
 299                     ; 37 unsigned char decimal_to_bcd(unsigned char value)
 299                     ; 38 {
 300                     	switch	.text
 301  004e               _decimal_to_bcd:
 303  004e 88            	push	a
 304  004f 88            	push	a
 305       00000001      OFST:	set	1
 308                     ; 39     return (((value / 10) << 4) | (value % 10));
 310  0050 5f            	clrw	x
 311  0051 97            	ld	xl,a
 312  0052 a60a          	ld	a,#10
 313  0054 62            	div	x,a
 314  0055 5f            	clrw	x
 315  0056 97            	ld	xl,a
 316  0057 9f            	ld	a,xl
 317  0058 6b01          	ld	(OFST+0,sp),a
 319  005a 7b02          	ld	a,(OFST+1,sp)
 320  005c 5f            	clrw	x
 321  005d 97            	ld	xl,a
 322  005e a60a          	ld	a,#10
 323  0060 62            	div	x,a
 324  0061 9f            	ld	a,xl
 325  0062 97            	ld	xl,a
 326  0063 a610          	ld	a,#16
 327  0065 42            	mul	x,a
 328  0066 9f            	ld	a,xl
 329  0067 1a01          	or	a,(OFST+0,sp)
 332  0069 85            	popw	x
 333  006a 81            	ret
 372                     ; 42 void PCF8563_get_time(void)
 372                     ; 43 {
 373                     	switch	.text
 374  006b               _PCF8563_get_time:
 376  006b 5207          	subw	sp,#7
 377       00000007      OFST:	set	7
 380                     ; 45 		if (swi2c_read_buf(PCF8563_ADDR, PCF8563_SEC_REG, buf, 7) != 0) {
 382  006d ae0007        	ldw	x,#7
 383  0070 89            	pushw	x
 384  0071 96            	ldw	x,sp
 385  0072 1c0003        	addw	x,#OFST-4
 386  0075 89            	pushw	x
 387  0076 aea202        	ldw	x,#41474
 388  0079 cd0000        	call	_swi2c_read_buf
 390  007c 5b04          	addw	sp,#4
 391  007e 4d            	tnz	a
 392  007f 2706          	jreq	L731
 393                     ; 46         err=true;
 395  0081 72100000      	bset	_err
 397  0085 2004          	jra	L141
 398  0087               L731:
 399                     ; 49 			  err=false;
 401  0087 72110000      	bres	_err
 402  008b               L141:
 403                     ; 51     time.s  = bcd_to_decimal(buf[0] & 0x7F);
 405  008b 7b01          	ld	a,(OFST-6,sp)
 406  008d a47f          	and	a,#127
 407  008f ada9          	call	_bcd_to_decimal
 409  0091 b700          	ld	_time,a
 410                     ; 52     time.m  = bcd_to_decimal(buf[1] & 0x7F);
 412  0093 7b02          	ld	a,(OFST-5,sp)
 413  0095 a47f          	and	a,#127
 414  0097 ada1          	call	_bcd_to_decimal
 416  0099 b701          	ld	_time+1,a
 417                     ; 53     time.h  = bcd_to_decimal(buf[2] & 0x3F);
 419  009b 7b03          	ld	a,(OFST-4,sp)
 420  009d a43f          	and	a,#63
 421  009f ad99          	call	_bcd_to_decimal
 423  00a1 b702          	ld	_time+2,a
 424                     ; 54     time.dt = bcd_to_decimal(buf[3] & 0x3F);
 426  00a3 7b04          	ld	a,(OFST-3,sp)
 427  00a5 a43f          	and	a,#63
 428  00a7 ad91          	call	_bcd_to_decimal
 430  00a9 b704          	ld	_time+4,a
 431                     ; 55     time.dy = bcd_to_decimal(buf[4] & 0x07);
 433  00ab 7b05          	ld	a,(OFST-2,sp)
 434  00ad a407          	and	a,#7
 435  00af ad89          	call	_bcd_to_decimal
 437  00b1 b703          	ld	_time+3,a
 438                     ; 56     time.mt = bcd_to_decimal(buf[5] & 0x1F);
 440  00b3 7b06          	ld	a,(OFST-1,sp)
 441  00b5 a41f          	and	a,#31
 442  00b7 ad81          	call	_bcd_to_decimal
 444  00b9 b705          	ld	_time+5,a
 445                     ; 57     time.yr = bcd_to_decimal(buf[6]);
 447  00bb 7b07          	ld	a,(OFST+0,sp)
 448  00bd cd003a        	call	_bcd_to_decimal
 450  00c0 b706          	ld	_time+6,a
 451                     ; 58 }
 454  00c2 5b07          	addw	sp,#7
 455  00c4 81            	ret
 493                     ; 60 void PCF8563_set_time(void)
 493                     ; 61 {
 494                     	switch	.text
 495  00c5               _PCF8563_set_time:
 497  00c5 5207          	subw	sp,#7
 498       00000007      OFST:	set	7
 501                     ; 64     buf[0] = decimal_to_bcd(time.s) & 0x7F;
 503  00c7 b600          	ld	a,_time
 504  00c9 ad83          	call	_decimal_to_bcd
 506  00cb a47f          	and	a,#127
 507  00cd 6b01          	ld	(OFST-6,sp),a
 509                     ; 65     buf[1] = decimal_to_bcd(time.m) & 0x7F;
 511  00cf b601          	ld	a,_time+1
 512  00d1 cd004e        	call	_decimal_to_bcd
 514  00d4 a47f          	and	a,#127
 515  00d6 6b02          	ld	(OFST-5,sp),a
 517                     ; 66     buf[2] = decimal_to_bcd(time.h) & 0x3F;
 519  00d8 b602          	ld	a,_time+2
 520  00da cd004e        	call	_decimal_to_bcd
 522  00dd a43f          	and	a,#63
 523  00df 6b03          	ld	(OFST-4,sp),a
 525                     ; 67     buf[3] = decimal_to_bcd(time.dt) & 0x3F;
 527  00e1 b604          	ld	a,_time+4
 528  00e3 cd004e        	call	_decimal_to_bcd
 530  00e6 a43f          	and	a,#63
 531  00e8 6b04          	ld	(OFST-3,sp),a
 533                     ; 68     buf[4] = decimal_to_bcd(time.dy) & 0x07;
 535  00ea b603          	ld	a,_time+3
 536  00ec cd004e        	call	_decimal_to_bcd
 538  00ef a407          	and	a,#7
 539  00f1 6b05          	ld	(OFST-2,sp),a
 541                     ; 69     buf[5] = decimal_to_bcd(time.mt) & 0x1F;
 543  00f3 b605          	ld	a,_time+5
 544  00f5 cd004e        	call	_decimal_to_bcd
 546  00f8 a41f          	and	a,#31
 547  00fa 6b06          	ld	(OFST-1,sp),a
 549                     ; 70     buf[6] = decimal_to_bcd(time.yr);
 551  00fc b606          	ld	a,_time+6
 552  00fe cd004e        	call	_decimal_to_bcd
 554  0101 6b07          	ld	(OFST+0,sp),a
 556                     ; 72     swi2c_write_buf(PCF8563_ADDR, PCF8563_SEC_REG, buf, 7);
 558  0103 ae0007        	ldw	x,#7
 559  0106 89            	pushw	x
 560  0107 96            	ldw	x,sp
 561  0108 1c0003        	addw	x,#OFST-4
 562  010b 89            	pushw	x
 563  010c aea202        	ldw	x,#41474
 564  010f cd0000        	call	_swi2c_write_buf
 566  0112 5b04          	addw	sp,#4
 567                     ; 73 }
 570  0114 5b07          	addw	sp,#7
 571  0116 81            	ret
 574                     	bsct
 575  0000               L161_last_s:
 576  0000 ff            	dc.b	255
 611                     ; 86 void display_time(void)
 611                     ; 87 {
 612                     	switch	.text
 613  0117               _display_time:
 617                     ; 89     PCF8563_get_time();
 619  0117 cd006b        	call	_PCF8563_get_time
 621                     ; 99     if (time.s != last_s) { 
 623  011a b600          	ld	a,_time
 624  011c b100          	cp	a,L161_last_s
 625  011e 2721          	jreq	L102
 626                     ; 101 		    cs16311_write_int(time.h, 0); //write int (good for 4 digits max)
 628  0120 4b00          	push	#0
 629  0122 b602          	ld	a,_time+2
 630  0124 5f            	clrw	x
 631  0125 97            	ld	xl,a
 632  0126 cd0000        	call	_cs16311_write_int
 634  0129 84            	pop	a
 635                     ; 102         cs16311_write_int(time.m, 2);
 637  012a 4b02          	push	#2
 638  012c b601          	ld	a,_time+1
 639  012e 5f            	clrw	x
 640  012f 97            	ld	xl,a
 641  0130 cd0000        	call	_cs16311_write_int
 643  0133 84            	pop	a
 644                     ; 103 				cs16311_write_int(time.s, 4);
 646  0134 4b04          	push	#4
 647  0136 b600          	ld	a,_time
 648  0138 5f            	clrw	x
 649  0139 97            	ld	xl,a
 650  013a cd0000        	call	_cs16311_write_int
 652  013d 84            	pop	a
 653                     ; 104         last_s = time.s;
 655  013e 450000        	mov	L161_last_s,_time
 656  0141               L102:
 657                     ; 107 }
 660  0141 81            	ret
 663                     	bsct
 664  0001               L302_last_dt:
 665  0001 ff            	dc.b	255
 666  0002               L502_last_mt:
 667  0002 ff            	dc.b	255
 668  0003               L702_last_yr:
 669  0003 ff            	dc.b	255
 731                     ; 109 void display_date(void)
 731                     ; 110 {
 732                     	switch	.text
 733  0142               _display_date:
 735  0142 89            	pushw	x
 736       00000002      OFST:	set	2
 739                     ; 111 	  uint16_t n = time.yr;
 741  0143 b606          	ld	a,_time+6
 742  0145 5f            	clrw	x
 743  0146 97            	ld	xl,a
 744  0147 1f01          	ldw	(OFST-1,sp),x
 746                     ; 115     PCF8563_get_time();
 748  0149 cd006b        	call	_PCF8563_get_time
 750                     ; 116     if (time.dt != last_dt || time.mt != last_mt || time.yr != last_yr) //same logic, if not changed, skip
 752  014c b604          	ld	a,_time+4
 753  014e b101          	cp	a,L302_last_dt
 754  0150 260c          	jrne	L542
 756  0152 b605          	ld	a,_time+5
 757  0154 b102          	cp	a,L502_last_mt
 758  0156 2606          	jrne	L542
 760  0158 b606          	ld	a,_time+6
 761  015a b103          	cp	a,L702_last_yr
 762  015c 2711          	jreq	L342
 763  015e               L542:
 764                     ; 121 				cs16311_write_int(n, 6);
 766  015e 4b06          	push	#6
 767  0160 1e02          	ldw	x,(OFST+0,sp)
 768  0162 cd0000        	call	_cs16311_write_int
 770  0165 84            	pop	a
 771                     ; 123         last_dt = time.dt;
 773  0166 450401        	mov	L302_last_dt,_time+4
 774                     ; 124         last_mt = time.mt;
 776  0169 450502        	mov	L502_last_mt,_time+5
 777                     ; 125         last_yr = time.yr;
 779  016c 450603        	mov	L702_last_yr,_time+6
 780  016f               L342:
 781                     ; 127 }
 784  016f 85            	popw	x
 785  0170 81            	ret
 810                     ; 129 void custom_time(void)
 810                     ; 130 {
 811                     	switch	.text
 812  0171               _custom_time:
 816                     ; 131     time.h  = 12;
 818  0171 350c0002      	mov	_time+2,#12
 819                     ; 132     time.m  = 36;
 821  0175 35240001      	mov	_time+1,#36
 822                     ; 133     time.s  = 20;
 824  0179 35140000      	mov	_time,#20
 825                     ; 134     time.dt = 10;
 827  017d 350a0004      	mov	_time+4,#10
 828                     ; 135     time.mt = 4;
 830  0181 35040005      	mov	_time+5,#4
 831                     ; 136     time.yr = 26;
 833  0185 351a0006      	mov	_time+6,#26
 834                     ; 137     time.dy = 5;
 836  0189 35050003      	mov	_time+3,#5
 837                     ; 138 		PCF8563_set_time();
 839  018d cd00c5        	call	_PCF8563_set_time
 841                     ; 139 }
 844  0190 81            	ret
 935                     	switch	.ubsct
 936  0000               _time:
 937  0000 000000000000  	ds.b	7
 938                     	xdef	_time
 939                     .bit:	section	.data,bit
 940  0000               _err:
 941  0000 00            	ds.b	1
 942                     	xdef	_err
 943                     	xdef	_decimal_to_bcd
 944                     	xdef	_bcd_to_decimal
 945                     	xdef	_PCF8563_get_time
 946                     	xdef	_PCF8563_set_time
 947                     	xdef	_PCF8563_read
 948                     	xdef	_PCF8563_write
 949                     	xdef	_display_date
 950                     	xdef	_display_time
 951                     	xdef	_custom_time
 952                     	xdef	_PCF8563_init
 953                     	xref	_cs16311_write_int
 954                     	xref	_swi2c_read_buf
 955                     	xref	_swi2c_write_buf
 975                     	end
