   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.3 - 22 May 2025
   3                     ; Generator (Limited) V4.6.6 - 07 Jan 2026
  43                     ; 50 uint8_t ITC_GetCPUCC(void)
  43                     ; 51 {
  45                     .text:	section	.text,new
  46  0000               _ITC_GetCPUCC:
  50                     ; 53   _asm("push cc");
  53  0000 8a            push cc
  55                     ; 54   _asm("pop a");
  58  0001 84            pop a
  60                     ; 55   return; /* Ignore compiler warning, the returned value is in A register */
  63  0002 81            	ret
  86                     ; 80 void ITC_DeInit(void)
  86                     ; 81 {
  87                     .text:	section	.text,new
  88  0000               _ITC_DeInit:
  92                     ; 82   ITC->ISPR1 = ITC_SPRX_RESET_VALUE;
  94  0000 35ff7f70      	mov	32624,#255
  95                     ; 83   ITC->ISPR2 = ITC_SPRX_RESET_VALUE;
  97  0004 35ff7f71      	mov	32625,#255
  98                     ; 84   ITC->ISPR3 = ITC_SPRX_RESET_VALUE;
 100  0008 35ff7f72      	mov	32626,#255
 101                     ; 85   ITC->ISPR4 = ITC_SPRX_RESET_VALUE;
 103  000c 35ff7f73      	mov	32627,#255
 104                     ; 86   ITC->ISPR5 = ITC_SPRX_RESET_VALUE;
 106  0010 35ff7f74      	mov	32628,#255
 107                     ; 87   ITC->ISPR6 = ITC_SPRX_RESET_VALUE;
 109  0014 35ff7f75      	mov	32629,#255
 110                     ; 88   ITC->ISPR7 = ITC_SPRX_RESET_VALUE;
 112  0018 35ff7f76      	mov	32630,#255
 113                     ; 89   ITC->ISPR8 = ITC_SPRX_RESET_VALUE;
 115  001c 35ff7f77      	mov	32631,#255
 116                     ; 90 }
 119  0020 81            	ret
 144                     ; 97 uint8_t ITC_GetSoftIntStatus(void)
 144                     ; 98 {
 145                     .text:	section	.text,new
 146  0000               _ITC_GetSoftIntStatus:
 150                     ; 99   return (uint8_t)(ITC_GetCPUCC() & CPU_CC_I1I0);
 152  0000 cd0000        	call	_ITC_GetCPUCC
 154  0003 a428          	and	a,#40
 157  0005 81            	ret
 406                     .const:	section	.text
 407  0000               L22:
 408  0000 0023          	dc.w	L14
 409  0002 0023          	dc.w	L14
 410  0004 0023          	dc.w	L14
 411  0006 0023          	dc.w	L14
 412  0008 002c          	dc.w	L34
 413  000a 002c          	dc.w	L34
 414  000c 002c          	dc.w	L34
 415  000e 002c          	dc.w	L34
 416  0010 0060          	dc.w	L302
 417  0012 0060          	dc.w	L302
 418  0014 0035          	dc.w	L54
 419  0016 0035          	dc.w	L54
 420  0018 003e          	dc.w	L74
 421  001a 003e          	dc.w	L74
 422  001c 003e          	dc.w	L74
 423  001e 003e          	dc.w	L74
 424  0020 0047          	dc.w	L15
 425  0022 0047          	dc.w	L15
 426  0024 0047          	dc.w	L15
 427  0026 0047          	dc.w	L15
 428  0028 0060          	dc.w	L302
 429  002a 0060          	dc.w	L302
 430  002c 0050          	dc.w	L35
 431  002e 0050          	dc.w	L35
 432  0030 0059          	dc.w	L55
 433                     ; 107 ITC_PriorityLevel_TypeDef ITC_GetSoftwarePriority(ITC_Irq_TypeDef IrqNum)
 433                     ; 108 {
 434                     .text:	section	.text,new
 435  0000               _ITC_GetSoftwarePriority:
 437  0000 88            	push	a
 438  0001 89            	pushw	x
 439       00000002      OFST:	set	2
 442                     ; 109   uint8_t Value = 0;
 444  0002 0f02          	clr	(OFST+0,sp)
 446                     ; 110   uint8_t Mask = 0;
 448                     ; 113   assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
 450                     ; 116   Mask = (uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U));
 452  0004 a403          	and	a,#3
 453  0006 48            	sll	a
 454  0007 5f            	clrw	x
 455  0008 97            	ld	xl,a
 456  0009 a603          	ld	a,#3
 457  000b 5d            	tnzw	x
 458  000c 2704          	jreq	L41
 459  000e               L61:
 460  000e 48            	sll	a
 461  000f 5a            	decw	x
 462  0010 26fc          	jrne	L61
 463  0012               L41:
 464  0012 6b01          	ld	(OFST-1,sp),a
 466                     ; 118   switch (IrqNum)
 468  0014 7b03          	ld	a,(OFST+1,sp)
 470                     ; 198   default:
 470                     ; 199     break;
 471  0016 a119          	cp	a,#25
 472  0018 2407          	jruge	L02
 473  001a 5f            	clrw	x
 474  001b 97            	ld	xl,a
 475  001c 58            	sllw	x
 476  001d de0000        	ldw	x,(L22,x)
 477  0020 fc            	jp	(x)
 478  0021               L02:
 479  0021 203d          	jra	L302
 480  0023               L14:
 481                     ; 120   case ITC_IRQ_TLI: /* TLI software priority can be read but has no meaning */
 481                     ; 121   case ITC_IRQ_AWU:
 481                     ; 122   case ITC_IRQ_CLK:
 481                     ; 123   case ITC_IRQ_PORTA:
 481                     ; 124     Value = (uint8_t)(ITC->ISPR1 & Mask); /* Read software priority */
 483  0023 c67f70        	ld	a,32624
 484  0026 1401          	and	a,(OFST-1,sp)
 485  0028 6b02          	ld	(OFST+0,sp),a
 487                     ; 125     break;
 489  002a 2034          	jra	L302
 490  002c               L34:
 491                     ; 127   case ITC_IRQ_PORTB:
 491                     ; 128   case ITC_IRQ_PORTC:
 491                     ; 129   case ITC_IRQ_PORTD:
 491                     ; 130   case ITC_IRQ_PORTE:
 491                     ; 131     Value = (uint8_t)(ITC->ISPR2 & Mask); /* Read software priority */
 493  002c c67f71        	ld	a,32625
 494  002f 1401          	and	a,(OFST-1,sp)
 495  0031 6b02          	ld	(OFST+0,sp),a
 497                     ; 132     break;
 499  0033 202b          	jra	L302
 500  0035               L54:
 501                     ; 141   case ITC_IRQ_SPI:
 501                     ; 142   case ITC_IRQ_TIM1_OVF:
 501                     ; 143     Value = (uint8_t)(ITC->ISPR3 & Mask); /* Read software priority */
 503  0035 c67f72        	ld	a,32626
 504  0038 1401          	and	a,(OFST-1,sp)
 505  003a 6b02          	ld	(OFST+0,sp),a
 507                     ; 144     break;
 509  003c 2022          	jra	L302
 510  003e               L74:
 511                     ; 146   case ITC_IRQ_TIM1_CAPCOM:
 511                     ; 147 #if defined (STM8S903) || defined (STM8AF622x)
 511                     ; 148   case ITC_IRQ_TIM5_OVFTRI:
 511                     ; 149   case ITC_IRQ_TIM5_CAPCOM:
 511                     ; 150 #else
 511                     ; 151   case ITC_IRQ_TIM2_OVF:
 511                     ; 152   case ITC_IRQ_TIM2_CAPCOM:
 511                     ; 153 #endif /* STM8S903 or STM8AF622x*/
 511                     ; 154   case ITC_IRQ_TIM3_OVF:
 511                     ; 155     Value = (uint8_t)(ITC->ISPR4 & Mask); /* Read software priority */
 513  003e c67f73        	ld	a,32627
 514  0041 1401          	and	a,(OFST-1,sp)
 515  0043 6b02          	ld	(OFST+0,sp),a
 517                     ; 156     break;
 519  0045 2019          	jra	L302
 520  0047               L15:
 521                     ; 158   case ITC_IRQ_TIM3_CAPCOM:
 521                     ; 159 #if defined(STM8S208) ||defined(STM8S207) || defined (STM8S007) || defined(STM8S103) || \
 521                     ; 160     defined(STM8S003) ||defined(STM8S903) || defined (STM8AF52Ax) || defined (STM8AF62Ax)
 521                     ; 161   case ITC_IRQ_UART1_TX:
 521                     ; 162   case ITC_IRQ_UART1_RX:
 521                     ; 163 #endif /*STM8S208 or STM8S207 or STM8S007 or STM8S103 or STM8S003 or STM8S903 or STM8AF52Ax or STM8AF62Ax */ 
 521                     ; 164 #if defined(STM8AF622x)
 521                     ; 165   case ITC_IRQ_UART4_TX:
 521                     ; 166   case ITC_IRQ_UART4_RX:
 521                     ; 167 #endif /*STM8AF622x */
 521                     ; 168   case ITC_IRQ_I2C:
 521                     ; 169     Value = (uint8_t)(ITC->ISPR5 & Mask); /* Read software priority */
 523  0047 c67f74        	ld	a,32628
 524  004a 1401          	and	a,(OFST-1,sp)
 525  004c 6b02          	ld	(OFST+0,sp),a
 527                     ; 170     break;
 529  004e 2010          	jra	L302
 530  0050               L35:
 531                     ; 184   case ITC_IRQ_ADC1:
 531                     ; 185 #endif /*STM8S105, STM8S005, STM8S103 or STM8S003 or STM8S903 or STM8AF626x or STM8AF622x */
 531                     ; 186 #if defined (STM8S903) || defined (STM8AF622x)
 531                     ; 187   case ITC_IRQ_TIM6_OVFTRI:
 531                     ; 188 #else
 531                     ; 189   case ITC_IRQ_TIM4_OVF:
 531                     ; 190 #endif /*STM8S903 or STM8AF622x */
 531                     ; 191     Value = (uint8_t)(ITC->ISPR6 & Mask); /* Read software priority */
 533  0050 c67f75        	ld	a,32629
 534  0053 1401          	and	a,(OFST-1,sp)
 535  0055 6b02          	ld	(OFST+0,sp),a
 537                     ; 192     break;
 539  0057 2007          	jra	L302
 540  0059               L55:
 541                     ; 194   case ITC_IRQ_EEPROM_EEC:
 541                     ; 195     Value = (uint8_t)(ITC->ISPR7 & Mask); /* Read software priority */
 543  0059 c67f76        	ld	a,32630
 544  005c 1401          	and	a,(OFST-1,sp)
 545  005e 6b02          	ld	(OFST+0,sp),a
 547                     ; 196     break;
 549  0060               L75:
 550                     ; 198   default:
 550                     ; 199     break;
 552  0060               L302:
 553                     ; 202   Value >>= (uint8_t)(((uint8_t)IrqNum % 4u) * 2u);
 555  0060 7b03          	ld	a,(OFST+1,sp)
 556  0062 a403          	and	a,#3
 557  0064 48            	sll	a
 558  0065 5f            	clrw	x
 559  0066 97            	ld	xl,a
 560  0067 7b02          	ld	a,(OFST+0,sp)
 561  0069 5d            	tnzw	x
 562  006a 2704          	jreq	L42
 563  006c               L62:
 564  006c 44            	srl	a
 565  006d 5a            	decw	x
 566  006e 26fc          	jrne	L62
 567  0070               L42:
 568  0070 6b02          	ld	(OFST+0,sp),a
 570                     ; 204   return((ITC_PriorityLevel_TypeDef)Value);
 572  0072 7b02          	ld	a,(OFST+0,sp)
 575  0074 5b03          	addw	sp,#3
 576  0076 81            	ret
 640                     	switch	.const
 641  0032               L44:
 642  0032 0035          	dc.w	L502
 643  0034 0035          	dc.w	L502
 644  0036 0035          	dc.w	L502
 645  0038 0035          	dc.w	L502
 646  003a 0047          	dc.w	L702
 647  003c 0047          	dc.w	L702
 648  003e 0047          	dc.w	L702
 649  0040 0047          	dc.w	L702
 650  0042 00b1          	dc.w	L162
 651  0044 00b1          	dc.w	L162
 652  0046 0059          	dc.w	L112
 653  0048 0059          	dc.w	L112
 654  004a 006b          	dc.w	L312
 655  004c 006b          	dc.w	L312
 656  004e 006b          	dc.w	L312
 657  0050 006b          	dc.w	L312
 658  0052 007d          	dc.w	L512
 659  0054 007d          	dc.w	L512
 660  0056 007d          	dc.w	L512
 661  0058 007d          	dc.w	L512
 662  005a 00b1          	dc.w	L162
 663  005c 00b1          	dc.w	L162
 664  005e 008f          	dc.w	L712
 665  0060 008f          	dc.w	L712
 666  0062 00a1          	dc.w	L122
 667                     ; 220 void ITC_SetSoftwarePriority(ITC_Irq_TypeDef IrqNum, ITC_PriorityLevel_TypeDef PriorityValue)
 667                     ; 221 {
 668                     .text:	section	.text,new
 669  0000               _ITC_SetSoftwarePriority:
 671  0000 89            	pushw	x
 672  0001 89            	pushw	x
 673       00000002      OFST:	set	2
 676                     ; 222   uint8_t Mask = 0;
 678                     ; 223   uint8_t NewPriority = 0;
 680                     ; 226   assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
 682                     ; 227   assert_param(IS_ITC_PRIORITY_OK(PriorityValue));
 684                     ; 230   assert_param(IS_ITC_INTERRUPTS_DISABLED);
 686                     ; 234   Mask = (uint8_t)(~(uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U)));
 688  0002 9e            	ld	a,xh
 689  0003 a403          	and	a,#3
 690  0005 48            	sll	a
 691  0006 5f            	clrw	x
 692  0007 97            	ld	xl,a
 693  0008 a603          	ld	a,#3
 694  000a 5d            	tnzw	x
 695  000b 2704          	jreq	L23
 696  000d               L43:
 697  000d 48            	sll	a
 698  000e 5a            	decw	x
 699  000f 26fc          	jrne	L43
 700  0011               L23:
 701  0011 43            	cpl	a
 702  0012 6b01          	ld	(OFST-1,sp),a
 704                     ; 237   NewPriority = (uint8_t)((uint8_t)(PriorityValue) << (((uint8_t)IrqNum % 4U) * 2U));
 706  0014 7b03          	ld	a,(OFST+1,sp)
 707  0016 a403          	and	a,#3
 708  0018 48            	sll	a
 709  0019 5f            	clrw	x
 710  001a 97            	ld	xl,a
 711  001b 7b04          	ld	a,(OFST+2,sp)
 712  001d 5d            	tnzw	x
 713  001e 2704          	jreq	L63
 714  0020               L04:
 715  0020 48            	sll	a
 716  0021 5a            	decw	x
 717  0022 26fc          	jrne	L04
 718  0024               L63:
 719  0024 6b02          	ld	(OFST+0,sp),a
 721                     ; 239   switch (IrqNum)
 723  0026 7b03          	ld	a,(OFST+1,sp)
 725                     ; 329   default:
 725                     ; 330     break;
 726  0028 a119          	cp	a,#25
 727  002a 2407          	jruge	L24
 728  002c 5f            	clrw	x
 729  002d 97            	ld	xl,a
 730  002e 58            	sllw	x
 731  002f de0032        	ldw	x,(L44,x)
 732  0032 fc            	jp	(x)
 733  0033               L24:
 734  0033 207c          	jra	L162
 735  0035               L502:
 736                     ; 241   case ITC_IRQ_TLI: /* TLI software priority can be written but has no meaning */
 736                     ; 242   case ITC_IRQ_AWU:
 736                     ; 243   case ITC_IRQ_CLK:
 736                     ; 244   case ITC_IRQ_PORTA:
 736                     ; 245     ITC->ISPR1 &= Mask;
 738  0035 c67f70        	ld	a,32624
 739  0038 1401          	and	a,(OFST-1,sp)
 740  003a c77f70        	ld	32624,a
 741                     ; 246     ITC->ISPR1 |= NewPriority;
 743  003d c67f70        	ld	a,32624
 744  0040 1a02          	or	a,(OFST+0,sp)
 745  0042 c77f70        	ld	32624,a
 746                     ; 247     break;
 748  0045 206a          	jra	L162
 749  0047               L702:
 750                     ; 249   case ITC_IRQ_PORTB:
 750                     ; 250   case ITC_IRQ_PORTC:
 750                     ; 251   case ITC_IRQ_PORTD:
 750                     ; 252   case ITC_IRQ_PORTE:
 750                     ; 253     ITC->ISPR2 &= Mask;
 752  0047 c67f71        	ld	a,32625
 753  004a 1401          	and	a,(OFST-1,sp)
 754  004c c77f71        	ld	32625,a
 755                     ; 254     ITC->ISPR2 |= NewPriority;
 757  004f c67f71        	ld	a,32625
 758  0052 1a02          	or	a,(OFST+0,sp)
 759  0054 c77f71        	ld	32625,a
 760                     ; 255     break;
 762  0057 2058          	jra	L162
 763  0059               L112:
 764                     ; 264   case ITC_IRQ_SPI:
 764                     ; 265   case ITC_IRQ_TIM1_OVF:
 764                     ; 266     ITC->ISPR3 &= Mask;
 766  0059 c67f72        	ld	a,32626
 767  005c 1401          	and	a,(OFST-1,sp)
 768  005e c77f72        	ld	32626,a
 769                     ; 267     ITC->ISPR3 |= NewPriority;
 771  0061 c67f72        	ld	a,32626
 772  0064 1a02          	or	a,(OFST+0,sp)
 773  0066 c77f72        	ld	32626,a
 774                     ; 268     break;
 776  0069 2046          	jra	L162
 777  006b               L312:
 778                     ; 270   case ITC_IRQ_TIM1_CAPCOM:
 778                     ; 271 #if defined(STM8S903) || defined(STM8AF622x) 
 778                     ; 272   case ITC_IRQ_TIM5_OVFTRI:
 778                     ; 273   case ITC_IRQ_TIM5_CAPCOM:
 778                     ; 274 #else
 778                     ; 275   case ITC_IRQ_TIM2_OVF:
 778                     ; 276   case ITC_IRQ_TIM2_CAPCOM:
 778                     ; 277 #endif /*STM8S903 or STM8AF622x */
 778                     ; 278   case ITC_IRQ_TIM3_OVF:
 778                     ; 279     ITC->ISPR4 &= Mask;
 780  006b c67f73        	ld	a,32627
 781  006e 1401          	and	a,(OFST-1,sp)
 782  0070 c77f73        	ld	32627,a
 783                     ; 280     ITC->ISPR4 |= NewPriority;
 785  0073 c67f73        	ld	a,32627
 786  0076 1a02          	or	a,(OFST+0,sp)
 787  0078 c77f73        	ld	32627,a
 788                     ; 281     break;
 790  007b 2034          	jra	L162
 791  007d               L512:
 792                     ; 283   case ITC_IRQ_TIM3_CAPCOM:
 792                     ; 284 #if defined(STM8S208) ||defined(STM8S207) || defined (STM8S007) || defined(STM8S103) || \
 792                     ; 285     defined(STM8S003) ||defined(STM8S903) || defined (STM8AF52Ax) || defined (STM8AF62Ax)
 792                     ; 286   case ITC_IRQ_UART1_TX:
 792                     ; 287   case ITC_IRQ_UART1_RX:
 792                     ; 288 #endif /*STM8S208 or STM8S207 or STM8S007 or STM8S103 or STM8S003 or STM8S903 or STM8AF52Ax or STM8AF62Ax */ 
 792                     ; 289 #if defined(STM8AF622x)
 792                     ; 290   case ITC_IRQ_UART4_TX:
 792                     ; 291   case ITC_IRQ_UART4_RX:
 792                     ; 292 #endif /*STM8AF622x */
 792                     ; 293   case ITC_IRQ_I2C:
 792                     ; 294     ITC->ISPR5 &= Mask;
 794  007d c67f74        	ld	a,32628
 795  0080 1401          	and	a,(OFST-1,sp)
 796  0082 c77f74        	ld	32628,a
 797                     ; 295     ITC->ISPR5 |= NewPriority;
 799  0085 c67f74        	ld	a,32628
 800  0088 1a02          	or	a,(OFST+0,sp)
 801  008a c77f74        	ld	32628,a
 802                     ; 296     break;
 804  008d 2022          	jra	L162
 805  008f               L712:
 806                     ; 312   case ITC_IRQ_ADC1:
 806                     ; 313 #endif /*STM8S105, STM8S005, STM8S103 or STM8S003 or STM8S903 or STM8AF626x or STM8AF622x */
 806                     ; 314     
 806                     ; 315 #if defined (STM8S903) || defined (STM8AF622x)
 806                     ; 316   case ITC_IRQ_TIM6_OVFTRI:
 806                     ; 317 #else
 806                     ; 318   case ITC_IRQ_TIM4_OVF:
 806                     ; 319 #endif /* STM8S903 or STM8AF622x */
 806                     ; 320     ITC->ISPR6 &= Mask;
 808  008f c67f75        	ld	a,32629
 809  0092 1401          	and	a,(OFST-1,sp)
 810  0094 c77f75        	ld	32629,a
 811                     ; 321     ITC->ISPR6 |= NewPriority;
 813  0097 c67f75        	ld	a,32629
 814  009a 1a02          	or	a,(OFST+0,sp)
 815  009c c77f75        	ld	32629,a
 816                     ; 322     break;
 818  009f 2010          	jra	L162
 819  00a1               L122:
 820                     ; 324   case ITC_IRQ_EEPROM_EEC:
 820                     ; 325     ITC->ISPR7 &= Mask;
 822  00a1 c67f76        	ld	a,32630
 823  00a4 1401          	and	a,(OFST-1,sp)
 824  00a6 c77f76        	ld	32630,a
 825                     ; 326     ITC->ISPR7 |= NewPriority;
 827  00a9 c67f76        	ld	a,32630
 828  00ac 1a02          	or	a,(OFST+0,sp)
 829  00ae c77f76        	ld	32630,a
 830                     ; 327     break;
 832  00b1               L322:
 833                     ; 329   default:
 833                     ; 330     break;
 835  00b1               L162:
 836                     ; 332 }
 839  00b1 5b04          	addw	sp,#4
 840  00b3 81            	ret
 853                     	xdef	_ITC_GetSoftwarePriority
 854                     	xdef	_ITC_SetSoftwarePriority
 855                     	xdef	_ITC_GetSoftIntStatus
 856                     	xdef	_ITC_DeInit
 857                     	xdef	_ITC_GetCPUCC
 876                     	end
