   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.3 - 22 May 2025
   3                     ; Generator (Limited) V4.6.5 - 22 May 2025
  14                     	bsct
  15  0000               _set_brightness:
  16  0000 07            	dc.b	7
  17  0001               _set_state:
  18  0001 08            	dc.b	8
  58                     .const:	section	.text
  59  0000               L01:
  60  0000 00ba          	dc.w	L521
  61  0002 00ae          	dc.w	L711
  62  0004 00aa          	dc.w	L511
  63  0006 00b2          	dc.w	L121
  64  0008 00ca          	dc.w	L531
  65  000a 00be          	dc.w	L721
  66  000c 0080          	dc.w	L76
  67  000e 0084          	dc.w	L17
  68  0010 0088          	dc.w	L37
  69  0012 008c          	dc.w	L57
  70  0014 0090          	dc.w	L77
  71  0016 0094          	dc.w	L101
  72  0018 0098          	dc.w	L301
  73  001a 009c          	dc.w	L501
  74  001c 00a0          	dc.w	L701
  75  001e 00a4          	dc.w	L111
  76  0020 00b6          	dc.w	L321
  77  0022 00ca          	dc.w	L531
  78  0024 00ca          	dc.w	L531
  79  0026 00ca          	dc.w	L531
  80  0028 00ca          	dc.w	L531
  81  002a 00ca          	dc.w	L531
  82  002c 00ca          	dc.w	L531
  83  002e 0018          	dc.w	L3
  84  0030 001c          	dc.w	L5
  85  0032 0020          	dc.w	L7
  86  0034 0024          	dc.w	L11
  87  0036 0028          	dc.w	L31
  88  0038 002c          	dc.w	L51
  89  003a 0030          	dc.w	L71
  90  003c 0034          	dc.w	L12
  91  003e 0038          	dc.w	L32
  92  0040 003c          	dc.w	L52
  93  0042 0040          	dc.w	L72
  94  0044 0044          	dc.w	L13
  95  0046 0048          	dc.w	L33
  96  0048 004c          	dc.w	L53
  97  004a 0050          	dc.w	L73
  98  004c 0054          	dc.w	L14
  99  004e 0058          	dc.w	L34
 100  0050 005c          	dc.w	L54
 101  0052 0060          	dc.w	L74
 102  0054 0064          	dc.w	L15
 103  0056 0068          	dc.w	L35
 104  0058 006c          	dc.w	L55
 105  005a 0070          	dc.w	L75
 106  005c 0074          	dc.w	L16
 107  005e 0078          	dc.w	L36
 108  0060 007c          	dc.w	L56
 109  0062 00ca          	dc.w	L531
 110  0064 00c2          	dc.w	L131
 111  0066 00ca          	dc.w	L531
 112  0068 00ca          	dc.w	L531
 113  006a 00ca          	dc.w	L531
 114  006c 00ca          	dc.w	L531
 115  006e 00ca          	dc.w	L531
 116  0070 00ca          	dc.w	L531
 117  0072 00ca          	dc.w	L531
 118  0074 00ca          	dc.w	L531
 119  0076 00ca          	dc.w	L531
 120  0078 00ca          	dc.w	L531
 121  007a 00ca          	dc.w	L531
 122  007c 00ca          	dc.w	L531
 123  007e 00ca          	dc.w	L531
 124  0080 00ca          	dc.w	L531
 125  0082 00ca          	dc.w	L531
 126  0084 00ca          	dc.w	L531
 127  0086 00ca          	dc.w	L531
 128  0088 00ca          	dc.w	L531
 129  008a 00ca          	dc.w	L531
 130  008c 00ca          	dc.w	L531
 131  008e 00ca          	dc.w	L531
 132  0090 00ca          	dc.w	L531
 133  0092 00ca          	dc.w	L531
 134  0094 00ca          	dc.w	L531
 135  0096 00ca          	dc.w	L531
 136  0098 00ca          	dc.w	L531
 137  009a 00ca          	dc.w	L531
 138  009c 00ca          	dc.w	L531
 139  009e 00ca          	dc.w	L531
 140  00a0 00ca          	dc.w	L531
 141  00a2 00ca          	dc.w	L531
 142  00a4 00c6          	dc.w	L331
 143                     ; 7 uint16_t cs16311_font(char chr)
 143                     ; 8 {
 144                     	scross	off
 145                     	switch	.text
 146  0000               _cs16311_font:
 150                     ; 9     switch(chr)
 153                     ; 63         default:
 153                     ; 64             return 0x0000;
 154  0000 a02a          	sub	a,#42
 155  0002 a153          	cp	a,#83
 156  0004 2407          	jruge	L6
 157  0006 5f            	clrw	x
 158  0007 97            	ld	xl,a
 159  0008 58            	sllw	x
 160  0009 de0000        	ldw	x,(L01,x)
 161  000c fc            	jp	(x)
 162  000d               L6:
 163  000d a0f6          	sub	a,#-10
 164  000f 2603          	jrne	L21
 165  0011 cc00a8        	jp	L311
 166  0014               L21:
 167  0014 acca00ca      	jpf	L531
 168  0018               L3:
 169                     ; 12         case 'A': return 0x478C;
 171  0018 ae478c        	ldw	x,#18316
 174  001b 81            	ret
 175  001c               L5:
 176                     ; 13         case 'B': return 0x962C;
 178  001c ae962c        	ldw	x,#38444
 181  001f 81            	ret
 182  0020               L7:
 183                     ; 14         case 'C': return 0xC084;
 185  0020 aec084        	ldw	x,#49284
 188  0023 81            	ret
 189  0024               L11:
 190                     ; 15         case 'D': return 0x942C;
 192  0024 ae942c        	ldw	x,#37932
 195  0027 81            	ret
 196  0028               L31:
 197                     ; 16         case 'E': return 0xC384;
 199  0028 aec384        	ldw	x,#50052
 202  002b 81            	ret
 203  002c               L51:
 204                     ; 17         case 'F': return 0x4384;
 206  002c ae4384        	ldw	x,#17284
 209  002f 81            	ret
 210  0030               L71:
 211                     ; 18         case 'G': return 0xC684;
 213  0030 aec684        	ldw	x,#50820
 216  0033 81            	ret
 217  0034               L12:
 218                     ; 19         case 'H': return 0x4788;
 220  0034 ae4788        	ldw	x,#18312
 223  0037 81            	ret
 224  0038               L32:
 225                     ; 20         case 'I': return 0x9024;
 227  0038 ae9024        	ldw	x,#36900
 230  003b 81            	ret
 231  003c               L52:
 232                     ; 21         case 'J': return 0xC408;
 234  003c aec408        	ldw	x,#50184
 237  003f 81            	ret
 238  0040               L72:
 239                     ; 22         case 'K': return 0x4990;
 241  0040 ae4990        	ldw	x,#18832
 244  0043 81            	ret
 245  0044               L13:
 246                     ; 23         case 'L': return 0xC080;
 248  0044 aec080        	ldw	x,#49280
 251  0047 81            	ret
 252  0048               L33:
 253                     ; 24         case 'M': return 0x54D8;
 255  0048 ae54d8        	ldw	x,#21720
 258  004b 81            	ret
 259  004c               L53:
 260                     ; 25         case 'N': return 0x4CC8;
 262  004c ae4cc8        	ldw	x,#19656
 265  004f 81            	ret
 266  0050               L73:
 267                     ; 26         case 'O': return 0xC48C;
 269  0050 aec48c        	ldw	x,#50316
 272  0053 81            	ret
 273  0054               L14:
 274                     ; 27         case 'P': return 0x438C;
 276  0054 ae438c        	ldw	x,#17292
 279  0057 81            	ret
 280  0058               L34:
 281                     ; 28         case 'Q': return 0xCC8C;
 283  0058 aecc8c        	ldw	x,#52364
 286  005b 81            	ret
 287  005c               L54:
 288                     ; 29         case 'R': return 0x4B8C;
 290  005c ae4b8c        	ldw	x,#19340
 293  005f 81            	ret
 294  0060               L74:
 295                     ; 30         case 'S': return 0x8784;
 297  0060 ae8784        	ldw	x,#34692
 300  0063 81            	ret
 301  0064               L15:
 302                     ; 31         case 'T': return 0x1024;
 304  0064 ae1024        	ldw	x,#4132
 307  0067 81            	ret
 308  0068               L35:
 309                     ; 32         case 'U': return 0xC488;
 311  0068 aec488        	ldw	x,#50312
 314  006b 81            	ret
 315  006c               L55:
 316                     ; 33         case 'V': return 0x6090;
 318  006c ae6090        	ldw	x,#24720
 321  006f 81            	ret
 322  0070               L75:
 323                     ; 34         case 'W': return 0x6CA8;
 325  0070 ae6ca8        	ldw	x,#27816
 328  0073 81            	ret
 329  0074               L16:
 330                     ; 35         case 'X': return 0x2850;
 332  0074 ae2850        	ldw	x,#10320
 335  0077 81            	ret
 336  0078               L36:
 337                     ; 36         case 'Y': return 0x1388;
 339  0078 ae1388        	ldw	x,#5000
 342  007b 81            	ret
 343  007c               L56:
 344                     ; 37         case 'Z': return 0xA314;
 346  007c aea314        	ldw	x,#41748
 349  007f 81            	ret
 350  0080               L76:
 351                     ; 40         case '0': return 0xE49C;
 353  0080 aee49c        	ldw	x,#58524
 356  0083 81            	ret
 357  0084               L17:
 358                     ; 41         case '1': return 0x0408;
 360  0084 ae0408        	ldw	x,#1032
 363  0087 81            	ret
 364  0088               L37:
 365                     ; 42         case '2': return 0xC30C;
 367  0088 aec30c        	ldw	x,#49932
 370  008b 81            	ret
 371  008c               L57:
 372                     ; 43         case '3': return 0x870C;
 374  008c ae870c        	ldw	x,#34572
 377  008f 81            	ret
 378  0090               L77:
 379                     ; 44         case '4': return 0x0788;
 381  0090 ae0788        	ldw	x,#1928
 384  0093 81            	ret
 385  0094               L101:
 386                     ; 45         case '5': return 0x8784;
 388  0094 ae8784        	ldw	x,#34692
 391  0097 81            	ret
 392  0098               L301:
 393                     ; 46         case '6': return 0xC784;
 395  0098 aec784        	ldw	x,#51076
 398  009b 81            	ret
 399  009c               L501:
 400                     ; 47         case '7': return 0x040C;
 402  009c ae040c        	ldw	x,#1036
 405  009f 81            	ret
 406  00a0               L701:
 407                     ; 48         case '8': return 0xC78C;
 409  00a0 aec78c        	ldw	x,#51084
 412  00a3 81            	ret
 413  00a4               L111:
 414                     ; 49         case '9': return 0x078C;
 416  00a4 ae078c        	ldw	x,#1932
 419  00a7 81            	ret
 420  00a8               L311:
 421                     ; 52         case ' ': return 0x0000;
 423  00a8 5f            	clrw	x
 426  00a9 81            	ret
 427  00aa               L511:
 428                     ; 53         case ',': return 0x2000;
 430  00aa ae2000        	ldw	x,#8192
 433  00ad 81            	ret
 434  00ae               L711:
 435                     ; 54         case '+': return 0x1320;
 437  00ae ae1320        	ldw	x,#4896
 440  00b1 81            	ret
 441  00b2               L121:
 442                     ; 55         case '-': return 0x0300;
 444  00b2 ae0300        	ldw	x,#768
 447  00b5 81            	ret
 448  00b6               L321:
 449                     ; 56         case ':': return 0x1020;
 451  00b6 ae1020        	ldw	x,#4128
 454  00b9 81            	ret
 455  00ba               L521:
 456                     ; 57         case '*': return 0x3B70;
 458  00ba ae3b70        	ldw	x,#15216
 461  00bd 81            	ret
 462  00be               L721:
 463                     ; 58         case '/': return 0x2010;
 465  00be ae2010        	ldw	x,#8208
 468  00c1 81            	ret
 469  00c2               L131:
 470                     ; 59         case '\\': return 0x0840;
 472  00c2 ae0840        	ldw	x,#2112
 475  00c5 81            	ret
 476  00c6               L331:
 477                     ; 60         case '|': return 0x1020;
 479  00c6 ae1020        	ldw	x,#4128
 482  00c9 81            	ret
 483  00ca               L531:
 484                     ; 63         default:
 484                     ; 64             return 0x0000;
 486  00ca 5f            	clrw	x
 489  00cb 81            	ret
 541                     ; 68 static uint16_t cs16311_convert(uint16_t v) //fix for my type display
 541                     ; 69 {
 542                     	switch	.text
 543  00cc               L761_cs16311_convert:
 545  00cc 89            	pushw	x
 546  00cd 5204          	subw	sp,#4
 547       00000004      OFST:	set	4
 550                     ; 70     uint16_t r = 0,i;
 552  00cf 5f            	clrw	x
 553  00d0 1f01          	ldw	(OFST-3,sp),x
 555                     ; 71     v >>= 2;
 557  00d2 a602          	ld	a,#2
 558  00d4               L61:
 559  00d4 0405          	srl	(OFST+1,sp)
 560  00d6 0606          	rrc	(OFST+2,sp)
 561  00d8 4a            	dec	a
 562  00d9 26f9          	jrne	L61
 563                     ; 72     for (i = 0; i < 14; i++)
 565  00db 5f            	clrw	x
 566  00dc 1f03          	ldw	(OFST-1,sp),x
 568  00de               L712:
 569                     ; 74         if (v & (1 << i))
 571  00de ae0001        	ldw	x,#1
 572  00e1 7b04          	ld	a,(OFST+0,sp)
 573  00e3 4d            	tnz	a
 574  00e4 2704          	jreq	L02
 575  00e6               L22:
 576  00e6 58            	sllw	x
 577  00e7 4a            	dec	a
 578  00e8 26fc          	jrne	L22
 579  00ea               L02:
 580  00ea 01            	rrwa	x,a
 581  00eb 1406          	and	a,(OFST+2,sp)
 582  00ed 01            	rrwa	x,a
 583  00ee 1405          	and	a,(OFST+1,sp)
 584  00f0 01            	rrwa	x,a
 585  00f1 a30000        	cpw	x,#0
 586  00f4 2717          	jreq	L522
 587                     ; 75             r |= (1 << (13 - i));
 589  00f6 ae0001        	ldw	x,#1
 590  00f9 a60d          	ld	a,#13
 591  00fb 1004          	sub	a,(OFST+0,sp)
 592  00fd 4d            	tnz	a
 593  00fe 2704          	jreq	L42
 594  0100               L62:
 595  0100 58            	sllw	x
 596  0101 4a            	dec	a
 597  0102 26fc          	jrne	L62
 598  0104               L42:
 599  0104 01            	rrwa	x,a
 600  0105 1a02          	or	a,(OFST-2,sp)
 601  0107 01            	rrwa	x,a
 602  0108 1a01          	or	a,(OFST-3,sp)
 603  010a 01            	rrwa	x,a
 604  010b 1f01          	ldw	(OFST-3,sp),x
 606  010d               L522:
 607                     ; 72     for (i = 0; i < 14; i++)
 609  010d 1e03          	ldw	x,(OFST-1,sp)
 610  010f 1c0001        	addw	x,#1
 611  0112 1f03          	ldw	(OFST-1,sp),x
 615  0114 1e03          	ldw	x,(OFST-1,sp)
 616  0116 a3000e        	cpw	x,#14
 617  0119 25c3          	jrult	L712
 618                     ; 78     return r;
 620  011b 1e01          	ldw	x,(OFST-3,sp)
 623  011d 5b06          	addw	sp,#6
 624  011f 81            	ret
 649                     ; 81 void cs16311_setup_io(void)
 649                     ; 82 {
 650                     	switch	.text
 651  0120               _cs16311_setup_io:
 655                     ; 83     GPIO_Init(CS16311_DIN_PORT,  CS16311_DIN_PIN,  GPIO_MODE_OUT_PP_HIGH_FAST);
 657  0120 4bf0          	push	#240
 658  0122 4b08          	push	#8
 659  0124 ae5000        	ldw	x,#20480
 660  0127 cd0000        	call	_GPIO_Init
 662  012a 85            	popw	x
 663                     ; 84     GPIO_Init(CS16311_CLK_PORT,  CS16311_CLK_PIN,  GPIO_MODE_OUT_PP_HIGH_FAST);
 665  012b 4bf0          	push	#240
 666  012d 4b04          	push	#4
 667  012f ae5000        	ldw	x,#20480
 668  0132 cd0000        	call	_GPIO_Init
 670  0135 85            	popw	x
 671                     ; 85     GPIO_Init(CS16311_STB_PORT,  CS16311_STB_PIN,  GPIO_MODE_OUT_PP_HIGH_FAST);
 673  0136 4bf0          	push	#240
 674  0138 4b40          	push	#64
 675  013a ae500f        	ldw	x,#20495
 676  013d cd0000        	call	_GPIO_Init
 678  0140 85            	popw	x
 679                     ; 86     GPIO_Init(CS16311_DOUT_PORT, CS16311_DOUT_PIN, GPIO_MODE_IN_PU_NO_IT);
 681  0141 4b40          	push	#64
 682  0143 4b02          	push	#2
 683  0145 ae5000        	ldw	x,#20480
 684  0148 cd0000        	call	_GPIO_Init
 686  014b 85            	popw	x
 687                     ; 88     CS16311_DIN_HIGH();
 689  014c 4b08          	push	#8
 690  014e ae5000        	ldw	x,#20480
 691  0151 cd0000        	call	_GPIO_WriteHigh
 693  0154 84            	pop	a
 694                     ; 89     CS16311_CLK_HIGH();
 696  0155 4b04          	push	#4
 697  0157 ae5000        	ldw	x,#20480
 698  015a cd0000        	call	_GPIO_WriteHigh
 700  015d 84            	pop	a
 701                     ; 90     CS16311_STB_HIGH();
 703  015e 4b40          	push	#64
 704  0160 ae500f        	ldw	x,#20495
 705  0163 cd0000        	call	_GPIO_WriteHigh
 707  0166 84            	pop	a
 708                     ; 91 }
 711  0167 81            	ret
 736                     ; 93 static void cs16311_start(void)
 736                     ; 94 {
 737                     	switch	.text
 738  0168               L732_cs16311_start:
 742                     ; 95     CS16311_STB_LOW();
 744  0168 4b40          	push	#64
 745  016a ae500f        	ldw	x,#20495
 746  016d cd0000        	call	_GPIO_WriteLow
 748  0170 84            	pop	a
 749                     ; 96     delay_us(10);        
 751  0171 ae000a        	ldw	x,#10
 752  0174 cd0000        	call	_delay_us
 754                     ; 97 }
 757  0177 81            	ret
 782                     ; 99 static void cs16311_stop(void)
 782                     ; 100 {
 783                     	switch	.text
 784  0178               L152_cs16311_stop:
 788                     ; 101     CS16311_STB_HIGH();
 790  0178 4b40          	push	#64
 791  017a ae500f        	ldw	x,#20495
 792  017d cd0000        	call	_GPIO_WriteHigh
 794  0180 84            	pop	a
 795                     ; 102     delay_us(10);
 797  0181 ae000a        	ldw	x,#10
 798  0184 cd0000        	call	_delay_us
 800                     ; 103 }
 803  0187 81            	ret
 849                     ; 105 static void cs16311_shift_out(uint8_t data)
 849                     ; 106 {
 850                     	switch	.text
 851  0188               L362_cs16311_shift_out:
 853  0188 88            	push	a
 854  0189 88            	push	a
 855       00000001      OFST:	set	1
 858                     ; 108     for (i = 0; i < 8; i++)
 860  018a 0f01          	clr	(OFST+0,sp)
 862  018c               L703:
 863                     ; 110         if (data & 0x01)
 865  018c 7b02          	ld	a,(OFST+1,sp)
 866  018e a501          	bcp	a,#1
 867  0190 270b          	jreq	L513
 868                     ; 111             CS16311_DIN_HIGH();
 870  0192 4b08          	push	#8
 871  0194 ae5000        	ldw	x,#20480
 872  0197 cd0000        	call	_GPIO_WriteHigh
 874  019a 84            	pop	a
 876  019b 2009          	jra	L713
 877  019d               L513:
 878                     ; 113             CS16311_DIN_LOW();
 880  019d 4b08          	push	#8
 881  019f ae5000        	ldw	x,#20480
 882  01a2 cd0000        	call	_GPIO_WriteLow
 884  01a5 84            	pop	a
 885  01a6               L713:
 886                     ; 115         CS16311_CLK_LOW();
 888  01a6 4b04          	push	#4
 889  01a8 ae5000        	ldw	x,#20480
 890  01ab cd0000        	call	_GPIO_WriteLow
 892  01ae 84            	pop	a
 893                     ; 116         delay_us(5);    
 895  01af ae0005        	ldw	x,#5
 896  01b2 cd0000        	call	_delay_us
 898                     ; 117         CS16311_CLK_HIGH();
 900  01b5 4b04          	push	#4
 901  01b7 ae5000        	ldw	x,#20480
 902  01ba cd0000        	call	_GPIO_WriteHigh
 904  01bd 84            	pop	a
 905                     ; 118         delay_us(5);
 907  01be ae0005        	ldw	x,#5
 908  01c1 cd0000        	call	_delay_us
 910                     ; 120         data >>= 1;
 912  01c4 0402          	srl	(OFST+1,sp)
 913                     ; 108     for (i = 0; i < 8; i++)
 915  01c6 0c01          	inc	(OFST+0,sp)
 919  01c8 7b01          	ld	a,(OFST+0,sp)
 920  01ca a108          	cp	a,#8
 921  01cc 25be          	jrult	L703
 922                     ; 122 }
 925  01ce 85            	popw	x
 926  01cf 81            	ret
 973                     ; 124 static uint8_t cs16311_shift_in(void)
 973                     ; 125 {
 974                     	switch	.text
 975  01d0               L123_cs16311_shift_in:
 977  01d0 89            	pushw	x
 978       00000002      OFST:	set	2
 981                     ; 126     uint8_t data = 0,i;
 983  01d1 0f01          	clr	(OFST-1,sp)
 985                     ; 127     for (i = 0; i < 8; i++)
 987  01d3 0f02          	clr	(OFST+0,sp)
 989  01d5               L543:
 990                     ; 129         CS16311_CLK_LOW();
 992  01d5 4b04          	push	#4
 993  01d7 ae5000        	ldw	x,#20480
 994  01da cd0000        	call	_GPIO_WriteLow
 996  01dd 84            	pop	a
 997                     ; 130         delay_us(5);
 999  01de ae0005        	ldw	x,#5
1000  01e1 cd0000        	call	_delay_us
1002                     ; 132         if (CS16311_DOUT_READ())
1004  01e4 4b02          	push	#2
1005  01e6 ae5000        	ldw	x,#20480
1006  01e9 cd0000        	call	_GPIO_ReadInputPin
1008  01ec 5b01          	addw	sp,#1
1009  01ee 4d            	tnz	a
1010  01ef 2711          	jreq	L353
1011                     ; 133             data |= (1 << i); 
1013  01f1 7b02          	ld	a,(OFST+0,sp)
1014  01f3 5f            	clrw	x
1015  01f4 97            	ld	xl,a
1016  01f5 a601          	ld	a,#1
1017  01f7 5d            	tnzw	x
1018  01f8 2704          	jreq	L24
1019  01fa               L44:
1020  01fa 48            	sll	a
1021  01fb 5a            	decw	x
1022  01fc 26fc          	jrne	L44
1023  01fe               L24:
1024  01fe 1a01          	or	a,(OFST-1,sp)
1025  0200 6b01          	ld	(OFST-1,sp),a
1027  0202               L353:
1028                     ; 135         CS16311_CLK_HIGH();
1030  0202 4b04          	push	#4
1031  0204 ae5000        	ldw	x,#20480
1032  0207 cd0000        	call	_GPIO_WriteHigh
1034  020a 84            	pop	a
1035                     ; 136         delay_us(5);
1037  020b ae0005        	ldw	x,#5
1038  020e cd0000        	call	_delay_us
1040                     ; 127     for (i = 0; i < 8; i++)
1042  0211 0c02          	inc	(OFST+0,sp)
1046  0213 7b02          	ld	a,(OFST+0,sp)
1047  0215 a108          	cp	a,#8
1048  0217 25bc          	jrult	L543
1049                     ; 138     return data;
1051  0219 7b01          	ld	a,(OFST-1,sp)
1054  021b 85            	popw	x
1055  021c 81            	ret
1117                     ; 141 void cs16311_init(uint8_t num_digits)
1117                     ; 142 {
1118                     	switch	.text
1119  021d               _cs16311_init:
1121  021d 88            	push	a
1122       00000001      OFST:	set	1
1125                     ; 144     cs16311_num_digits = num_digits;
1127  021e b700          	ld	_cs16311_num_digits,a
1128                     ; 145     cs16311_setup_io();
1130  0220 cd0120        	call	_cs16311_setup_io
1132                     ; 147     delay_ms(50);
1134  0223 ae0032        	ldw	x,#50
1135  0226 cd0000        	call	_delay_ms
1137                     ; 148     cs16311_start();
1139  0229 cd0168        	call	L732_cs16311_start
1141                     ; 149     cs16311_shift_out(CS16311_CMD2 | 0b00000000);
1143  022c a640          	ld	a,#64
1144  022e cd0188        	call	L362_cs16311_shift_out
1146                     ; 150     cs16311_stop();
1148  0231 cd0178        	call	L152_cs16311_stop
1150                     ; 152     cs16311_start();
1152  0234 cd0168        	call	L732_cs16311_start
1154                     ; 153     cs16311_shift_out(CS16311_CMD3); 
1156  0237 a6c0          	ld	a,#192
1157  0239 cd0188        	call	L362_cs16311_shift_out
1159                     ; 154     for (i = 0; i < 48; i++) {  
1161  023c 0f01          	clr	(OFST+0,sp)
1163  023e               L524:
1164                     ; 155         cs16311_shift_out(0x00);
1166  023e 4f            	clr	a
1167  023f cd0188        	call	L362_cs16311_shift_out
1169                     ; 154     for (i = 0; i < 48; i++) {  
1171  0242 0c01          	inc	(OFST+0,sp)
1175  0244 7b01          	ld	a,(OFST+0,sp)
1176  0246 a130          	cp	a,#48
1177  0248 25f4          	jrult	L524
1178                     ; 157     cs16311_stop();
1180  024a cd0178        	call	L152_cs16311_stop
1182                     ; 159     cmd1 = CS16311_CMD1;
1184  024d 0f01          	clr	(OFST+0,sp)
1186                     ; 160     switch(cs16311_num_digits) {
1188  024f b600          	ld	a,_cs16311_num_digits
1190                     ; 169         default:  cmd1 |= CS16311_DIG8_SEG20;  break;
1191  0251 a009          	sub	a,#9
1192  0253 274f          	jreq	L373
1193  0255 4a            	dec	a
1194  0256 2744          	jreq	L173
1195  0258 4a            	dec	a
1196  0259 2739          	jreq	L763
1197  025b 4a            	dec	a
1198  025c 272e          	jreq	L563
1199  025e 4a            	dec	a
1200  025f 2723          	jreq	L363
1201  0261 4a            	dec	a
1202  0262 2718          	jreq	L163
1203  0264 4a            	dec	a
1204  0265 270d          	jreq	L753
1205  0267 4a            	dec	a
1206  0268 2702          	jreq	L553
1207  026a               L573:
1212  026a 203e          	jra	L534
1213  026c               L553:
1214                     ; 161 				case 16:  cmd1 |= CS16311_DIG16_SEG12; break;
1216  026c 7b01          	ld	a,(OFST+0,sp)
1217  026e aa0f          	or	a,#15
1218  0270 6b01          	ld	(OFST+0,sp),a
1222  0272 2036          	jra	L534
1223  0274               L753:
1224                     ; 162 				case 15:  cmd1 |= CS16311_DIG15_SEG13; break;
1226  0274 7b01          	ld	a,(OFST+0,sp)
1227  0276 aa0e          	or	a,#14
1228  0278 6b01          	ld	(OFST+0,sp),a
1232  027a 202e          	jra	L534
1233  027c               L163:
1234                     ; 163         case 14:  cmd1 |= CS16311_DIG14_SEG14; break;
1236  027c 7b01          	ld	a,(OFST+0,sp)
1237  027e aa0d          	or	a,#13
1238  0280 6b01          	ld	(OFST+0,sp),a
1242  0282 2026          	jra	L534
1243  0284               L363:
1244                     ; 164         case 13:  cmd1 |= CS16311_DIG13_SEG15; break;
1246  0284 7b01          	ld	a,(OFST+0,sp)
1247  0286 aa0c          	or	a,#12
1248  0288 6b01          	ld	(OFST+0,sp),a
1252  028a 201e          	jra	L534
1253  028c               L563:
1254                     ; 165         case 12:  cmd1 |= CS16311_DIG12_SEG16; break;
1256  028c 7b01          	ld	a,(OFST+0,sp)
1257  028e aa0b          	or	a,#11
1258  0290 6b01          	ld	(OFST+0,sp),a
1262  0292 2016          	jra	L534
1263  0294               L763:
1264                     ; 166         case 11:  cmd1 |= CS16311_DIG11_SEG17; break;
1266  0294 7b01          	ld	a,(OFST+0,sp)
1267  0296 aa0a          	or	a,#10
1268  0298 6b01          	ld	(OFST+0,sp),a
1272  029a 200e          	jra	L534
1273  029c               L173:
1274                     ; 167         case 10:  cmd1 |= CS16311_DIG10_SEG18; break;
1276  029c 7b01          	ld	a,(OFST+0,sp)
1277  029e aa09          	or	a,#9
1278  02a0 6b01          	ld	(OFST+0,sp),a
1282  02a2 2006          	jra	L534
1283  02a4               L373:
1284                     ; 168         case 9:   cmd1 |= CS16311_DIG9_SEG19;  break;
1286  02a4 7b01          	ld	a,(OFST+0,sp)
1287  02a6 aa08          	or	a,#8
1288  02a8 6b01          	ld	(OFST+0,sp),a
1292  02aa               L534:
1293                     ; 171     cs16311_start();
1295  02aa cd0168        	call	L732_cs16311_start
1297                     ; 172     cs16311_shift_out(cmd1);
1299  02ad 7b01          	ld	a,(OFST+0,sp)
1300  02af cd0188        	call	L362_cs16311_shift_out
1302                     ; 173     cs16311_stop();
1304  02b2 cd0178        	call	L152_cs16311_stop
1306                     ; 175     cs16311_set_display_state(set_state);
1308  02b5 b601          	ld	a,_set_state
1309  02b7 ad18          	call	_cs16311_set_display_state
1311                     ; 176     cs16311_set_brightness(set_brightness);
1313  02b9 b600          	ld	a,_set_brightness
1314  02bb ad02          	call	_cs16311_set_brightness
1316                     ; 177 }
1319  02bd 84            	pop	a
1320  02be 81            	ret
1431                     ; 179 void cs16311_set_brightness(cs16311_brightness_t brightness)
1431                     ; 180 {
1432                     	switch	.text
1433  02bf               _cs16311_set_brightness:
1437                     ; 181     set_brightness = brightness;
1439  02bf b700          	ld	_set_brightness,a
1440                     ; 183     cs16311_start();
1442  02c1 cd0168        	call	L732_cs16311_start
1444                     ; 184     cs16311_shift_out(CS16311_CMD4 | set_state | set_brightness);
1446  02c4 b601          	ld	a,_set_state
1447  02c6 aa80          	or	a,#128
1448  02c8 ba00          	or	a,_set_brightness
1449  02ca cd0188        	call	L362_cs16311_shift_out
1451                     ; 185     cs16311_stop();
1453  02cd cd0178        	call	L152_cs16311_stop
1455                     ; 186 }
1458  02d0 81            	ret
1520                     ; 188 void cs16311_set_display_state(cs16311_display_state_t state)
1520                     ; 189 {
1521                     	switch	.text
1522  02d1               _cs16311_set_display_state:
1526                     ; 190     set_state = state;
1528  02d1 b701          	ld	_set_state,a
1529                     ; 192     cs16311_start();
1531  02d3 cd0168        	call	L732_cs16311_start
1533                     ; 193     cs16311_shift_out(CS16311_CMD4 | set_state | set_brightness);
1535  02d6 b601          	ld	a,_set_state
1536  02d8 aa80          	or	a,#128
1537  02da ba00          	or	a,_set_brightness
1538  02dc cd0188        	call	L362_cs16311_shift_out
1540                     ; 194     cs16311_stop();
1542  02df cd0178        	call	L152_cs16311_stop
1544                     ; 195 }
1547  02e2 81            	ret
1604                     ; 197 void cs16311_write_digit(uint8_t logical_digit, uint32_t segments)
1604                     ; 198 {
1605                     	switch	.text
1606  02e3               _cs16311_write_digit:
1608  02e3 88            	push	a
1609  02e4 88            	push	a
1610       00000001      OFST:	set	1
1613                     ; 201 		physical_pos = cs16311_num_digits - 1 - logical_digit;
1615  02e5 b600          	ld	a,_cs16311_num_digits
1616  02e7 4a            	dec	a
1617  02e8 1002          	sub	a,(OFST+1,sp)
1618  02ea 6b01          	ld	(OFST+0,sp),a
1620                     ; 203     cs16311_start();
1622  02ec cd0168        	call	L732_cs16311_start
1624                     ; 204     cs16311_shift_out(CS16311_CMD3 | (physical_pos * 3u));
1626  02ef 7b01          	ld	a,(OFST+0,sp)
1627  02f1 97            	ld	xl,a
1628  02f2 a603          	ld	a,#3
1629  02f4 42            	mul	x,a
1630  02f5 9f            	ld	a,xl
1631  02f6 aac0          	or	a,#192
1632  02f8 cd0188        	call	L362_cs16311_shift_out
1634                     ; 205     cs16311_shift_out((uint8_t)segments);
1636  02fb 7b08          	ld	a,(OFST+7,sp)
1637  02fd cd0188        	call	L362_cs16311_shift_out
1639                     ; 206     cs16311_shift_out((uint8_t)(segments >> 8));
1641  0300 7b07          	ld	a,(OFST+6,sp)
1642  0302 cd0188        	call	L362_cs16311_shift_out
1644                     ; 207     cs16311_shift_out((uint8_t)(segments >> 16));
1646  0305 7b06          	ld	a,(OFST+5,sp)
1647  0307 cd0188        	call	L362_cs16311_shift_out
1649                     ; 208     cs16311_stop();
1651  030a cd0178        	call	L152_cs16311_stop
1653                     ; 209 }
1656  030d 85            	popw	x
1657  030e 81            	ret
1721                     ; 211 void cs16311_write_char(uint8_t logical_digit, char chr)
1721                     ; 212 {
1722                     	switch	.text
1723  030f               _cs16311_write_char:
1725  030f 89            	pushw	x
1726  0310 89            	pushw	x
1727       00000002      OFST:	set	2
1730                     ; 214 		unconverted = cs16311_font(chr);   
1732  0311 9f            	ld	a,xl
1733  0312 cd0000        	call	_cs16311_font
1735  0315 1f01          	ldw	(OFST-1,sp),x
1737                     ; 215     converted = cs16311_convert(unconverted);        
1739  0317 1e01          	ldw	x,(OFST-1,sp)
1740  0319 cd00cc        	call	L761_cs16311_convert
1742  031c 1f01          	ldw	(OFST-1,sp),x
1744                     ; 216     cs16311_write_digit(logical_digit, converted);            
1746  031e 1e01          	ldw	x,(OFST-1,sp)
1747  0320 cd0000        	call	c_uitolx
1749  0323 be02          	ldw	x,c_lreg+2
1750  0325 89            	pushw	x
1751  0326 be00          	ldw	x,c_lreg
1752  0328 89            	pushw	x
1753  0329 7b07          	ld	a,(OFST+5,sp)
1754  032b adb6          	call	_cs16311_write_digit
1756  032d 5b04          	addw	sp,#4
1757                     ; 217 }
1760  032f 5b04          	addw	sp,#4
1761  0331 81            	ret
1808                     ; 219 void cs16311_write_string(const char *str)
1808                     ; 220 {
1809                     	switch	.text
1810  0332               _cs16311_write_string:
1812  0332 89            	pushw	x
1813  0333 88            	push	a
1814       00000001      OFST:	set	1
1817                     ; 221     uint8_t i = 0;
1819  0334 0f01          	clr	(OFST+0,sp)
1822  0336 2012          	jra	L536
1823  0338               L136:
1824                     ; 225         cs16311_write_char(i, *str);
1826  0338 1e02          	ldw	x,(OFST+1,sp)
1827  033a f6            	ld	a,(x)
1828  033b 97            	ld	xl,a
1829  033c 7b01          	ld	a,(OFST+0,sp)
1830  033e 95            	ld	xh,a
1831  033f adce          	call	_cs16311_write_char
1833                     ; 226         str++;
1835  0341 1e02          	ldw	x,(OFST+1,sp)
1836  0343 1c0001        	addw	x,#1
1837  0346 1f02          	ldw	(OFST+1,sp),x
1838                     ; 227         i++;
1840  0348 0c01          	inc	(OFST+0,sp)
1842  034a               L536:
1843                     ; 223     while (*str && i < cs16311_num_digits)
1845  034a 1e02          	ldw	x,(OFST+1,sp)
1846  034c 7d            	tnz	(x)
1847  034d 2706          	jreq	L146
1849  034f 7b01          	ld	a,(OFST+0,sp)
1850  0351 b100          	cp	a,_cs16311_num_digits
1851  0353 25e3          	jrult	L136
1852  0355               L146:
1853                     ; 229 }
1856  0355 5b03          	addw	sp,#3
1857  0357 81            	ret
1921                     ; 231 void cs16311_write_int(int value,uint8_t digit_pos)
1921                     ; 232 {
1922                     	switch	.text
1923  0358               _cs16311_write_int:
1925  0358 89            	pushw	x
1926  0359 520b          	subw	sp,#11
1927       0000000b      OFST:	set	11
1930                     ; 234     uint8_t i = 0;
1932  035b 0f0b          	clr	(OFST+0,sp)
1934                     ; 242     if (value < 0)
1936  035d 9c            	rvf
1937  035e a30000        	cpw	x,#0
1938  0361 2e3f          	jrsge	L107
1939                     ; 244         cs16311_write_char(digit_pos, '-');
1941  0363 7b10          	ld	a,(OFST+5,sp)
1942  0365 ae002d        	ldw	x,#45
1943  0368 95            	ld	xh,a
1944  0369 ada4          	call	_cs16311_write_char
1946                     ; 245         value = -value;
1948  036b 1e0c          	ldw	x,(OFST+1,sp)
1949  036d 50            	negw	x
1950  036e 1f0c          	ldw	(OFST+1,sp),x
1951                     ; 246         digit_pos++;
1953  0370 0c10          	inc	(OFST+5,sp)
1954  0372 202e          	jra	L107
1955  0374               L776:
1956                     ; 251         buf[i++] = (value % 10) + '0';
1958  0374 1e0c          	ldw	x,(OFST+1,sp)
1959  0376 a60a          	ld	a,#10
1960  0378 cd0000        	call	c_smodx
1962  037b 1c0030        	addw	x,#48
1963  037e 9096          	ldw	y,sp
1964  0380 72a90003      	addw	y,#OFST-8
1965  0384 1701          	ldw	(OFST-10,sp),y
1967  0386 7b0b          	ld	a,(OFST+0,sp)
1968  0388 9097          	ld	yl,a
1969  038a 0c0b          	inc	(OFST+0,sp)
1971  038c 909f          	ld	a,yl
1972  038e 905f          	clrw	y
1973  0390 9097          	ld	yl,a
1974  0392 72f901        	addw	y,(OFST-10,sp)
1975  0395 01            	rrwa	x,a
1976  0396 90f7          	ld	(y),a
1977  0398 02            	rlwa	x,a
1978                     ; 252         value /= 10;
1980  0399 1e0c          	ldw	x,(OFST+1,sp)
1981  039b a60a          	ld	a,#10
1982  039d cd0000        	call	c_sdivx
1984  03a0 1f0c          	ldw	(OFST+1,sp),x
1985  03a2               L107:
1986                     ; 249     while (value > 0 && i < sizeof(buf))
1988  03a2 9c            	rvf
1989  03a3 1e0c          	ldw	x,(OFST+1,sp)
1990  03a5 2d21          	jrsle	L117
1992  03a7 7b0b          	ld	a,(OFST+0,sp)
1993  03a9 a108          	cp	a,#8
1994  03ab 25c7          	jrult	L776
1995  03ad 2019          	jra	L117
1996  03af               L707:
1997                     ; 257         cs16311_write_char(digit_pos++, buf[--i]);
1999  03af 96            	ldw	x,sp
2000  03b0 1c0003        	addw	x,#OFST-8
2001  03b3 1f01          	ldw	(OFST-10,sp),x
2003  03b5 0a0b          	dec	(OFST+0,sp)
2005  03b7 7b0b          	ld	a,(OFST+0,sp)
2006  03b9 5f            	clrw	x
2007  03ba 97            	ld	xl,a
2008  03bb 72fb01        	addw	x,(OFST-10,sp)
2009  03be f6            	ld	a,(x)
2010  03bf 97            	ld	xl,a
2011  03c0 7b10          	ld	a,(OFST+5,sp)
2012  03c2 0c10          	inc	(OFST+5,sp)
2013  03c4 95            	ld	xh,a
2014  03c5 cd030f        	call	_cs16311_write_char
2016  03c8               L117:
2017                     ; 255     while (i > 0 && digit_pos < cs16311_num_digits)
2019  03c8 0d0b          	tnz	(OFST+0,sp)
2020  03ca 2706          	jreq	L517
2022  03cc 7b10          	ld	a,(OFST+5,sp)
2023  03ce b100          	cp	a,_cs16311_num_digits
2024  03d0 25dd          	jrult	L707
2025  03d2               L517:
2026                     ; 259 }
2029  03d2 5b0d          	addw	sp,#13
2030  03d4 81            	ret
2068                     ; 261 uint8_t cs16311_read_sw(void)
2068                     ; 262 {
2069                     	switch	.text
2070  03d5               _cs16311_read_sw:
2072  03d5 88            	push	a
2073       00000001      OFST:	set	1
2076                     ; 263     uint8_t sw = 0;
2078                     ; 264     cs16311_start();
2080  03d6 cd0168        	call	L732_cs16311_start
2082                     ; 265     cs16311_shift_out(CS16311_CMD2 | 0b00000011);
2084  03d9 a643          	ld	a,#67
2085  03db cd0188        	call	L362_cs16311_shift_out
2087                     ; 266     cs16311_stop();
2089  03de cd0178        	call	L152_cs16311_stop
2091                     ; 268     cs16311_start();
2093  03e1 cd0168        	call	L732_cs16311_start
2095                     ; 269     sw = cs16311_shift_in() & 0x0F;
2097  03e4 cd01d0        	call	L123_cs16311_shift_in
2099  03e7 a40f          	and	a,#15
2100  03e9 6b01          	ld	(OFST+0,sp),a
2102                     ; 270     cs16311_stop();
2104  03eb cd0178        	call	L152_cs16311_stop
2106                     ; 272     return sw;
2108  03ee 7b01          	ld	a,(OFST+0,sp)
2111  03f0 5b01          	addw	sp,#1
2112  03f2 81            	ret
2156                     	xdef	_cs16311_font
2157                     	xdef	_set_state
2158                     	xdef	_set_brightness
2159                     	switch	.ubsct
2160  0000               _cs16311_num_digits:
2161  0000 00            	ds.b	1
2162                     	xdef	_cs16311_num_digits
2163                     	xdef	_cs16311_read_sw
2164                     	xdef	_cs16311_setup_io
2165                     	xdef	_cs16311_write_digit
2166                     	xdef	_cs16311_write_int
2167                     	xdef	_cs16311_write_string
2168                     	xdef	_cs16311_write_char
2169                     	xdef	_cs16311_set_display_state
2170                     	xdef	_cs16311_set_brightness
2171                     	xdef	_cs16311_init
2172                     	xref	_GPIO_ReadInputPin
2173                     	xref	_GPIO_WriteLow
2174                     	xref	_GPIO_WriteHigh
2175                     	xref	_GPIO_Init
2176                     	xref	_delay_ms
2177                     	xref	_delay_us
2178                     	xref.b	c_lreg
2179                     	xref.b	c_x
2199                     	xref	c_sdivx
2200                     	xref	c_smodx
2201                     	xref	c_uitolx
2202                     	end
