   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.3 - 22 May 2025
   3                     ; Generator (Limited) V4.6.6 - 07 Jan 2026
  43                     ; 53 void UART1_DeInit(void)
  43                     ; 54 {
  45                     .text:	section	.text,new
  46  0000               _UART1_DeInit:
  50                     ; 57   (void)UART1->SR;
  52  0000 c65230        	ld	a,21040
  53                     ; 58   (void)UART1->DR;
  55  0003 c65231        	ld	a,21041
  56                     ; 60   UART1->BRR2 = UART1_BRR2_RESET_VALUE;  /* Set UART1_BRR2 to reset value 0x00 */
  58  0006 725f5233      	clr	21043
  59                     ; 61   UART1->BRR1 = UART1_BRR1_RESET_VALUE;  /* Set UART1_BRR1 to reset value 0x00 */
  61  000a 725f5232      	clr	21042
  62                     ; 63   UART1->CR1 = UART1_CR1_RESET_VALUE;  /* Set UART1_CR1 to reset value 0x00 */
  64  000e 725f5234      	clr	21044
  65                     ; 64   UART1->CR2 = UART1_CR2_RESET_VALUE;  /* Set UART1_CR2 to reset value 0x00 */
  67  0012 725f5235      	clr	21045
  68                     ; 65   UART1->CR3 = UART1_CR3_RESET_VALUE;  /* Set UART1_CR3 to reset value 0x00 */
  70  0016 725f5236      	clr	21046
  71                     ; 66   UART1->CR4 = UART1_CR4_RESET_VALUE;  /* Set UART1_CR4 to reset value 0x00 */
  73  001a 725f5237      	clr	21047
  74                     ; 67   UART1->CR5 = UART1_CR5_RESET_VALUE;  /* Set UART1_CR5 to reset value 0x00 */
  76  001e 725f5238      	clr	21048
  77                     ; 69   UART1->GTR = UART1_GTR_RESET_VALUE;
  79  0022 725f5239      	clr	21049
  80                     ; 70   UART1->PSCR = UART1_PSCR_RESET_VALUE;
  82  0026 725f523a      	clr	21050
  83                     ; 71 }
  86  002a 81            	ret
 389                     .const:	section	.text
 390  0000               L01:
 391  0000 00000064      	dc.l	100
 392                     ; 90 void UART1_Init(uint32_t BaudRate, UART1_WordLength_TypeDef WordLength, 
 392                     ; 91                 UART1_StopBits_TypeDef StopBits, UART1_Parity_TypeDef Parity, 
 392                     ; 92                 UART1_SyncMode_TypeDef SyncMode, UART1_Mode_TypeDef Mode)
 392                     ; 93 {
 393                     .text:	section	.text,new
 394  0000               _UART1_Init:
 396  0000 520c          	subw	sp,#12
 397       0000000c      OFST:	set	12
 400                     ; 94   uint32_t BaudRate_Mantissa = 0, BaudRate_Mantissa100 = 0;
 404                     ; 97   assert_param(IS_UART1_BAUDRATE_OK(BaudRate));
 406                     ; 98   assert_param(IS_UART1_WORDLENGTH_OK(WordLength));
 408                     ; 99   assert_param(IS_UART1_STOPBITS_OK(StopBits));
 410                     ; 100   assert_param(IS_UART1_PARITY_OK(Parity));
 412                     ; 101   assert_param(IS_UART1_MODE_OK((uint8_t)Mode));
 414                     ; 102   assert_param(IS_UART1_SYNCMODE_OK((uint8_t)SyncMode));
 416                     ; 105   UART1->CR1 &= (uint8_t)(~UART1_CR1_M);  
 418  0002 72195234      	bres	21044,#4
 419                     ; 108   UART1->CR1 |= (uint8_t)WordLength;
 421  0006 c65234        	ld	a,21044
 422  0009 1a13          	or	a,(OFST+7,sp)
 423  000b c75234        	ld	21044,a
 424                     ; 111   UART1->CR3 &= (uint8_t)(~UART1_CR3_STOP);  
 426  000e c65236        	ld	a,21046
 427  0011 a4cf          	and	a,#207
 428  0013 c75236        	ld	21046,a
 429                     ; 113   UART1->CR3 |= (uint8_t)StopBits;  
 431  0016 c65236        	ld	a,21046
 432  0019 1a14          	or	a,(OFST+8,sp)
 433  001b c75236        	ld	21046,a
 434                     ; 116   UART1->CR1 &= (uint8_t)(~(UART1_CR1_PCEN | UART1_CR1_PS  ));  
 436  001e c65234        	ld	a,21044
 437  0021 a4f9          	and	a,#249
 438  0023 c75234        	ld	21044,a
 439                     ; 118   UART1->CR1 |= (uint8_t)Parity;  
 441  0026 c65234        	ld	a,21044
 442  0029 1a15          	or	a,(OFST+9,sp)
 443  002b c75234        	ld	21044,a
 444                     ; 121   UART1->BRR1 &= (uint8_t)(~UART1_BRR1_DIVM);  
 446  002e 725f5232      	clr	21042
 447                     ; 123   UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVM);  
 449  0032 c65233        	ld	a,21043
 450  0035 a40f          	and	a,#15
 451  0037 c75233        	ld	21043,a
 452                     ; 125   UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVF);  
 454  003a c65233        	ld	a,21043
 455  003d a4f0          	and	a,#240
 456  003f c75233        	ld	21043,a
 457                     ; 128   BaudRate_Mantissa    = ((uint32_t)CLK_GetClockFreq() / (BaudRate << 4));
 459  0042 96            	ldw	x,sp
 460  0043 1c000f        	addw	x,#OFST+3
 461  0046 cd0000        	call	c_ltor
 463  0049 a604          	ld	a,#4
 464  004b cd0000        	call	c_llsh
 466  004e 96            	ldw	x,sp
 467  004f 1c0001        	addw	x,#OFST-11
 468  0052 cd0000        	call	c_rtol
 471  0055 cd0000        	call	_CLK_GetClockFreq
 473  0058 96            	ldw	x,sp
 474  0059 1c0001        	addw	x,#OFST-11
 475  005c cd0000        	call	c_ludv
 477  005f 96            	ldw	x,sp
 478  0060 1c0009        	addw	x,#OFST-3
 479  0063 cd0000        	call	c_rtol
 482                     ; 129   BaudRate_Mantissa100 = (((uint32_t)CLK_GetClockFreq() * 100) / (BaudRate << 4));
 484  0066 96            	ldw	x,sp
 485  0067 1c000f        	addw	x,#OFST+3
 486  006a cd0000        	call	c_ltor
 488  006d a604          	ld	a,#4
 489  006f cd0000        	call	c_llsh
 491  0072 96            	ldw	x,sp
 492  0073 1c0001        	addw	x,#OFST-11
 493  0076 cd0000        	call	c_rtol
 496  0079 cd0000        	call	_CLK_GetClockFreq
 498  007c a664          	ld	a,#100
 499  007e cd0000        	call	c_smul
 501  0081 96            	ldw	x,sp
 502  0082 1c0001        	addw	x,#OFST-11
 503  0085 cd0000        	call	c_ludv
 505  0088 96            	ldw	x,sp
 506  0089 1c0005        	addw	x,#OFST-7
 507  008c cd0000        	call	c_rtol
 510                     ; 131   UART1->BRR2 |= (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100)) << 4) / 100) & (uint8_t)0x0F); 
 512  008f 96            	ldw	x,sp
 513  0090 1c0009        	addw	x,#OFST-3
 514  0093 cd0000        	call	c_ltor
 516  0096 a664          	ld	a,#100
 517  0098 cd0000        	call	c_smul
 519  009b 96            	ldw	x,sp
 520  009c 1c0001        	addw	x,#OFST-11
 521  009f cd0000        	call	c_rtol
 524  00a2 96            	ldw	x,sp
 525  00a3 1c0005        	addw	x,#OFST-7
 526  00a6 cd0000        	call	c_ltor
 528  00a9 96            	ldw	x,sp
 529  00aa 1c0001        	addw	x,#OFST-11
 530  00ad cd0000        	call	c_lsub
 532  00b0 a604          	ld	a,#4
 533  00b2 cd0000        	call	c_llsh
 535  00b5 ae0000        	ldw	x,#L01
 536  00b8 cd0000        	call	c_ludv
 538  00bb b603          	ld	a,c_lreg+3
 539  00bd a40f          	and	a,#15
 540  00bf ca5233        	or	a,21043
 541  00c2 c75233        	ld	21043,a
 542                     ; 133   UART1->BRR2 |= (uint8_t)((BaudRate_Mantissa >> 4) & (uint8_t)0xF0); 
 544  00c5 1e0b          	ldw	x,(OFST-1,sp)
 545  00c7 54            	srlw	x
 546  00c8 54            	srlw	x
 547  00c9 54            	srlw	x
 548  00ca 54            	srlw	x
 549  00cb 01            	rrwa	x,a
 550  00cc a4f0          	and	a,#240
 551  00ce 5f            	clrw	x
 552  00cf ca5233        	or	a,21043
 553  00d2 c75233        	ld	21043,a
 554                     ; 135   UART1->BRR1 |= (uint8_t)BaudRate_Mantissa;           
 556  00d5 c65232        	ld	a,21042
 557  00d8 1a0c          	or	a,(OFST+0,sp)
 558  00da c75232        	ld	21042,a
 559                     ; 138   UART1->CR2 &= (uint8_t)~(UART1_CR2_TEN | UART1_CR2_REN); 
 561  00dd c65235        	ld	a,21045
 562  00e0 a4f3          	and	a,#243
 563  00e2 c75235        	ld	21045,a
 564                     ; 140   UART1->CR3 &= (uint8_t)~(UART1_CR3_CPOL | UART1_CR3_CPHA | UART1_CR3_LBCL); 
 566  00e5 c65236        	ld	a,21046
 567  00e8 a4f8          	and	a,#248
 568  00ea c75236        	ld	21046,a
 569                     ; 142   UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & (uint8_t)(UART1_CR3_CPOL | 
 569                     ; 143                                                         UART1_CR3_CPHA | UART1_CR3_LBCL));  
 571  00ed 7b16          	ld	a,(OFST+10,sp)
 572  00ef a407          	and	a,#7
 573  00f1 ca5236        	or	a,21046
 574  00f4 c75236        	ld	21046,a
 575                     ; 145   if ((uint8_t)(Mode & UART1_MODE_TX_ENABLE))
 577  00f7 7b17          	ld	a,(OFST+11,sp)
 578  00f9 a504          	bcp	a,#4
 579  00fb 2706          	jreq	L371
 580                     ; 148     UART1->CR2 |= (uint8_t)UART1_CR2_TEN;  
 582  00fd 72165235      	bset	21045,#3
 584  0101 2004          	jra	L571
 585  0103               L371:
 586                     ; 153     UART1->CR2 &= (uint8_t)(~UART1_CR2_TEN);  
 588  0103 72175235      	bres	21045,#3
 589  0107               L571:
 590                     ; 155   if ((uint8_t)(Mode & UART1_MODE_RX_ENABLE))
 592  0107 7b17          	ld	a,(OFST+11,sp)
 593  0109 a508          	bcp	a,#8
 594  010b 2706          	jreq	L771
 595                     ; 158     UART1->CR2 |= (uint8_t)UART1_CR2_REN;  
 597  010d 72145235      	bset	21045,#2
 599  0111 2004          	jra	L102
 600  0113               L771:
 601                     ; 163     UART1->CR2 &= (uint8_t)(~UART1_CR2_REN);  
 603  0113 72155235      	bres	21045,#2
 604  0117               L102:
 605                     ; 167   if ((uint8_t)(SyncMode & UART1_SYNCMODE_CLOCK_DISABLE))
 607  0117 7b16          	ld	a,(OFST+10,sp)
 608  0119 a580          	bcp	a,#128
 609  011b 2706          	jreq	L302
 610                     ; 170     UART1->CR3 &= (uint8_t)(~UART1_CR3_CKEN); 
 612  011d 72175236      	bres	21046,#3
 614  0121 200a          	jra	L502
 615  0123               L302:
 616                     ; 174     UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & UART1_CR3_CKEN);
 618  0123 7b16          	ld	a,(OFST+10,sp)
 619  0125 a408          	and	a,#8
 620  0127 ca5236        	or	a,21046
 621  012a c75236        	ld	21046,a
 622  012d               L502:
 623                     ; 176 }
 626  012d 5b0c          	addw	sp,#12
 627  012f 81            	ret
 682                     ; 184 void UART1_Cmd(FunctionalState NewState)
 682                     ; 185 {
 683                     .text:	section	.text,new
 684  0000               _UART1_Cmd:
 688                     ; 186   if (NewState != DISABLE)
 690  0000 4d            	tnz	a
 691  0001 2706          	jreq	L532
 692                     ; 189     UART1->CR1 &= (uint8_t)(~UART1_CR1_UARTD); 
 694  0003 721b5234      	bres	21044,#5
 696  0007 2004          	jra	L732
 697  0009               L532:
 698                     ; 194     UART1->CR1 |= UART1_CR1_UARTD;  
 700  0009 721a5234      	bset	21044,#5
 701  000d               L732:
 702                     ; 196 }
 705  000d 81            	ret
 830                     ; 211 void UART1_ITConfig(UART1_IT_TypeDef UART1_IT, FunctionalState NewState)
 830                     ; 212 {
 831                     .text:	section	.text,new
 832  0000               _UART1_ITConfig:
 834  0000 89            	pushw	x
 835  0001 89            	pushw	x
 836       00000002      OFST:	set	2
 839                     ; 213   uint8_t uartreg = 0, itpos = 0x00;
 843                     ; 216   assert_param(IS_UART1_CONFIG_IT_OK(UART1_IT));
 845                     ; 217   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 847                     ; 220   uartreg = (uint8_t)((uint16_t)UART1_IT >> 0x08);
 849  0002 9e            	ld	a,xh
 850  0003 6b01          	ld	(OFST-1,sp),a
 852                     ; 222   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
 854  0005 9f            	ld	a,xl
 855  0006 a40f          	and	a,#15
 856  0008 5f            	clrw	x
 857  0009 97            	ld	xl,a
 858  000a a601          	ld	a,#1
 859  000c 5d            	tnzw	x
 860  000d 2704          	jreq	L61
 861  000f               L02:
 862  000f 48            	sll	a
 863  0010 5a            	decw	x
 864  0011 26fc          	jrne	L02
 865  0013               L61:
 866  0013 6b02          	ld	(OFST+0,sp),a
 868                     ; 224   if (NewState != DISABLE)
 870  0015 0d07          	tnz	(OFST+5,sp)
 871  0017 272a          	jreq	L713
 872                     ; 227     if (uartreg == 0x01)
 874  0019 7b01          	ld	a,(OFST-1,sp)
 875  001b a101          	cp	a,#1
 876  001d 260a          	jrne	L123
 877                     ; 229       UART1->CR1 |= itpos;
 879  001f c65234        	ld	a,21044
 880  0022 1a02          	or	a,(OFST+0,sp)
 881  0024 c75234        	ld	21044,a
 883  0027 2045          	jra	L133
 884  0029               L123:
 885                     ; 231     else if (uartreg == 0x02)
 887  0029 7b01          	ld	a,(OFST-1,sp)
 888  002b a102          	cp	a,#2
 889  002d 260a          	jrne	L523
 890                     ; 233       UART1->CR2 |= itpos;
 892  002f c65235        	ld	a,21045
 893  0032 1a02          	or	a,(OFST+0,sp)
 894  0034 c75235        	ld	21045,a
 896  0037 2035          	jra	L133
 897  0039               L523:
 898                     ; 237       UART1->CR4 |= itpos;
 900  0039 c65237        	ld	a,21047
 901  003c 1a02          	or	a,(OFST+0,sp)
 902  003e c75237        	ld	21047,a
 903  0041 202b          	jra	L133
 904  0043               L713:
 905                     ; 243     if (uartreg == 0x01)
 907  0043 7b01          	ld	a,(OFST-1,sp)
 908  0045 a101          	cp	a,#1
 909  0047 260b          	jrne	L333
 910                     ; 245       UART1->CR1 &= (uint8_t)(~itpos);
 912  0049 7b02          	ld	a,(OFST+0,sp)
 913  004b 43            	cpl	a
 914  004c c45234        	and	a,21044
 915  004f c75234        	ld	21044,a
 917  0052 201a          	jra	L133
 918  0054               L333:
 919                     ; 247     else if (uartreg == 0x02)
 921  0054 7b01          	ld	a,(OFST-1,sp)
 922  0056 a102          	cp	a,#2
 923  0058 260b          	jrne	L733
 924                     ; 249       UART1->CR2 &= (uint8_t)(~itpos);
 926  005a 7b02          	ld	a,(OFST+0,sp)
 927  005c 43            	cpl	a
 928  005d c45235        	and	a,21045
 929  0060 c75235        	ld	21045,a
 931  0063 2009          	jra	L133
 932  0065               L733:
 933                     ; 253       UART1->CR4 &= (uint8_t)(~itpos);
 935  0065 7b02          	ld	a,(OFST+0,sp)
 936  0067 43            	cpl	a
 937  0068 c45237        	and	a,21047
 938  006b c75237        	ld	21047,a
 939  006e               L133:
 940                     ; 257 }
 943  006e 5b04          	addw	sp,#4
 944  0070 81            	ret
 980                     ; 265 void UART1_HalfDuplexCmd(FunctionalState NewState)
 980                     ; 266 {
 981                     .text:	section	.text,new
 982  0000               _UART1_HalfDuplexCmd:
 986                     ; 267   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 988                     ; 269   if (NewState != DISABLE)
 990  0000 4d            	tnz	a
 991  0001 2706          	jreq	L163
 992                     ; 271     UART1->CR5 |= UART1_CR5_HDSEL;  /**< UART1 Half Duplex Enable  */
 994  0003 72165238      	bset	21048,#3
 996  0007 2004          	jra	L363
 997  0009               L163:
 998                     ; 275     UART1->CR5 &= (uint8_t)~UART1_CR5_HDSEL; /**< UART1 Half Duplex Disable */
1000  0009 72175238      	bres	21048,#3
1001  000d               L363:
1002                     ; 277 }
1005  000d 81            	ret
1062                     ; 285 void UART1_IrDAConfig(UART1_IrDAMode_TypeDef UART1_IrDAMode)
1062                     ; 286 {
1063                     .text:	section	.text,new
1064  0000               _UART1_IrDAConfig:
1068                     ; 287   assert_param(IS_UART1_IRDAMODE_OK(UART1_IrDAMode));
1070                     ; 289   if (UART1_IrDAMode != UART1_IRDAMODE_NORMAL)
1072  0000 4d            	tnz	a
1073  0001 2706          	jreq	L314
1074                     ; 291     UART1->CR5 |= UART1_CR5_IRLP;
1076  0003 72145238      	bset	21048,#2
1078  0007 2004          	jra	L514
1079  0009               L314:
1080                     ; 295     UART1->CR5 &= ((uint8_t)~UART1_CR5_IRLP);
1082  0009 72155238      	bres	21048,#2
1083  000d               L514:
1084                     ; 297 }
1087  000d 81            	ret
1122                     ; 305 void UART1_IrDACmd(FunctionalState NewState)
1122                     ; 306 {
1123                     .text:	section	.text,new
1124  0000               _UART1_IrDACmd:
1128                     ; 308   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1130                     ; 310   if (NewState != DISABLE)
1132  0000 4d            	tnz	a
1133  0001 2706          	jreq	L534
1134                     ; 313     UART1->CR5 |= UART1_CR5_IREN;
1136  0003 72125238      	bset	21048,#1
1138  0007 2004          	jra	L734
1139  0009               L534:
1140                     ; 318     UART1->CR5 &= ((uint8_t)~UART1_CR5_IREN);
1142  0009 72135238      	bres	21048,#1
1143  000d               L734:
1144                     ; 320 }
1147  000d 81            	ret
1206                     ; 329 void UART1_LINBreakDetectionConfig(UART1_LINBreakDetectionLength_TypeDef UART1_LINBreakDetectionLength)
1206                     ; 330 {
1207                     .text:	section	.text,new
1208  0000               _UART1_LINBreakDetectionConfig:
1212                     ; 331   assert_param(IS_UART1_LINBREAKDETECTIONLENGTH_OK(UART1_LINBreakDetectionLength));
1214                     ; 333   if (UART1_LINBreakDetectionLength != UART1_LINBREAKDETECTIONLENGTH_10BITS)
1216  0000 4d            	tnz	a
1217  0001 2706          	jreq	L764
1218                     ; 335     UART1->CR4 |= UART1_CR4_LBDL;
1220  0003 721a5237      	bset	21047,#5
1222  0007 2004          	jra	L174
1223  0009               L764:
1224                     ; 339     UART1->CR4 &= ((uint8_t)~UART1_CR4_LBDL);
1226  0009 721b5237      	bres	21047,#5
1227  000d               L174:
1228                     ; 341 }
1231  000d 81            	ret
1266                     ; 349 void UART1_LINCmd(FunctionalState NewState)
1266                     ; 350 {
1267                     .text:	section	.text,new
1268  0000               _UART1_LINCmd:
1272                     ; 351   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1274                     ; 353   if (NewState != DISABLE)
1276  0000 4d            	tnz	a
1277  0001 2706          	jreq	L115
1278                     ; 356     UART1->CR3 |= UART1_CR3_LINEN;
1280  0003 721c5236      	bset	21046,#6
1282  0007 2004          	jra	L315
1283  0009               L115:
1284                     ; 361     UART1->CR3 &= ((uint8_t)~UART1_CR3_LINEN);
1286  0009 721d5236      	bres	21046,#6
1287  000d               L315:
1288                     ; 363 }
1291  000d 81            	ret
1326                     ; 371 void UART1_SmartCardCmd(FunctionalState NewState)
1326                     ; 372 {
1327                     .text:	section	.text,new
1328  0000               _UART1_SmartCardCmd:
1332                     ; 373   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1334                     ; 375   if (NewState != DISABLE)
1336  0000 4d            	tnz	a
1337  0001 2706          	jreq	L335
1338                     ; 378     UART1->CR5 |= UART1_CR5_SCEN;
1340  0003 721a5238      	bset	21048,#5
1342  0007 2004          	jra	L535
1343  0009               L335:
1344                     ; 383     UART1->CR5 &= ((uint8_t)(~UART1_CR5_SCEN));
1346  0009 721b5238      	bres	21048,#5
1347  000d               L535:
1348                     ; 385 }
1351  000d 81            	ret
1387                     ; 394 void UART1_SmartCardNACKCmd(FunctionalState NewState)
1387                     ; 395 {
1388                     .text:	section	.text,new
1389  0000               _UART1_SmartCardNACKCmd:
1393                     ; 396   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1395                     ; 398   if (NewState != DISABLE)
1397  0000 4d            	tnz	a
1398  0001 2706          	jreq	L555
1399                     ; 401     UART1->CR5 |= UART1_CR5_NACK;
1401  0003 72185238      	bset	21048,#4
1403  0007 2004          	jra	L755
1404  0009               L555:
1405                     ; 406     UART1->CR5 &= ((uint8_t)~(UART1_CR5_NACK));
1407  0009 72195238      	bres	21048,#4
1408  000d               L755:
1409                     ; 408 }
1412  000d 81            	ret
1469                     ; 416 void UART1_WakeUpConfig(UART1_WakeUp_TypeDef UART1_WakeUp)
1469                     ; 417 {
1470                     .text:	section	.text,new
1471  0000               _UART1_WakeUpConfig:
1475                     ; 418   assert_param(IS_UART1_WAKEUP_OK(UART1_WakeUp));
1477                     ; 420   UART1->CR1 &= ((uint8_t)~UART1_CR1_WAKE);
1479  0000 72175234      	bres	21044,#3
1480                     ; 421   UART1->CR1 |= (uint8_t)UART1_WakeUp;
1482  0004 ca5234        	or	a,21044
1483  0007 c75234        	ld	21044,a
1484                     ; 422 }
1487  000a 81            	ret
1523                     ; 430 void UART1_ReceiverWakeUpCmd(FunctionalState NewState)
1523                     ; 431 {
1524                     .text:	section	.text,new
1525  0000               _UART1_ReceiverWakeUpCmd:
1529                     ; 432   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1531                     ; 434   if (NewState != DISABLE)
1533  0000 4d            	tnz	a
1534  0001 2706          	jreq	L526
1535                     ; 437     UART1->CR2 |= UART1_CR2_RWU;
1537  0003 72125235      	bset	21045,#1
1539  0007 2004          	jra	L726
1540  0009               L526:
1541                     ; 442     UART1->CR2 &= ((uint8_t)~UART1_CR2_RWU);
1543  0009 72135235      	bres	21045,#1
1544  000d               L726:
1545                     ; 444 }
1548  000d 81            	ret
1571                     ; 451 uint8_t UART1_ReceiveData8(void)
1571                     ; 452 {
1572                     .text:	section	.text,new
1573  0000               _UART1_ReceiveData8:
1577                     ; 453   return ((uint8_t)UART1->DR);
1579  0000 c65231        	ld	a,21041
1582  0003 81            	ret
1616                     ; 461 uint16_t UART1_ReceiveData9(void)
1616                     ; 462 {
1617                     .text:	section	.text,new
1618  0000               _UART1_ReceiveData9:
1620  0000 89            	pushw	x
1621       00000002      OFST:	set	2
1624                     ; 463   uint16_t temp = 0;
1626                     ; 465   temp = (uint16_t)(((uint16_t)( (uint16_t)UART1->CR1 & (uint16_t)UART1_CR1_R8)) << 1);
1628  0001 c65234        	ld	a,21044
1629  0004 5f            	clrw	x
1630  0005 a480          	and	a,#128
1631  0007 5f            	clrw	x
1632  0008 02            	rlwa	x,a
1633  0009 58            	sllw	x
1634  000a 1f01          	ldw	(OFST-1,sp),x
1636                     ; 466   return (uint16_t)( (((uint16_t) UART1->DR) | temp ) & ((uint16_t)0x01FF));
1638  000c c65231        	ld	a,21041
1639  000f 5f            	clrw	x
1640  0010 97            	ld	xl,a
1641  0011 01            	rrwa	x,a
1642  0012 1a02          	or	a,(OFST+0,sp)
1643  0014 01            	rrwa	x,a
1644  0015 1a01          	or	a,(OFST-1,sp)
1645  0017 01            	rrwa	x,a
1646  0018 01            	rrwa	x,a
1647  0019 a4ff          	and	a,#255
1648  001b 01            	rrwa	x,a
1649  001c a401          	and	a,#1
1650  001e 01            	rrwa	x,a
1653  001f 5b02          	addw	sp,#2
1654  0021 81            	ret
1688                     ; 474 void UART1_SendData8(uint8_t Data)
1688                     ; 475 {
1689                     .text:	section	.text,new
1690  0000               _UART1_SendData8:
1694                     ; 477   UART1->DR = Data;
1696  0000 c75231        	ld	21041,a
1697                     ; 478 }
1700  0003 81            	ret
1734                     ; 486 void UART1_SendData9(uint16_t Data)
1734                     ; 487 {
1735                     .text:	section	.text,new
1736  0000               _UART1_SendData9:
1738  0000 89            	pushw	x
1739       00000000      OFST:	set	0
1742                     ; 489   UART1->CR1 &= ((uint8_t)~UART1_CR1_T8);
1744  0001 721d5234      	bres	21044,#6
1745                     ; 491   UART1->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & UART1_CR1_T8);
1747  0005 54            	srlw	x
1748  0006 54            	srlw	x
1749  0007 9f            	ld	a,xl
1750  0008 a440          	and	a,#64
1751  000a ca5234        	or	a,21044
1752  000d c75234        	ld	21044,a
1753                     ; 493   UART1->DR   = (uint8_t)(Data);
1755  0010 7b02          	ld	a,(OFST+2,sp)
1756  0012 c75231        	ld	21041,a
1757                     ; 494 }
1760  0015 85            	popw	x
1761  0016 81            	ret
1784                     ; 501 void UART1_SendBreak(void)
1784                     ; 502 {
1785                     .text:	section	.text,new
1786  0000               _UART1_SendBreak:
1790                     ; 503   UART1->CR2 |= UART1_CR2_SBK;
1792  0000 72105235      	bset	21045,#0
1793                     ; 504 }
1796  0004 81            	ret
1830                     ; 511 void UART1_SetAddress(uint8_t UART1_Address)
1830                     ; 512 {
1831                     .text:	section	.text,new
1832  0000               _UART1_SetAddress:
1834  0000 88            	push	a
1835       00000000      OFST:	set	0
1838                     ; 514   assert_param(IS_UART1_ADDRESS_OK(UART1_Address));
1840                     ; 517   UART1->CR4 &= ((uint8_t)~UART1_CR4_ADD);
1842  0001 c65237        	ld	a,21047
1843  0004 a4f0          	and	a,#240
1844  0006 c75237        	ld	21047,a
1845                     ; 519   UART1->CR4 |= UART1_Address;
1847  0009 c65237        	ld	a,21047
1848  000c 1a01          	or	a,(OFST+1,sp)
1849  000e c75237        	ld	21047,a
1850                     ; 520 }
1853  0011 84            	pop	a
1854  0012 81            	ret
1888                     ; 528 void UART1_SetGuardTime(uint8_t UART1_GuardTime)
1888                     ; 529 {
1889                     .text:	section	.text,new
1890  0000               _UART1_SetGuardTime:
1894                     ; 531   UART1->GTR = UART1_GuardTime;
1896  0000 c75239        	ld	21049,a
1897                     ; 532 }
1900  0003 81            	ret
1934                     ; 556 void UART1_SetPrescaler(uint8_t UART1_Prescaler)
1934                     ; 557 {
1935                     .text:	section	.text,new
1936  0000               _UART1_SetPrescaler:
1940                     ; 559   UART1->PSCR = UART1_Prescaler;
1942  0000 c7523a        	ld	21050,a
1943                     ; 560 }
1946  0003 81            	ret
2089                     ; 568 FlagStatus UART1_GetFlagStatus(UART1_Flag_TypeDef UART1_FLAG)
2089                     ; 569 {
2090                     .text:	section	.text,new
2091  0000               _UART1_GetFlagStatus:
2093  0000 89            	pushw	x
2094  0001 88            	push	a
2095       00000001      OFST:	set	1
2098                     ; 570   FlagStatus status = RESET;
2100                     ; 573   assert_param(IS_UART1_FLAG_OK(UART1_FLAG));
2102                     ; 577   if (UART1_FLAG == UART1_FLAG_LBDF)
2104  0002 a30210        	cpw	x,#528
2105  0005 2610          	jrne	L7501
2106                     ; 579     if ((UART1->CR4 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2108  0007 9f            	ld	a,xl
2109  0008 c45237        	and	a,21047
2110  000b 2706          	jreq	L1601
2111                     ; 582       status = SET;
2113  000d a601          	ld	a,#1
2114  000f 6b01          	ld	(OFST+0,sp),a
2117  0011 202b          	jra	L5601
2118  0013               L1601:
2119                     ; 587       status = RESET;
2121  0013 0f01          	clr	(OFST+0,sp)
2123  0015 2027          	jra	L5601
2124  0017               L7501:
2125                     ; 590   else if (UART1_FLAG == UART1_FLAG_SBK)
2127  0017 1e02          	ldw	x,(OFST+1,sp)
2128  0019 a30101        	cpw	x,#257
2129  001c 2611          	jrne	L7601
2130                     ; 592     if ((UART1->CR2 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2132  001e c65235        	ld	a,21045
2133  0021 1503          	bcp	a,(OFST+2,sp)
2134  0023 2706          	jreq	L1701
2135                     ; 595       status = SET;
2137  0025 a601          	ld	a,#1
2138  0027 6b01          	ld	(OFST+0,sp),a
2141  0029 2013          	jra	L5601
2142  002b               L1701:
2143                     ; 600       status = RESET;
2145  002b 0f01          	clr	(OFST+0,sp)
2147  002d 200f          	jra	L5601
2148  002f               L7601:
2149                     ; 605     if ((UART1->SR & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2151  002f c65230        	ld	a,21040
2152  0032 1503          	bcp	a,(OFST+2,sp)
2153  0034 2706          	jreq	L7701
2154                     ; 608       status = SET;
2156  0036 a601          	ld	a,#1
2157  0038 6b01          	ld	(OFST+0,sp),a
2160  003a 2002          	jra	L5601
2161  003c               L7701:
2162                     ; 613       status = RESET;
2164  003c 0f01          	clr	(OFST+0,sp)
2166  003e               L5601:
2167                     ; 617   return status;
2169  003e 7b01          	ld	a,(OFST+0,sp)
2172  0040 5b03          	addw	sp,#3
2173  0042 81            	ret
2208                     ; 646 void UART1_ClearFlag(UART1_Flag_TypeDef UART1_FLAG)
2208                     ; 647 {
2209                     .text:	section	.text,new
2210  0000               _UART1_ClearFlag:
2214                     ; 648   assert_param(IS_UART1_CLEAR_FLAG_OK(UART1_FLAG));
2216                     ; 651   if (UART1_FLAG == UART1_FLAG_RXNE)
2218  0000 a30020        	cpw	x,#32
2219  0003 2606          	jrne	L1211
2220                     ; 653     UART1->SR = (uint8_t)~(UART1_SR_RXNE);
2222  0005 35df5230      	mov	21040,#223
2224  0009 2004          	jra	L3211
2225  000b               L1211:
2226                     ; 658     UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
2228  000b 72195237      	bres	21047,#4
2229  000f               L3211:
2230                     ; 660 }
2233  000f 81            	ret
2315                     ; 675 ITStatus UART1_GetITStatus(UART1_IT_TypeDef UART1_IT)
2315                     ; 676 {
2316                     .text:	section	.text,new
2317  0000               _UART1_GetITStatus:
2319  0000 89            	pushw	x
2320  0001 89            	pushw	x
2321       00000002      OFST:	set	2
2324                     ; 677   ITStatus pendingbitstatus = RESET;
2326                     ; 678   uint8_t itpos = 0;
2328                     ; 679   uint8_t itmask1 = 0;
2330                     ; 680   uint8_t itmask2 = 0;
2332                     ; 681   uint8_t enablestatus = 0;
2334                     ; 684   assert_param(IS_UART1_GET_IT_OK(UART1_IT));
2336                     ; 687   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
2338  0002 9f            	ld	a,xl
2339  0003 a40f          	and	a,#15
2340  0005 5f            	clrw	x
2341  0006 97            	ld	xl,a
2342  0007 a601          	ld	a,#1
2343  0009 5d            	tnzw	x
2344  000a 2704          	jreq	L27
2345  000c               L47:
2346  000c 48            	sll	a
2347  000d 5a            	decw	x
2348  000e 26fc          	jrne	L47
2349  0010               L27:
2350  0010 6b01          	ld	(OFST-1,sp),a
2352                     ; 689   itmask1 = (uint8_t)((uint8_t)UART1_IT >> (uint8_t)4);
2354  0012 7b04          	ld	a,(OFST+2,sp)
2355  0014 4e            	swap	a
2356  0015 a40f          	and	a,#15
2357  0017 6b02          	ld	(OFST+0,sp),a
2359                     ; 691   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
2361  0019 7b02          	ld	a,(OFST+0,sp)
2362  001b 5f            	clrw	x
2363  001c 97            	ld	xl,a
2364  001d a601          	ld	a,#1
2365  001f 5d            	tnzw	x
2366  0020 2704          	jreq	L67
2367  0022               L001:
2368  0022 48            	sll	a
2369  0023 5a            	decw	x
2370  0024 26fc          	jrne	L001
2371  0026               L67:
2372  0026 6b02          	ld	(OFST+0,sp),a
2374                     ; 695   if (UART1_IT == UART1_IT_PE)
2376  0028 1e03          	ldw	x,(OFST+1,sp)
2377  002a a30100        	cpw	x,#256
2378  002d 261c          	jrne	L7611
2379                     ; 698     enablestatus = (uint8_t)((uint8_t)UART1->CR1 & itmask2);
2381  002f c65234        	ld	a,21044
2382  0032 1402          	and	a,(OFST+0,sp)
2383  0034 6b02          	ld	(OFST+0,sp),a
2385                     ; 701     if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
2387  0036 c65230        	ld	a,21040
2388  0039 1501          	bcp	a,(OFST-1,sp)
2389  003b 270a          	jreq	L1711
2391  003d 0d02          	tnz	(OFST+0,sp)
2392  003f 2706          	jreq	L1711
2393                     ; 704       pendingbitstatus = SET;
2395  0041 a601          	ld	a,#1
2396  0043 6b02          	ld	(OFST+0,sp),a
2399  0045 2041          	jra	L5711
2400  0047               L1711:
2401                     ; 709       pendingbitstatus = RESET;
2403  0047 0f02          	clr	(OFST+0,sp)
2405  0049 203d          	jra	L5711
2406  004b               L7611:
2407                     ; 713   else if (UART1_IT == UART1_IT_LBDF)
2409  004b 1e03          	ldw	x,(OFST+1,sp)
2410  004d a30346        	cpw	x,#838
2411  0050 261c          	jrne	L7711
2412                     ; 716     enablestatus = (uint8_t)((uint8_t)UART1->CR4 & itmask2);
2414  0052 c65237        	ld	a,21047
2415  0055 1402          	and	a,(OFST+0,sp)
2416  0057 6b02          	ld	(OFST+0,sp),a
2418                     ; 718     if (((UART1->CR4 & itpos) != (uint8_t)0x00) && enablestatus)
2420  0059 c65237        	ld	a,21047
2421  005c 1501          	bcp	a,(OFST-1,sp)
2422  005e 270a          	jreq	L1021
2424  0060 0d02          	tnz	(OFST+0,sp)
2425  0062 2706          	jreq	L1021
2426                     ; 721       pendingbitstatus = SET;
2428  0064 a601          	ld	a,#1
2429  0066 6b02          	ld	(OFST+0,sp),a
2432  0068 201e          	jra	L5711
2433  006a               L1021:
2434                     ; 726       pendingbitstatus = RESET;
2436  006a 0f02          	clr	(OFST+0,sp)
2438  006c 201a          	jra	L5711
2439  006e               L7711:
2440                     ; 732     enablestatus = (uint8_t)((uint8_t)UART1->CR2 & itmask2);
2442  006e c65235        	ld	a,21045
2443  0071 1402          	and	a,(OFST+0,sp)
2444  0073 6b02          	ld	(OFST+0,sp),a
2446                     ; 734     if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
2448  0075 c65230        	ld	a,21040
2449  0078 1501          	bcp	a,(OFST-1,sp)
2450  007a 270a          	jreq	L7021
2452  007c 0d02          	tnz	(OFST+0,sp)
2453  007e 2706          	jreq	L7021
2454                     ; 737       pendingbitstatus = SET;
2456  0080 a601          	ld	a,#1
2457  0082 6b02          	ld	(OFST+0,sp),a
2460  0084 2002          	jra	L5711
2461  0086               L7021:
2462                     ; 742       pendingbitstatus = RESET;
2464  0086 0f02          	clr	(OFST+0,sp)
2466  0088               L5711:
2467                     ; 747   return  pendingbitstatus;
2469  0088 7b02          	ld	a,(OFST+0,sp)
2472  008a 5b04          	addw	sp,#4
2473  008c 81            	ret
2509                     ; 775 void UART1_ClearITPendingBit(UART1_IT_TypeDef UART1_IT)
2509                     ; 776 {
2510                     .text:	section	.text,new
2511  0000               _UART1_ClearITPendingBit:
2515                     ; 777   assert_param(IS_UART1_CLEAR_IT_OK(UART1_IT));
2517                     ; 780   if (UART1_IT == UART1_IT_RXNE)
2519  0000 a30255        	cpw	x,#597
2520  0003 2606          	jrne	L1321
2521                     ; 782     UART1->SR = (uint8_t)~(UART1_SR_RXNE);
2523  0005 35df5230      	mov	21040,#223
2525  0009 2004          	jra	L3321
2526  000b               L1321:
2527                     ; 787     UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
2529  000b 72195237      	bres	21047,#4
2530  000f               L3321:
2531                     ; 789 }
2534  000f 81            	ret
2547                     	xdef	_UART1_ClearITPendingBit
2548                     	xdef	_UART1_GetITStatus
2549                     	xdef	_UART1_ClearFlag
2550                     	xdef	_UART1_GetFlagStatus
2551                     	xdef	_UART1_SetPrescaler
2552                     	xdef	_UART1_SetGuardTime
2553                     	xdef	_UART1_SetAddress
2554                     	xdef	_UART1_SendBreak
2555                     	xdef	_UART1_SendData9
2556                     	xdef	_UART1_SendData8
2557                     	xdef	_UART1_ReceiveData9
2558                     	xdef	_UART1_ReceiveData8
2559                     	xdef	_UART1_ReceiverWakeUpCmd
2560                     	xdef	_UART1_WakeUpConfig
2561                     	xdef	_UART1_SmartCardNACKCmd
2562                     	xdef	_UART1_SmartCardCmd
2563                     	xdef	_UART1_LINCmd
2564                     	xdef	_UART1_LINBreakDetectionConfig
2565                     	xdef	_UART1_IrDACmd
2566                     	xdef	_UART1_IrDAConfig
2567                     	xdef	_UART1_HalfDuplexCmd
2568                     	xdef	_UART1_ITConfig
2569                     	xdef	_UART1_Cmd
2570                     	xdef	_UART1_Init
2571                     	xdef	_UART1_DeInit
2572                     	xref	_CLK_GetClockFreq
2573                     	xref.b	c_lreg
2574                     	xref.b	c_x
2593                     	xref	c_lsub
2594                     	xref	c_smul
2595                     	xref	c_ludv
2596                     	xref	c_rtol
2597                     	xref	c_llsh
2598                     	xref	c_ltor
2599                     	end
