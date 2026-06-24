   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.3 - 22 May 2025
   3                     ; Generator (Limited) V4.6.6 - 07 Jan 2026
  15                     	bsct
  16  0000               _pulseWidth:
  17  0000 0000          	dc.w	0
  18  0002               _pulseReady:
  19  0002 00            	dc.b	0
  20  0003               L5_signalIndex:
  21  0003 00            	dc.b	0
  22  0004               L7_state:
  23  0004 00            	dc.b	0
  24  0005               _silenceTicks:
  25  0005 00            	dc.b	0
  26  0006               L11_timeReceived:
  27  0006 00            	dc.b	0
  62                     ; 13 void TIM1_setup(void)//dual edge detection
  62                     ; 14 {
  64                     .text:	section	.text,new
  65  0000               _TIM1_setup:
  69                     ; 15     TIM1_DeInit();
  71  0000 cd0000        	call	_TIM1_DeInit
  73                     ; 16     TIM1_TimeBaseInit(160, TIM1_COUNTERMODE_UP, 65535, 0);//10uS
  75  0003 4b00          	push	#0
  76  0005 aeffff        	ldw	x,#65535
  77  0008 89            	pushw	x
  78  0009 4b00          	push	#0
  79  000b ae00a0        	ldw	x,#160
  80  000e cd0000        	call	_TIM1_TimeBaseInit
  82  0011 5b04          	addw	sp,#4
  83                     ; 18     TIM1_ICInit(TIM1_CHANNEL_1,
  83                     ; 19                 TIM1_ICPOLARITY_RISING,
  83                     ; 20                 TIM1_ICSELECTION_DIRECTTI,
  83                     ; 21                 TIM1_ICPSC_DIV1, 0);
  85  0013 4b00          	push	#0
  86  0015 4b00          	push	#0
  87  0017 4b01          	push	#1
  88  0019 5f            	clrw	x
  89  001a cd0000        	call	_TIM1_ICInit
  91  001d 5b03          	addw	sp,#3
  92                     ; 24     TIM1_ICInit(TIM1_CHANNEL_2,
  92                     ; 25                 TIM1_ICPOLARITY_FALLING,
  92                     ; 26                 TIM1_ICSELECTION_INDIRECTTI,
  92                     ; 27                 TIM1_ICPSC_DIV1, 0);
  94  001f 4b00          	push	#0
  95  0021 4b00          	push	#0
  96  0023 4b02          	push	#2
  97  0025 ae0101        	ldw	x,#257
  98  0028 cd0000        	call	_TIM1_ICInit
 100  002b 5b03          	addw	sp,#3
 101                     ; 28 		TIM1_ClearFlag(TIM1_FLAG_CC1);
 103  002d ae0002        	ldw	x,#2
 104  0030 cd0000        	call	_TIM1_ClearFlag
 106                     ; 29 		TIM1_ClearFlag(TIM1_FLAG_CC2);
 108  0033 ae0004        	ldw	x,#4
 109  0036 cd0000        	call	_TIM1_ClearFlag
 111                     ; 30 		TIM1_ITConfig(TIM1_IT_CC1 | TIM1_IT_CC2, ENABLE);
 113  0039 ae0601        	ldw	x,#1537
 114  003c cd0000        	call	_TIM1_ITConfig
 116                     ; 31     TIM1_Cmd(ENABLE);
 118  003f a601          	ld	a,#1
 119  0041 cd0000        	call	_TIM1_Cmd
 121                     ; 32 }
 124  0044 81            	ret
 151                     ; 34 void TIM4_setup(void)
 151                     ; 35 {
 152                     .text:	section	.text,new
 153  0000               _TIM4_setup:
 157                     ; 36 	  TIM4_DeInit();
 159  0000 cd0000        	call	_TIM4_DeInit
 161                     ; 37     TIM4_TimeBaseInit(TIM4_PRESCALER_128, 125-1);//1ms clock
 163  0003 ae077c        	ldw	x,#1916
 164  0006 cd0000        	call	_TIM4_TimeBaseInit
 166                     ; 38     TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
 168  0009 ae0101        	ldw	x,#257
 169  000c cd0000        	call	_TIM4_ITConfig
 171                     ; 39     TIM4_Cmd(ENABLE);
 173  000f a601          	ld	a,#1
 174  0011 cd0000        	call	_TIM4_Cmd
 176                     ; 40 }
 179  0014 81            	ret
 223                     ; 41 static uint8_t getMinutes(void)
 223                     ; 42 {
 224                     .text:	section	.text,new
 225  0000               L34_getMinutes:
 227  0000 5205          	subw	sp,#5
 228       00000005      OFST:	set	5
 231                     ; 43     uint8_t u =
 231                     ; 44         (signals[21] ? 1 : 0) |
 231                     ; 45         (signals[22] ? 2 : 0) |
 231                     ; 46         (signals[23] ? 4 : 0) |
 231                     ; 47         (signals[24] ? 8 : 0);
 233  0002 3d1e          	tnz	L3_signals+24
 234  0004 2704          	jreq	L21
 235  0006 a608          	ld	a,#8
 236  0008 2001          	jra	L41
 237  000a               L21:
 238  000a 4f            	clr	a
 239  000b               L41:
 240  000b 6b03          	ld	(OFST-2,sp),a
 242  000d 3d1d          	tnz	L3_signals+23
 243  000f 2704          	jreq	L61
 244  0011 a604          	ld	a,#4
 245  0013 2001          	jra	L02
 246  0015               L61:
 247  0015 4f            	clr	a
 248  0016               L02:
 249  0016 6b02          	ld	(OFST-3,sp),a
 251  0018 3d1c          	tnz	L3_signals+22
 252  001a 2704          	jreq	L22
 253  001c a602          	ld	a,#2
 254  001e 2001          	jra	L42
 255  0020               L22:
 256  0020 4f            	clr	a
 257  0021               L42:
 258  0021 6b01          	ld	(OFST-4,sp),a
 260  0023 3d1b          	tnz	L3_signals+21
 261  0025 2704          	jreq	L62
 262  0027 a601          	ld	a,#1
 263  0029 2001          	jra	L03
 264  002b               L62:
 265  002b 4f            	clr	a
 266  002c               L03:
 267  002c 1a01          	or	a,(OFST-4,sp)
 268  002e 1a02          	or	a,(OFST-3,sp)
 269  0030 1a03          	or	a,(OFST-2,sp)
 270  0032 6b04          	ld	(OFST-1,sp),a
 272                     ; 49     uint8_t t =
 272                     ; 50         (signals[25] ? 1 : 0) |
 272                     ; 51         (signals[26] ? 2 : 0) |
 272                     ; 52         (signals[27] ? 4 : 0);
 274  0034 3d21          	tnz	L3_signals+27
 275  0036 2704          	jreq	L23
 276  0038 a604          	ld	a,#4
 277  003a 2001          	jra	L43
 278  003c               L23:
 279  003c 4f            	clr	a
 280  003d               L43:
 281  003d 6b03          	ld	(OFST-2,sp),a
 283  003f 3d20          	tnz	L3_signals+26
 284  0041 2704          	jreq	L63
 285  0043 a602          	ld	a,#2
 286  0045 2001          	jra	L04
 287  0047               L63:
 288  0047 4f            	clr	a
 289  0048               L04:
 290  0048 6b02          	ld	(OFST-3,sp),a
 292  004a 3d1f          	tnz	L3_signals+25
 293  004c 2704          	jreq	L24
 294  004e a601          	ld	a,#1
 295  0050 2001          	jra	L44
 296  0052               L24:
 297  0052 4f            	clr	a
 298  0053               L44:
 299  0053 1a02          	or	a,(OFST-3,sp)
 300  0055 1a03          	or	a,(OFST-2,sp)
 301  0057 6b05          	ld	(OFST+0,sp),a
 303                     ; 54     return t * 10 + u;
 305  0059 7b05          	ld	a,(OFST+0,sp)
 306  005b 97            	ld	xl,a
 307  005c a60a          	ld	a,#10
 308  005e 42            	mul	x,a
 309  005f 9f            	ld	a,xl
 310  0060 1b04          	add	a,(OFST-1,sp)
 313  0062 5b05          	addw	sp,#5
 314  0064 81            	ret
 358                     ; 57 static uint8_t getHours(void)
 358                     ; 58 {
 359                     .text:	section	.text,new
 360  0000               L76_getHours:
 362  0000 5205          	subw	sp,#5
 363       00000005      OFST:	set	5
 366                     ; 59     uint8_t u =
 366                     ; 60         (signals[29] ? 1 : 0) |
 366                     ; 61         (signals[30] ? 2 : 0) |
 366                     ; 62         (signals[31] ? 4 : 0) |
 366                     ; 63         (signals[32] ? 8 : 0);
 368  0002 3d26          	tnz	L3_signals+32
 369  0004 2704          	jreq	L05
 370  0006 a608          	ld	a,#8
 371  0008 2001          	jra	L25
 372  000a               L05:
 373  000a 4f            	clr	a
 374  000b               L25:
 375  000b 6b03          	ld	(OFST-2,sp),a
 377  000d 3d25          	tnz	L3_signals+31
 378  000f 2704          	jreq	L45
 379  0011 a604          	ld	a,#4
 380  0013 2001          	jra	L65
 381  0015               L45:
 382  0015 4f            	clr	a
 383  0016               L65:
 384  0016 6b02          	ld	(OFST-3,sp),a
 386  0018 3d24          	tnz	L3_signals+30
 387  001a 2704          	jreq	L06
 388  001c a602          	ld	a,#2
 389  001e 2001          	jra	L26
 390  0020               L06:
 391  0020 4f            	clr	a
 392  0021               L26:
 393  0021 6b01          	ld	(OFST-4,sp),a
 395  0023 3d23          	tnz	L3_signals+29
 396  0025 2704          	jreq	L46
 397  0027 a601          	ld	a,#1
 398  0029 2001          	jra	L66
 399  002b               L46:
 400  002b 4f            	clr	a
 401  002c               L66:
 402  002c 1a01          	or	a,(OFST-4,sp)
 403  002e 1a02          	or	a,(OFST-3,sp)
 404  0030 1a03          	or	a,(OFST-2,sp)
 405  0032 6b04          	ld	(OFST-1,sp),a
 407                     ; 65     uint8_t t =
 407                     ; 66         (signals[33] ? 1 : 0) |
 407                     ; 67         (signals[34] ? 2 : 0);
 409  0034 3d28          	tnz	L3_signals+34
 410  0036 2704          	jreq	L07
 411  0038 a602          	ld	a,#2
 412  003a 2001          	jra	L27
 413  003c               L07:
 414  003c 4f            	clr	a
 415  003d               L27:
 416  003d 6b03          	ld	(OFST-2,sp),a
 418  003f 3d27          	tnz	L3_signals+33
 419  0041 2704          	jreq	L47
 420  0043 a601          	ld	a,#1
 421  0045 2001          	jra	L67
 422  0047               L47:
 423  0047 4f            	clr	a
 424  0048               L67:
 425  0048 1a03          	or	a,(OFST-2,sp)
 426  004a 6b05          	ld	(OFST+0,sp),a
 428                     ; 69     return t * 10 + u;
 430  004c 7b05          	ld	a,(OFST+0,sp)
 431  004e 97            	ld	xl,a
 432  004f a60a          	ld	a,#10
 433  0051 42            	mul	x,a
 434  0052 9f            	ld	a,xl
 435  0053 1b04          	add	a,(OFST-1,sp)
 438  0055 5b05          	addw	sp,#5
 439  0057 81            	ret
 483                     ; 72 static uint8_t getDayOfMonth(void)
 483                     ; 73 {
 484                     .text:	section	.text,new
 485  0000               L311_getDayOfMonth:
 487  0000 5205          	subw	sp,#5
 488       00000005      OFST:	set	5
 491                     ; 74     uint8_t u =
 491                     ; 75         (signals[36] ? 1 : 0) |
 491                     ; 76         (signals[37] ? 2 : 0) |
 491                     ; 77         (signals[38] ? 4 : 0) |
 491                     ; 78         (signals[39] ? 8 : 0);
 493  0002 3d2d          	tnz	L3_signals+39
 494  0004 2704          	jreq	L201
 495  0006 a608          	ld	a,#8
 496  0008 2001          	jra	L401
 497  000a               L201:
 498  000a 4f            	clr	a
 499  000b               L401:
 500  000b 6b03          	ld	(OFST-2,sp),a
 502  000d 3d2c          	tnz	L3_signals+38
 503  000f 2704          	jreq	L601
 504  0011 a604          	ld	a,#4
 505  0013 2001          	jra	L011
 506  0015               L601:
 507  0015 4f            	clr	a
 508  0016               L011:
 509  0016 6b02          	ld	(OFST-3,sp),a
 511  0018 3d2b          	tnz	L3_signals+37
 512  001a 2704          	jreq	L211
 513  001c a602          	ld	a,#2
 514  001e 2001          	jra	L411
 515  0020               L211:
 516  0020 4f            	clr	a
 517  0021               L411:
 518  0021 6b01          	ld	(OFST-4,sp),a
 520  0023 3d2a          	tnz	L3_signals+36
 521  0025 2704          	jreq	L611
 522  0027 a601          	ld	a,#1
 523  0029 2001          	jra	L021
 524  002b               L611:
 525  002b 4f            	clr	a
 526  002c               L021:
 527  002c 1a01          	or	a,(OFST-4,sp)
 528  002e 1a02          	or	a,(OFST-3,sp)
 529  0030 1a03          	or	a,(OFST-2,sp)
 530  0032 6b04          	ld	(OFST-1,sp),a
 532                     ; 80     uint8_t t =
 532                     ; 81         (signals[40] ? 1 : 0) |
 532                     ; 82         (signals[41] ? 2 : 0);
 534  0034 3d2f          	tnz	L3_signals+41
 535  0036 2704          	jreq	L221
 536  0038 a602          	ld	a,#2
 537  003a 2001          	jra	L421
 538  003c               L221:
 539  003c 4f            	clr	a
 540  003d               L421:
 541  003d 6b03          	ld	(OFST-2,sp),a
 543  003f 3d2e          	tnz	L3_signals+40
 544  0041 2704          	jreq	L621
 545  0043 a601          	ld	a,#1
 546  0045 2001          	jra	L031
 547  0047               L621:
 548  0047 4f            	clr	a
 549  0048               L031:
 550  0048 1a03          	or	a,(OFST-2,sp)
 551  004a 6b05          	ld	(OFST+0,sp),a
 553                     ; 84     return t * 10 + u;
 555  004c 7b05          	ld	a,(OFST+0,sp)
 556  004e 97            	ld	xl,a
 557  004f a60a          	ld	a,#10
 558  0051 42            	mul	x,a
 559  0052 9f            	ld	a,xl
 560  0053 1b04          	add	a,(OFST-1,sp)
 563  0055 5b05          	addw	sp,#5
 564  0057 81            	ret
 588                     ; 87 static uint8_t getDayOfWeek(void)//bcd conversion not needed
 588                     ; 88 {
 589                     .text:	section	.text,new
 590  0000               L731_getDayOfWeek:
 592  0000 89            	pushw	x
 593       00000002      OFST:	set	2
 596                     ; 89     return (signals[42] ? 1 : 0) |
 596                     ; 90            (signals[43] ? 2 : 0) |
 596                     ; 91            (signals[44] ? 4 : 0);
 598  0001 3d32          	tnz	L3_signals+44
 599  0003 2704          	jreq	L431
 600  0005 a604          	ld	a,#4
 601  0007 2001          	jra	L631
 602  0009               L431:
 603  0009 4f            	clr	a
 604  000a               L631:
 605  000a 6b02          	ld	(OFST+0,sp),a
 607  000c 3d31          	tnz	L3_signals+43
 608  000e 2704          	jreq	L041
 609  0010 a602          	ld	a,#2
 610  0012 2001          	jra	L241
 611  0014               L041:
 612  0014 4f            	clr	a
 613  0015               L241:
 614  0015 6b01          	ld	(OFST-1,sp),a
 616  0017 3d30          	tnz	L3_signals+42
 617  0019 2704          	jreq	L441
 618  001b a601          	ld	a,#1
 619  001d 2001          	jra	L641
 620  001f               L441:
 621  001f 4f            	clr	a
 622  0020               L641:
 623  0020 1a01          	or	a,(OFST-1,sp)
 624  0022 1a02          	or	a,(OFST+0,sp)
 627  0024 85            	popw	x
 628  0025 81            	ret
 672                     ; 94 static uint8_t getMonths(void)
 672                     ; 95 {
 673                     .text:	section	.text,new
 674  0000               L151_getMonths:
 676  0000 5205          	subw	sp,#5
 677       00000005      OFST:	set	5
 680                     ; 96     uint8_t u =
 680                     ; 97         (signals[45] ? 1 : 0) |
 680                     ; 98         (signals[46] ? 2 : 0) |
 680                     ; 99         (signals[47] ? 4 : 0) |
 680                     ; 100         (signals[48] ? 8 : 0);
 682  0002 3d36          	tnz	L3_signals+48
 683  0004 2704          	jreq	L251
 684  0006 a608          	ld	a,#8
 685  0008 2001          	jra	L451
 686  000a               L251:
 687  000a 4f            	clr	a
 688  000b               L451:
 689  000b 6b03          	ld	(OFST-2,sp),a
 691  000d 3d35          	tnz	L3_signals+47
 692  000f 2704          	jreq	L651
 693  0011 a604          	ld	a,#4
 694  0013 2001          	jra	L061
 695  0015               L651:
 696  0015 4f            	clr	a
 697  0016               L061:
 698  0016 6b02          	ld	(OFST-3,sp),a
 700  0018 3d34          	tnz	L3_signals+46
 701  001a 2704          	jreq	L261
 702  001c a602          	ld	a,#2
 703  001e 2001          	jra	L461
 704  0020               L261:
 705  0020 4f            	clr	a
 706  0021               L461:
 707  0021 6b01          	ld	(OFST-4,sp),a
 709  0023 3d33          	tnz	L3_signals+45
 710  0025 2704          	jreq	L661
 711  0027 a601          	ld	a,#1
 712  0029 2001          	jra	L071
 713  002b               L661:
 714  002b 4f            	clr	a
 715  002c               L071:
 716  002c 1a01          	or	a,(OFST-4,sp)
 717  002e 1a02          	or	a,(OFST-3,sp)
 718  0030 1a03          	or	a,(OFST-2,sp)
 719  0032 6b04          	ld	(OFST-1,sp),a
 721                     ; 102     uint8_t t =
 721                     ; 103         (signals[49] ? 1 : 0);
 723  0034 3d37          	tnz	L3_signals+49
 724  0036 2704          	jreq	L271
 725  0038 a601          	ld	a,#1
 726  003a 2001          	jra	L471
 727  003c               L271:
 728  003c 4f            	clr	a
 729  003d               L471:
 730  003d 6b05          	ld	(OFST+0,sp),a
 732                     ; 105     return t * 10 + u;
 734  003f 7b05          	ld	a,(OFST+0,sp)
 735  0041 97            	ld	xl,a
 736  0042 a60a          	ld	a,#10
 737  0044 42            	mul	x,a
 738  0045 9f            	ld	a,xl
 739  0046 1b04          	add	a,(OFST-1,sp)
 742  0048 5b05          	addw	sp,#5
 743  004a 81            	ret
 787                     ; 108 static uint8_t getYears(void)
 787                     ; 109 {
 788                     .text:	section	.text,new
 789  0000               L571_getYears:
 791  0000 5205          	subw	sp,#5
 792       00000005      OFST:	set	5
 795                     ; 110     uint8_t u =
 795                     ; 111         (signals[50] ? 1 : 0) |
 795                     ; 112         (signals[51] ? 2 : 0) |
 795                     ; 113         (signals[52] ? 4 : 0) |
 795                     ; 114         (signals[53] ? 8 : 0);
 797  0002 3d3b          	tnz	L3_signals+53
 798  0004 2704          	jreq	L002
 799  0006 a608          	ld	a,#8
 800  0008 2001          	jra	L202
 801  000a               L002:
 802  000a 4f            	clr	a
 803  000b               L202:
 804  000b 6b03          	ld	(OFST-2,sp),a
 806  000d 3d3a          	tnz	L3_signals+52
 807  000f 2704          	jreq	L402
 808  0011 a604          	ld	a,#4
 809  0013 2001          	jra	L602
 810  0015               L402:
 811  0015 4f            	clr	a
 812  0016               L602:
 813  0016 6b02          	ld	(OFST-3,sp),a
 815  0018 3d39          	tnz	L3_signals+51
 816  001a 2704          	jreq	L012
 817  001c a602          	ld	a,#2
 818  001e 2001          	jra	L212
 819  0020               L012:
 820  0020 4f            	clr	a
 821  0021               L212:
 822  0021 6b01          	ld	(OFST-4,sp),a
 824  0023 3d38          	tnz	L3_signals+50
 825  0025 2704          	jreq	L412
 826  0027 a601          	ld	a,#1
 827  0029 2001          	jra	L612
 828  002b               L412:
 829  002b 4f            	clr	a
 830  002c               L612:
 831  002c 1a01          	or	a,(OFST-4,sp)
 832  002e 1a02          	or	a,(OFST-3,sp)
 833  0030 1a03          	or	a,(OFST-2,sp)
 834  0032 6b04          	ld	(OFST-1,sp),a
 836                     ; 116     uint8_t t =
 836                     ; 117         (signals[54] ? 1 : 0) |
 836                     ; 118         (signals[55] ? 2 : 0) |
 836                     ; 119         (signals[56] ? 4 : 0) |
 836                     ; 120         (signals[57] ? 8 : 0);
 838  0034 3d3f          	tnz	L3_signals+57
 839  0036 2704          	jreq	L022
 840  0038 a608          	ld	a,#8
 841  003a 2001          	jra	L222
 842  003c               L022:
 843  003c 4f            	clr	a
 844  003d               L222:
 845  003d 6b03          	ld	(OFST-2,sp),a
 847  003f 3d3e          	tnz	L3_signals+56
 848  0041 2704          	jreq	L422
 849  0043 a604          	ld	a,#4
 850  0045 2001          	jra	L622
 851  0047               L422:
 852  0047 4f            	clr	a
 853  0048               L622:
 854  0048 6b02          	ld	(OFST-3,sp),a
 856  004a 3d3d          	tnz	L3_signals+55
 857  004c 2704          	jreq	L032
 858  004e a602          	ld	a,#2
 859  0050 2001          	jra	L232
 860  0052               L032:
 861  0052 4f            	clr	a
 862  0053               L232:
 863  0053 6b01          	ld	(OFST-4,sp),a
 865  0055 3d3c          	tnz	L3_signals+54
 866  0057 2704          	jreq	L432
 867  0059 a601          	ld	a,#1
 868  005b 2001          	jra	L632
 869  005d               L432:
 870  005d 4f            	clr	a
 871  005e               L632:
 872  005e 1a01          	or	a,(OFST-4,sp)
 873  0060 1a02          	or	a,(OFST-3,sp)
 874  0062 1a03          	or	a,(OFST-2,sp)
 875  0064 6b05          	ld	(OFST+0,sp),a
 877                     ; 122     return t * 10 + u;
 879  0066 7b05          	ld	a,(OFST+0,sp)
 880  0068 97            	ld	xl,a
 881  0069 a60a          	ld	a,#10
 882  006b 42            	mul	x,a
 883  006c 9f            	ld	a,xl
 884  006d 1b04          	add	a,(OFST-1,sp)
 887  006f 5b05          	addw	sp,#5
 888  0071 81            	ret
 968                     ; 125 static uint8_t DCF77_CheckParity(void)
 968                     ; 126 {
 969                     .text:	section	.text,new
 970  0000               L122_DCF77_CheckParity:
 972  0000 5204          	subw	sp,#4
 973       00000004      OFST:	set	4
 976                     ; 127     uint8_t pMin = 0, pHour = 0, pDate = 0;
 978  0002 0f01          	clr	(OFST-3,sp)
 982  0004 0f02          	clr	(OFST-2,sp)
 986  0006 0f03          	clr	(OFST-1,sp)
 988                     ; 129     for (a = 21; a <= 27; a++) pMin ^= signals[a];
 990  0008 a615          	ld	a,#21
 991  000a 6b04          	ld	(OFST+0,sp),a
 993  000c               L562:
 996  000c 7b04          	ld	a,(OFST+0,sp)
 997  000e 5f            	clrw	x
 998  000f 97            	ld	xl,a
 999  0010 7b01          	ld	a,(OFST-3,sp)
1000  0012 e806          	xor	a,(L3_signals,x)
1001  0014 6b01          	ld	(OFST-3,sp),a
1005  0016 0c04          	inc	(OFST+0,sp)
1009  0018 7b04          	ld	a,(OFST+0,sp)
1010  001a a11c          	cp	a,#28
1011  001c 25ee          	jrult	L562
1012                     ; 130     for (b = 29; b <= 34; b++) pHour ^= signals[b];
1014  001e a61d          	ld	a,#29
1015  0020 6b04          	ld	(OFST+0,sp),a
1017  0022               L372:
1020  0022 7b04          	ld	a,(OFST+0,sp)
1021  0024 5f            	clrw	x
1022  0025 97            	ld	xl,a
1023  0026 7b02          	ld	a,(OFST-2,sp)
1024  0028 e806          	xor	a,(L3_signals,x)
1025  002a 6b02          	ld	(OFST-2,sp),a
1029  002c 0c04          	inc	(OFST+0,sp)
1033  002e 7b04          	ld	a,(OFST+0,sp)
1034  0030 a123          	cp	a,#35
1035  0032 25ee          	jrult	L372
1036                     ; 131     for (c = 36; c <= 57; c++) pDate ^= signals[c];
1038  0034 a624          	ld	a,#36
1039  0036 6b04          	ld	(OFST+0,sp),a
1041  0038               L103:
1044  0038 7b04          	ld	a,(OFST+0,sp)
1045  003a 5f            	clrw	x
1046  003b 97            	ld	xl,a
1047  003c 7b03          	ld	a,(OFST-1,sp)
1048  003e e806          	xor	a,(L3_signals,x)
1049  0040 6b03          	ld	(OFST-1,sp),a
1053  0042 0c04          	inc	(OFST+0,sp)
1057  0044 7b04          	ld	a,(OFST+0,sp)
1058  0046 a13a          	cp	a,#58
1059  0048 25ee          	jrult	L103
1060                     ; 133     if (pMin  != signals[28]) return 0;
1062  004a b622          	ld	a,L3_signals+28
1063  004c 1101          	cp	a,(OFST-3,sp)
1064  004e 2703          	jreq	L703
1067  0050 4f            	clr	a
1069  0051 2007          	jra	L242
1070  0053               L703:
1071                     ; 134     if (pHour != signals[35]) return 0;
1073  0053 b629          	ld	a,L3_signals+35
1074  0055 1102          	cp	a,(OFST-2,sp)
1075  0057 2704          	jreq	L113
1078  0059 4f            	clr	a
1080  005a               L242:
1082  005a 5b04          	addw	sp,#4
1083  005c 81            	ret
1084  005d               L113:
1085                     ; 135     if (pDate != signals[58]) return 0;
1087  005d b640          	ld	a,L3_signals+58
1088  005f 1103          	cp	a,(OFST-1,sp)
1089  0061 2703          	jreq	L313
1092  0063 4f            	clr	a
1094  0064 20f4          	jra	L242
1095  0066               L313:
1096                     ; 137     return 1;//correct parity check
1098  0066 a601          	ld	a,#1
1100  0068 20f0          	jra	L242
1147                     ; 140 static void DCF77_ProcessPulse(uint16_t w)
1147                     ; 141 {
1148                     .text:	section	.text,new
1149  0000               L513_DCF77_ProcessPulse:
1151  0000 89            	pushw	x
1152  0001 88            	push	a
1153       00000001      OFST:	set	1
1156                     ; 143     silenceTicks = 0;
1158  0002 3f05          	clr	_silenceTicks
1159                     ; 145     if (state != DCF_IN_FRAME && state != DCF_SEARCH_SYNC)
1161  0004 b604          	ld	a,L7_state
1162  0006 a101          	cp	a,#1
1163  0008 2704          	jreq	L143
1165  000a 3d04          	tnz	L7_state
1166  000c 2632          	jrne	L642
1167                     ; 146         return;
1169  000e               L143:
1170                     ; 148     if (w >= BIT0_MIN && w < BIT0_MAX)
1172  000e 1e02          	ldw	x,(OFST+1,sp)
1173  0010 a31388        	cpw	x,#5000
1174  0013 250b          	jrult	L343
1176  0015 1e02          	ldw	x,(OFST+1,sp)
1177  0017 a330d4        	cpw	x,#12500
1178  001a 2404          	jruge	L343
1179                     ; 149         bit = 0;
1181  001c 0f01          	clr	(OFST+0,sp)
1184  001e 2012          	jra	L543
1185  0020               L343:
1186                     ; 150     else if (w >= BIT1_MIN && w < BIT1_MAX)
1188  0020 1e02          	ldw	x,(OFST+1,sp)
1189  0022 a330d4        	cpw	x,#12500
1190  0025 2515          	jrult	L743
1192  0027 1e02          	ldw	x,(OFST+1,sp)
1193  0029 a355f0        	cpw	x,#22000
1194  002c 240e          	jruge	L743
1195                     ; 151         bit = 1;
1197  002e a601          	ld	a,#1
1198  0030 6b01          	ld	(OFST+0,sp),a
1201  0032               L543:
1202                     ; 161     if (state == DCF_SEARCH_SYNC)
1204  0032 3d04          	tnz	L7_state
1205  0034 260d          	jrne	L353
1206                     ; 162         state = DCF_IN_FRAME;
1208  0036 35010004      	mov	L7_state,#1
1209  003a 2007          	jra	L353
1210  003c               L743:
1211                     ; 155         state = DCF_SEARCH_SYNC;
1213  003c 3f04          	clr	L7_state
1214                     ; 156         signalIndex = 0;
1216  003e 3f03          	clr	L5_signalIndex
1217                     ; 157         return;
1218  0040               L642:
1221  0040 5b03          	addw	sp,#3
1222  0042 81            	ret
1223  0043               L353:
1224                     ; 164     signals[signalIndex++] = bit;
1226  0043 b603          	ld	a,L5_signalIndex
1227  0045 97            	ld	xl,a
1228  0046 3c03          	inc	L5_signalIndex
1229  0048 9f            	ld	a,xl
1230  0049 5f            	clrw	x
1231  004a 97            	ld	xl,a
1232  004b 7b01          	ld	a,(OFST+0,sp)
1233  004d e706          	ld	(L3_signals,x),a
1234                     ; 166     if (signalIndex >= FRAME_BITS)
1236  004f b603          	ld	a,L5_signalIndex
1237  0051 a13b          	cp	a,#59
1238  0053 2504          	jrult	L553
1239                     ; 167         state = DCF_FRAME_READY;
1241  0055 35020004      	mov	L7_state,#2
1242  0059               L553:
1243                     ; 168 }
1245  0059 20e5          	jra	L642
1279                     ; 170 static void DCF77_CommitFrame(void)
1279                     ; 171 {
1280                     .text:	section	.text,new
1281  0000               L753_DCF77_CommitFrame:
1285                     ; 172     if (!DCF77_CheckParity())//correct parity check
1287  0000 cd0000        	call	L122_DCF77_CheckParity
1289  0003 4d            	tnz	a
1290  0004 2605          	jrne	L173
1291                     ; 174         state = DCF_SEARCH_SYNC;
1293  0006 3f04          	clr	L7_state
1294                     ; 175         signalIndex = 0;
1296  0008 3f03          	clr	L5_signalIndex
1297                     ; 176         return;
1300  000a 81            	ret
1301  000b               L173:
1302                     ; 178     lastTimeValue.minutes     = getMinutes();
1304  000b cd0000        	call	L34_getMinutes
1306  000e b700          	ld	L31_lastTimeValue,a
1307                     ; 179     lastTimeValue.hours       = getHours();
1309  0010 cd0000        	call	L76_getHours
1311  0013 b701          	ld	L31_lastTimeValue+1,a
1312                     ; 180 		lastTimeValue.dayOfWeek   = getDayOfWeek();
1314  0015 cd0000        	call	L731_getDayOfWeek
1316  0018 b702          	ld	L31_lastTimeValue+2,a
1317                     ; 181     lastTimeValue.dayOfMonth  = getDayOfMonth();
1319  001a cd0000        	call	L311_getDayOfMonth
1321  001d b703          	ld	L31_lastTimeValue+3,a
1322                     ; 182     lastTimeValue.months      = getMonths();
1324  001f cd0000        	call	L151_getMonths
1326  0022 b704          	ld	L31_lastTimeValue+4,a
1327                     ; 183     lastTimeValue.years       = getYears();
1329  0024 cd0000        	call	L571_getYears
1331  0027 b705          	ld	L31_lastTimeValue+5,a
1332                     ; 185     timeReceived = 1;
1334  0029 35010006      	mov	L11_timeReceived,#1
1335                     ; 187     state = DCF_SEARCH_SYNC;
1337  002d 3f04          	clr	L7_state
1338                     ; 188     signalIndex = 0;
1340  002f 3f03          	clr	L5_signalIndex
1341                     ; 189 }
1344  0031 81            	ret
1370                     ; 191 static void DCF77_Monitor(void)
1370                     ; 192 {
1371                     .text:	section	.text,new
1372  0000               L373_DCF77_Monitor:
1376                     ; 193     if (silenceTicks > THRESHOLD_TICK)   
1378  0000 b605          	ld	a,_silenceTicks
1379  0002 a112          	cp	a,#18
1380  0004 2506          	jrult	L504
1381                     ; 195         state = DCF_SEARCH_SYNC;
1383  0006 3f04          	clr	L7_state
1384                     ; 196         signalIndex = 0;
1386  0008 3f03          	clr	L5_signalIndex
1387                     ; 197         silenceTicks = 0;
1389  000a 3f05          	clr	_silenceTicks
1390  000c               L504:
1391                     ; 199 }
1394  000c 81            	ret
1434                     ; 201 void DCF77_Update(void)
1434                     ; 202 {
1435                     .text:	section	.text,new
1436  0000               _DCF77_Update:
1438  0000 89            	pushw	x
1439       00000002      OFST:	set	2
1442                     ; 203 	  DCF77_Monitor();
1444  0001 cd0000        	call	L373_DCF77_Monitor
1446                     ; 204     if (pulseReady)
1448  0004 3d02          	tnz	_pulseReady
1449  0006 270b          	jreq	L524
1450                     ; 209         w = pulseWidth;
1452  0008 be00          	ldw	x,_pulseWidth
1453  000a 1f01          	ldw	(OFST-1,sp),x
1455                     ; 210         pulseReady = 0;
1457  000c 3f02          	clr	_pulseReady
1458                     ; 213         DCF77_ProcessPulse(w);
1460  000e 1e01          	ldw	x,(OFST-1,sp)
1461  0010 cd0000        	call	L513_DCF77_ProcessPulse
1463  0013               L524:
1464                     ; 215     if (state == DCF_FRAME_READY)
1466  0013 b604          	ld	a,L7_state
1467  0015 a102          	cp	a,#2
1468  0017 2603          	jrne	L724
1469                     ; 217         DCF77_CommitFrame();
1471  0019 cd0000        	call	L753_DCF77_CommitFrame
1473  001c               L724:
1474                     ; 219 }
1477  001c 85            	popw	x
1478  001d 81            	ret
1503                     ; 221 bool DCF77_GetTime(void)
1503                     ; 222 {
1504                     .text:	section	.text,new
1505  0000               _DCF77_GetTime:
1509                     ; 223     if (timeReceived)
1511  0000 3d06          	tnz	L11_timeReceived
1512  0002 2705          	jreq	L144
1513                     ; 225         timeReceived = 0;
1515  0004 3f06          	clr	L11_timeReceived
1516                     ; 226         return 1;
1518  0006 a601          	ld	a,#1
1521  0008 81            	ret
1522  0009               L144:
1523                     ; 228     return 0;
1525  0009 4f            	clr	a
1528  000a 81            	ret
1615                     ; 232 void DCF77_ReadTime(DCF77_dateTime_t *out)
1615                     ; 233 {
1616                     .text:	section	.text,new
1617  0000               _DCF77_ReadTime:
1621                     ; 235     *out = lastTimeValue;
1623  0000 90ae0000      	ldw	y,#L31_lastTimeValue
1624  0004 a606          	ld	a,#6
1625  0006 cd0000        	call	c_xymov
1627                     ; 237 }
1630  0009 81            	ret
1660                     ; 240 void DCF77_Init(void)
1660                     ; 241 {
1661                     .text:	section	.text,new
1662  0000               _DCF77_Init:
1666                     ; 242     signalIndex = 0;
1668  0000 3f03          	clr	L5_signalIndex
1669                     ; 243     state = DCF_SEARCH_SYNC;
1671  0002 3f04          	clr	L7_state
1672                     ; 244 		ms_counter = 0;
1674  0004 3f42          	clr	_ms_counter
1675                     ; 245     silenceTicks = 0;
1677  0006 3f05          	clr	_silenceTicks
1678                     ; 246     timeReceived = 0;
1680  0008 3f06          	clr	L11_timeReceived
1681                     ; 247 		TIM4_setup();
1683  000a cd0000        	call	_TIM4_setup
1685                     ; 248 		TIM1_setup();
1687  000d cd0000        	call	_TIM1_setup
1689                     ; 250 }
1692  0010 81            	ret
1818                     	switch	.ubsct
1819  0000               L31_lastTimeValue:
1820  0000 000000000000  	ds.b	6
1821  0006               L3_signals:
1822  0006 000000000000  	ds.b	60
1823                     	xdef	_TIM1_setup
1824                     	xdef	_TIM4_setup
1825                     	xdef	_DCF77_ReadTime
1826                     	xdef	_DCF77_GetTime
1827                     	xdef	_DCF77_Update
1828                     	xdef	_DCF77_Init
1829                     	xdef	_pulseReady
1830                     	xdef	_pulseWidth
1831                     	xdef	_silenceTicks
1832  0042               _ms_counter:
1833  0042 00            	ds.b	1
1834                     	xdef	_ms_counter
1835                     	xref	_TIM4_ITConfig
1836                     	xref	_TIM4_Cmd
1837                     	xref	_TIM4_TimeBaseInit
1838                     	xref	_TIM4_DeInit
1839                     	xref	_TIM1_ClearFlag
1840                     	xref	_TIM1_ITConfig
1841                     	xref	_TIM1_Cmd
1842                     	xref	_TIM1_ICInit
1843                     	xref	_TIM1_TimeBaseInit
1844                     	xref	_TIM1_DeInit
1845                     	xref.b	c_x
1865                     	xref	c_xymov
1866                     	end
