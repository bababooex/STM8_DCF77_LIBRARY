   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.3 - 22 May 2025
   3                     ; Generator (Limited) V4.6.6 - 07 Jan 2026
  43                     ; 58 void TIM1_DeInit(void)
  43                     ; 59 {
  45                     .text:	section	.text,new
  46  0000               _TIM1_DeInit:
  50                     ; 60   TIM1->CR1  = TIM1_CR1_RESET_VALUE;
  52  0000 725f5250      	clr	21072
  53                     ; 61   TIM1->CR2  = TIM1_CR2_RESET_VALUE;
  55  0004 725f5251      	clr	21073
  56                     ; 62   TIM1->SMCR = TIM1_SMCR_RESET_VALUE;
  58  0008 725f5252      	clr	21074
  59                     ; 63   TIM1->ETR  = TIM1_ETR_RESET_VALUE;
  61  000c 725f5253      	clr	21075
  62                     ; 64   TIM1->IER  = TIM1_IER_RESET_VALUE;
  64  0010 725f5254      	clr	21076
  65                     ; 65   TIM1->SR2  = TIM1_SR2_RESET_VALUE;
  67  0014 725f5256      	clr	21078
  68                     ; 67   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  70  0018 725f525c      	clr	21084
  71                     ; 68   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  73  001c 725f525d      	clr	21085
  74                     ; 70   TIM1->CCMR1 = 0x01;
  76  0020 35015258      	mov	21080,#1
  77                     ; 71   TIM1->CCMR2 = 0x01;
  79  0024 35015259      	mov	21081,#1
  80                     ; 72   TIM1->CCMR3 = 0x01;
  82  0028 3501525a      	mov	21082,#1
  83                     ; 73   TIM1->CCMR4 = 0x01;
  85  002c 3501525b      	mov	21083,#1
  86                     ; 75   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  88  0030 725f525c      	clr	21084
  89                     ; 76   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  91  0034 725f525d      	clr	21085
  92                     ; 77   TIM1->CCMR1 = TIM1_CCMR1_RESET_VALUE;
  94  0038 725f5258      	clr	21080
  95                     ; 78   TIM1->CCMR2 = TIM1_CCMR2_RESET_VALUE;
  97  003c 725f5259      	clr	21081
  98                     ; 79   TIM1->CCMR3 = TIM1_CCMR3_RESET_VALUE;
 100  0040 725f525a      	clr	21082
 101                     ; 80   TIM1->CCMR4 = TIM1_CCMR4_RESET_VALUE;
 103  0044 725f525b      	clr	21083
 104                     ; 81   TIM1->CNTRH = TIM1_CNTRH_RESET_VALUE;
 106  0048 725f525e      	clr	21086
 107                     ; 82   TIM1->CNTRL = TIM1_CNTRL_RESET_VALUE;
 109  004c 725f525f      	clr	21087
 110                     ; 83   TIM1->PSCRH = TIM1_PSCRH_RESET_VALUE;
 112  0050 725f5260      	clr	21088
 113                     ; 84   TIM1->PSCRL = TIM1_PSCRL_RESET_VALUE;
 115  0054 725f5261      	clr	21089
 116                     ; 85   TIM1->ARRH  = TIM1_ARRH_RESET_VALUE;
 118  0058 35ff5262      	mov	21090,#255
 119                     ; 86   TIM1->ARRL  = TIM1_ARRL_RESET_VALUE;
 121  005c 35ff5263      	mov	21091,#255
 122                     ; 87   TIM1->CCR1H = TIM1_CCR1H_RESET_VALUE;
 124  0060 725f5265      	clr	21093
 125                     ; 88   TIM1->CCR1L = TIM1_CCR1L_RESET_VALUE;
 127  0064 725f5266      	clr	21094
 128                     ; 89   TIM1->CCR2H = TIM1_CCR2H_RESET_VALUE;
 130  0068 725f5267      	clr	21095
 131                     ; 90   TIM1->CCR2L = TIM1_CCR2L_RESET_VALUE;
 133  006c 725f5268      	clr	21096
 134                     ; 91   TIM1->CCR3H = TIM1_CCR3H_RESET_VALUE;
 136  0070 725f5269      	clr	21097
 137                     ; 92   TIM1->CCR3L = TIM1_CCR3L_RESET_VALUE;
 139  0074 725f526a      	clr	21098
 140                     ; 93   TIM1->CCR4H = TIM1_CCR4H_RESET_VALUE;
 142  0078 725f526b      	clr	21099
 143                     ; 94   TIM1->CCR4L = TIM1_CCR4L_RESET_VALUE;
 145  007c 725f526c      	clr	21100
 146                     ; 95   TIM1->OISR  = TIM1_OISR_RESET_VALUE;
 148  0080 725f526f      	clr	21103
 149                     ; 96   TIM1->EGR   = 0x01; /* TIM1_EGR_UG */
 151  0084 35015257      	mov	21079,#1
 152                     ; 97   TIM1->DTR   = TIM1_DTR_RESET_VALUE;
 154  0088 725f526e      	clr	21102
 155                     ; 98   TIM1->BKR   = TIM1_BKR_RESET_VALUE;
 157  008c 725f526d      	clr	21101
 158                     ; 99   TIM1->RCR   = TIM1_RCR_RESET_VALUE;
 160  0090 725f5264      	clr	21092
 161                     ; 100   TIM1->SR1   = TIM1_SR1_RESET_VALUE;
 163  0094 725f5255      	clr	21077
 164                     ; 101 }
 167  0098 81            	ret
 276                     ; 111 void TIM1_TimeBaseInit(uint16_t TIM1_Prescaler,
 276                     ; 112                        TIM1_CounterMode_TypeDef TIM1_CounterMode,
 276                     ; 113                        uint16_t TIM1_Period,
 276                     ; 114                        uint8_t TIM1_RepetitionCounter)
 276                     ; 115 {
 277                     .text:	section	.text,new
 278  0000               _TIM1_TimeBaseInit:
 280  0000 89            	pushw	x
 281       00000000      OFST:	set	0
 284                     ; 117   assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
 286                     ; 120   TIM1->ARRH = (uint8_t)(TIM1_Period >> 8);
 288  0001 7b06          	ld	a,(OFST+6,sp)
 289  0003 c75262        	ld	21090,a
 290                     ; 121   TIM1->ARRL = (uint8_t)(TIM1_Period);
 292  0006 7b07          	ld	a,(OFST+7,sp)
 293  0008 c75263        	ld	21091,a
 294                     ; 124   TIM1->PSCRH = (uint8_t)(TIM1_Prescaler >> 8);
 296  000b 9e            	ld	a,xh
 297  000c c75260        	ld	21088,a
 298                     ; 125   TIM1->PSCRL = (uint8_t)(TIM1_Prescaler);
 300  000f 9f            	ld	a,xl
 301  0010 c75261        	ld	21089,a
 302                     ; 128   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)(~(TIM1_CR1_CMS | TIM1_CR1_DIR)))
 302                     ; 129                         | (uint8_t)(TIM1_CounterMode));
 304  0013 c65250        	ld	a,21072
 305  0016 a48f          	and	a,#143
 306  0018 1a05          	or	a,(OFST+5,sp)
 307  001a c75250        	ld	21072,a
 308                     ; 132   TIM1->RCR = TIM1_RepetitionCounter;
 310  001d 7b08          	ld	a,(OFST+8,sp)
 311  001f c75264        	ld	21092,a
 312                     ; 133 }
 315  0022 85            	popw	x
 316  0023 81            	ret
 601                     ; 154 void TIM1_OC1Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 601                     ; 155                   TIM1_OutputState_TypeDef TIM1_OutputState,
 601                     ; 156                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 601                     ; 157                   uint16_t TIM1_Pulse,
 601                     ; 158                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 601                     ; 159                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 601                     ; 160                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 601                     ; 161                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 601                     ; 162 {
 602                     .text:	section	.text,new
 603  0000               _TIM1_OC1Init:
 605  0000 89            	pushw	x
 606  0001 5203          	subw	sp,#3
 607       00000003      OFST:	set	3
 610                     ; 164   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 612                     ; 165   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 614                     ; 166   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 616                     ; 167   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 618                     ; 168   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 620                     ; 169   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 622                     ; 170   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 624                     ; 174   TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC1E | TIM1_CCER1_CC1NE 
 624                     ; 175                              | TIM1_CCER1_CC1P | TIM1_CCER1_CC1NP));
 626  0003 c6525c        	ld	a,21084
 627  0006 a4f0          	and	a,#240
 628  0008 c7525c        	ld	21084,a
 629                     ; 178   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC1E)
 629                     ; 179                                      | (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC1NE))
 629                     ; 180                            | (uint8_t)( (uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC1P)
 629                     ; 181                                        | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC1NP)));
 631  000b 7b0c          	ld	a,(OFST+9,sp)
 632  000d a408          	and	a,#8
 633  000f 6b03          	ld	(OFST+0,sp),a
 635  0011 7b0b          	ld	a,(OFST+8,sp)
 636  0013 a402          	and	a,#2
 637  0015 1a03          	or	a,(OFST+0,sp)
 638  0017 6b02          	ld	(OFST-1,sp),a
 640  0019 7b08          	ld	a,(OFST+5,sp)
 641  001b a404          	and	a,#4
 642  001d 6b01          	ld	(OFST-2,sp),a
 644  001f 9f            	ld	a,xl
 645  0020 a401          	and	a,#1
 646  0022 1a01          	or	a,(OFST-2,sp)
 647  0024 1a02          	or	a,(OFST-1,sp)
 648  0026 ca525c        	or	a,21084
 649  0029 c7525c        	ld	21084,a
 650                     ; 184   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) | 
 650                     ; 185                           (uint8_t)TIM1_OCMode);
 652  002c c65258        	ld	a,21080
 653  002f a48f          	and	a,#143
 654  0031 1a04          	or	a,(OFST+1,sp)
 655  0033 c75258        	ld	21080,a
 656                     ; 188   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS1 | TIM1_OISR_OIS1N));
 658  0036 c6526f        	ld	a,21103
 659  0039 a4fc          	and	a,#252
 660  003b c7526f        	ld	21103,a
 661                     ; 190   TIM1->OISR |= (uint8_t)((uint8_t)( TIM1_OCIdleState & TIM1_OISR_OIS1 ) | 
 661                     ; 191                           (uint8_t)( TIM1_OCNIdleState & TIM1_OISR_OIS1N ));
 663  003e 7b0e          	ld	a,(OFST+11,sp)
 664  0040 a402          	and	a,#2
 665  0042 6b03          	ld	(OFST+0,sp),a
 667  0044 7b0d          	ld	a,(OFST+10,sp)
 668  0046 a401          	and	a,#1
 669  0048 1a03          	or	a,(OFST+0,sp)
 670  004a ca526f        	or	a,21103
 671  004d c7526f        	ld	21103,a
 672                     ; 194   TIM1->CCR1H = (uint8_t)(TIM1_Pulse >> 8);
 674  0050 7b09          	ld	a,(OFST+6,sp)
 675  0052 c75265        	ld	21093,a
 676                     ; 195   TIM1->CCR1L = (uint8_t)(TIM1_Pulse);
 678  0055 7b0a          	ld	a,(OFST+7,sp)
 679  0057 c75266        	ld	21094,a
 680                     ; 196 }
 683  005a 5b05          	addw	sp,#5
 684  005c 81            	ret
 788                     ; 217 void TIM1_OC2Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 788                     ; 218                   TIM1_OutputState_TypeDef TIM1_OutputState,
 788                     ; 219                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 788                     ; 220                   uint16_t TIM1_Pulse,
 788                     ; 221                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 788                     ; 222                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 788                     ; 223                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 788                     ; 224                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 788                     ; 225 {
 789                     .text:	section	.text,new
 790  0000               _TIM1_OC2Init:
 792  0000 89            	pushw	x
 793  0001 5203          	subw	sp,#3
 794       00000003      OFST:	set	3
 797                     ; 227   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 799                     ; 228   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 801                     ; 229   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 803                     ; 230   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 805                     ; 231   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 807                     ; 232   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 809                     ; 233   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 811                     ; 237   TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC2E | TIM1_CCER1_CC2NE | 
 811                     ; 238                              TIM1_CCER1_CC2P | TIM1_CCER1_CC2NP));
 813  0003 c6525c        	ld	a,21084
 814  0006 a40f          	and	a,#15
 815  0008 c7525c        	ld	21084,a
 816                     ; 242   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC2E  ) | 
 816                     ; 243                                      (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC2NE )) | 
 816                     ; 244                            (uint8_t)((uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC2P  ) | 
 816                     ; 245                                      (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC2NP )));
 818  000b 7b0c          	ld	a,(OFST+9,sp)
 819  000d a480          	and	a,#128
 820  000f 6b03          	ld	(OFST+0,sp),a
 822  0011 7b0b          	ld	a,(OFST+8,sp)
 823  0013 a420          	and	a,#32
 824  0015 1a03          	or	a,(OFST+0,sp)
 825  0017 6b02          	ld	(OFST-1,sp),a
 827  0019 7b08          	ld	a,(OFST+5,sp)
 828  001b a440          	and	a,#64
 829  001d 6b01          	ld	(OFST-2,sp),a
 831  001f 9f            	ld	a,xl
 832  0020 a410          	and	a,#16
 833  0022 1a01          	or	a,(OFST-2,sp)
 834  0024 1a02          	or	a,(OFST-1,sp)
 835  0026 ca525c        	or	a,21084
 836  0029 c7525c        	ld	21084,a
 837                     ; 248   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | 
 837                     ; 249                           (uint8_t)TIM1_OCMode);
 839  002c c65259        	ld	a,21081
 840  002f a48f          	and	a,#143
 841  0031 1a04          	or	a,(OFST+1,sp)
 842  0033 c75259        	ld	21081,a
 843                     ; 252   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS2 | TIM1_OISR_OIS2N));
 845  0036 c6526f        	ld	a,21103
 846  0039 a4f3          	and	a,#243
 847  003b c7526f        	ld	21103,a
 848                     ; 254   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS2 & TIM1_OCIdleState) | 
 848                     ; 255                           (uint8_t)(TIM1_OISR_OIS2N & TIM1_OCNIdleState));
 850  003e 7b0e          	ld	a,(OFST+11,sp)
 851  0040 a408          	and	a,#8
 852  0042 6b03          	ld	(OFST+0,sp),a
 854  0044 7b0d          	ld	a,(OFST+10,sp)
 855  0046 a404          	and	a,#4
 856  0048 1a03          	or	a,(OFST+0,sp)
 857  004a ca526f        	or	a,21103
 858  004d c7526f        	ld	21103,a
 859                     ; 258   TIM1->CCR2H = (uint8_t)(TIM1_Pulse >> 8);
 861  0050 7b09          	ld	a,(OFST+6,sp)
 862  0052 c75267        	ld	21095,a
 863                     ; 259   TIM1->CCR2L = (uint8_t)(TIM1_Pulse);
 865  0055 7b0a          	ld	a,(OFST+7,sp)
 866  0057 c75268        	ld	21096,a
 867                     ; 260 }
 870  005a 5b05          	addw	sp,#5
 871  005c 81            	ret
 975                     ; 281 void TIM1_OC3Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 975                     ; 282                   TIM1_OutputState_TypeDef TIM1_OutputState,
 975                     ; 283                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 975                     ; 284                   uint16_t TIM1_Pulse,
 975                     ; 285                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 975                     ; 286                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 975                     ; 287                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 975                     ; 288                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 975                     ; 289 {
 976                     .text:	section	.text,new
 977  0000               _TIM1_OC3Init:
 979  0000 89            	pushw	x
 980  0001 5203          	subw	sp,#3
 981       00000003      OFST:	set	3
 984                     ; 291   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 986                     ; 292   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 988                     ; 293   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 990                     ; 294   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 992                     ; 295   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 994                     ; 296   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 996                     ; 297   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 998                     ; 301   TIM1->CCER2 &= (uint8_t)(~( TIM1_CCER2_CC3E | TIM1_CCER2_CC3NE | 
 998                     ; 302                              TIM1_CCER2_CC3P | TIM1_CCER2_CC3NP));
1000  0003 c6525d        	ld	a,21085
1001  0006 a4f0          	and	a,#240
1002  0008 c7525d        	ld	21085,a
1003                     ; 305   TIM1->CCER2 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState  & TIM1_CCER2_CC3E   ) |
1003                     ; 306                                      (uint8_t)(TIM1_OutputNState & TIM1_CCER2_CC3NE  )) | 
1003                     ; 307                            (uint8_t)((uint8_t)(TIM1_OCPolarity   & TIM1_CCER2_CC3P   ) | 
1003                     ; 308                                      (uint8_t)(TIM1_OCNPolarity  & TIM1_CCER2_CC3NP  )));
1005  000b 7b0c          	ld	a,(OFST+9,sp)
1006  000d a408          	and	a,#8
1007  000f 6b03          	ld	(OFST+0,sp),a
1009  0011 7b0b          	ld	a,(OFST+8,sp)
1010  0013 a402          	and	a,#2
1011  0015 1a03          	or	a,(OFST+0,sp)
1012  0017 6b02          	ld	(OFST-1,sp),a
1014  0019 7b08          	ld	a,(OFST+5,sp)
1015  001b a404          	and	a,#4
1016  001d 6b01          	ld	(OFST-2,sp),a
1018  001f 9f            	ld	a,xl
1019  0020 a401          	and	a,#1
1020  0022 1a01          	or	a,(OFST-2,sp)
1021  0024 1a02          	or	a,(OFST-1,sp)
1022  0026 ca525d        	or	a,21085
1023  0029 c7525d        	ld	21085,a
1024                     ; 311   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | 
1024                     ; 312                           (uint8_t)TIM1_OCMode);
1026  002c c6525a        	ld	a,21082
1027  002f a48f          	and	a,#143
1028  0031 1a04          	or	a,(OFST+1,sp)
1029  0033 c7525a        	ld	21082,a
1030                     ; 315   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS3 | TIM1_OISR_OIS3N));
1032  0036 c6526f        	ld	a,21103
1033  0039 a4cf          	and	a,#207
1034  003b c7526f        	ld	21103,a
1035                     ; 317   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS3 & TIM1_OCIdleState) | 
1035                     ; 318                           (uint8_t)(TIM1_OISR_OIS3N & TIM1_OCNIdleState));
1037  003e 7b0e          	ld	a,(OFST+11,sp)
1038  0040 a420          	and	a,#32
1039  0042 6b03          	ld	(OFST+0,sp),a
1041  0044 7b0d          	ld	a,(OFST+10,sp)
1042  0046 a410          	and	a,#16
1043  0048 1a03          	or	a,(OFST+0,sp)
1044  004a ca526f        	or	a,21103
1045  004d c7526f        	ld	21103,a
1046                     ; 321   TIM1->CCR3H = (uint8_t)(TIM1_Pulse >> 8);
1048  0050 7b09          	ld	a,(OFST+6,sp)
1049  0052 c75269        	ld	21097,a
1050                     ; 322   TIM1->CCR3L = (uint8_t)(TIM1_Pulse);
1052  0055 7b0a          	ld	a,(OFST+7,sp)
1053  0057 c7526a        	ld	21098,a
1054                     ; 323 }
1057  005a 5b05          	addw	sp,#5
1058  005c 81            	ret
1132                     ; 338 void TIM1_OC4Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1132                     ; 339                   TIM1_OutputState_TypeDef TIM1_OutputState,
1132                     ; 340                   uint16_t TIM1_Pulse,
1132                     ; 341                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1132                     ; 342                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState)
1132                     ; 343 {
1133                     .text:	section	.text,new
1134  0000               _TIM1_OC4Init:
1136  0000 89            	pushw	x
1137  0001 88            	push	a
1138       00000001      OFST:	set	1
1141                     ; 345   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
1143                     ; 346   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
1145                     ; 347   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
1147                     ; 348   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
1149                     ; 351   TIM1->CCER2 &= (uint8_t)(~(TIM1_CCER2_CC4E | TIM1_CCER2_CC4P));
1151  0002 c6525d        	ld	a,21085
1152  0005 a4cf          	and	a,#207
1153  0007 c7525d        	ld	21085,a
1154                     ; 353   TIM1->CCER2 |= (uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER2_CC4E ) |  
1154                     ; 354                            (uint8_t)(TIM1_OCPolarity  & TIM1_CCER2_CC4P ));
1156  000a 7b08          	ld	a,(OFST+7,sp)
1157  000c a420          	and	a,#32
1158  000e 6b01          	ld	(OFST+0,sp),a
1160  0010 9f            	ld	a,xl
1161  0011 a410          	and	a,#16
1162  0013 1a01          	or	a,(OFST+0,sp)
1163  0015 ca525d        	or	a,21085
1164  0018 c7525d        	ld	21085,a
1165                     ; 357   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) | 
1165                     ; 358                           TIM1_OCMode);
1167  001b c6525b        	ld	a,21083
1168  001e a48f          	and	a,#143
1169  0020 1a02          	or	a,(OFST+1,sp)
1170  0022 c7525b        	ld	21083,a
1171                     ; 361   if (TIM1_OCIdleState != TIM1_OCIDLESTATE_RESET)
1173  0025 0d09          	tnz	(OFST+8,sp)
1174  0027 270a          	jreq	L534
1175                     ; 363     TIM1->OISR |= (uint8_t)(~TIM1_CCER2_CC4P);
1177  0029 c6526f        	ld	a,21103
1178  002c aadf          	or	a,#223
1179  002e c7526f        	ld	21103,a
1181  0031 2004          	jra	L734
1182  0033               L534:
1183                     ; 367     TIM1->OISR &= (uint8_t)(~TIM1_OISR_OIS4);
1185  0033 721d526f      	bres	21103,#6
1186  0037               L734:
1187                     ; 371   TIM1->CCR4H = (uint8_t)(TIM1_Pulse >> 8);
1189  0037 7b06          	ld	a,(OFST+5,sp)
1190  0039 c7526b        	ld	21099,a
1191                     ; 372   TIM1->CCR4L = (uint8_t)(TIM1_Pulse);
1193  003c 7b07          	ld	a,(OFST+6,sp)
1194  003e c7526c        	ld	21100,a
1195                     ; 373 }
1198  0041 5b03          	addw	sp,#3
1199  0043 81            	ret
1404                     ; 388 void TIM1_BDTRConfig(TIM1_OSSIState_TypeDef TIM1_OSSIState,
1404                     ; 389                      TIM1_LockLevel_TypeDef TIM1_LockLevel,
1404                     ; 390                      uint8_t TIM1_DeadTime,
1404                     ; 391                      TIM1_BreakState_TypeDef TIM1_Break,
1404                     ; 392                      TIM1_BreakPolarity_TypeDef TIM1_BreakPolarity,
1404                     ; 393                      TIM1_AutomaticOutput_TypeDef TIM1_AutomaticOutput)
1404                     ; 394 {
1405                     .text:	section	.text,new
1406  0000               _TIM1_BDTRConfig:
1408  0000 89            	pushw	x
1409  0001 88            	push	a
1410       00000001      OFST:	set	1
1413                     ; 396   assert_param(IS_TIM1_OSSI_STATE_OK(TIM1_OSSIState));
1415                     ; 397   assert_param(IS_TIM1_LOCK_LEVEL_OK(TIM1_LockLevel));
1417                     ; 398   assert_param(IS_TIM1_BREAK_STATE_OK(TIM1_Break));
1419                     ; 399   assert_param(IS_TIM1_BREAK_POLARITY_OK(TIM1_BreakPolarity));
1421                     ; 400   assert_param(IS_TIM1_AUTOMATIC_OUTPUT_STATE_OK(TIM1_AutomaticOutput));
1423                     ; 402   TIM1->DTR = (uint8_t)(TIM1_DeadTime);
1425  0002 7b06          	ld	a,(OFST+5,sp)
1426  0004 c7526e        	ld	21102,a
1427                     ; 406   TIM1->BKR  =  (uint8_t)((uint8_t)(TIM1_OSSIState | (uint8_t)TIM1_LockLevel)  | 
1427                     ; 407                           (uint8_t)((uint8_t)(TIM1_Break | (uint8_t)TIM1_BreakPolarity)  | 
1427                     ; 408                           (uint8_t)TIM1_AutomaticOutput));
1429  0007 7b07          	ld	a,(OFST+6,sp)
1430  0009 1a08          	or	a,(OFST+7,sp)
1431  000b 1a09          	or	a,(OFST+8,sp)
1432  000d 6b01          	ld	(OFST+0,sp),a
1434  000f 9f            	ld	a,xl
1435  0010 1a02          	or	a,(OFST+1,sp)
1436  0012 1a01          	or	a,(OFST+0,sp)
1437  0014 c7526d        	ld	21101,a
1438                     ; 409 }
1441  0017 5b03          	addw	sp,#3
1442  0019 81            	ret
1644                     ; 423 void TIM1_ICInit(TIM1_Channel_TypeDef TIM1_Channel,
1644                     ; 424                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
1644                     ; 425                  TIM1_ICSelection_TypeDef TIM1_ICSelection,
1644                     ; 426                  TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
1644                     ; 427                  uint8_t TIM1_ICFilter)
1644                     ; 428 {
1645                     .text:	section	.text,new
1646  0000               _TIM1_ICInit:
1648  0000 89            	pushw	x
1649       00000000      OFST:	set	0
1652                     ; 430   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
1654                     ; 431   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
1656                     ; 432   assert_param(IS_TIM1_IC_SELECTION_OK(TIM1_ICSelection));
1658                     ; 433   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_ICPrescaler));
1660                     ; 434   assert_param(IS_TIM1_IC_FILTER_OK(TIM1_ICFilter));
1662                     ; 436   if (TIM1_Channel == TIM1_CHANNEL_1)
1664  0001 9e            	ld	a,xh
1665  0002 4d            	tnz	a
1666  0003 2614          	jrne	L766
1667                     ; 439     TI1_Config((uint8_t)TIM1_ICPolarity,
1667                     ; 440                (uint8_t)TIM1_ICSelection,
1667                     ; 441                (uint8_t)TIM1_ICFilter);
1669  0005 7b07          	ld	a,(OFST+7,sp)
1670  0007 88            	push	a
1671  0008 7b06          	ld	a,(OFST+6,sp)
1672  000a 97            	ld	xl,a
1673  000b 7b03          	ld	a,(OFST+3,sp)
1674  000d 95            	ld	xh,a
1675  000e cd0000        	call	L3_TI1_Config
1677  0011 84            	pop	a
1678                     ; 443     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1680  0012 7b06          	ld	a,(OFST+6,sp)
1681  0014 cd0000        	call	_TIM1_SetIC1Prescaler
1684  0017 2046          	jra	L176
1685  0019               L766:
1686                     ; 445   else if (TIM1_Channel == TIM1_CHANNEL_2)
1688  0019 7b01          	ld	a,(OFST+1,sp)
1689  001b a101          	cp	a,#1
1690  001d 2614          	jrne	L376
1691                     ; 448     TI2_Config((uint8_t)TIM1_ICPolarity,
1691                     ; 449                (uint8_t)TIM1_ICSelection,
1691                     ; 450                (uint8_t)TIM1_ICFilter);
1693  001f 7b07          	ld	a,(OFST+7,sp)
1694  0021 88            	push	a
1695  0022 7b06          	ld	a,(OFST+6,sp)
1696  0024 97            	ld	xl,a
1697  0025 7b03          	ld	a,(OFST+3,sp)
1698  0027 95            	ld	xh,a
1699  0028 cd0000        	call	L5_TI2_Config
1701  002b 84            	pop	a
1702                     ; 452     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1704  002c 7b06          	ld	a,(OFST+6,sp)
1705  002e cd0000        	call	_TIM1_SetIC2Prescaler
1708  0031 202c          	jra	L176
1709  0033               L376:
1710                     ; 454   else if (TIM1_Channel == TIM1_CHANNEL_3)
1712  0033 7b01          	ld	a,(OFST+1,sp)
1713  0035 a102          	cp	a,#2
1714  0037 2614          	jrne	L776
1715                     ; 457     TI3_Config((uint8_t)TIM1_ICPolarity,
1715                     ; 458                (uint8_t)TIM1_ICSelection,
1715                     ; 459                (uint8_t)TIM1_ICFilter);
1717  0039 7b07          	ld	a,(OFST+7,sp)
1718  003b 88            	push	a
1719  003c 7b06          	ld	a,(OFST+6,sp)
1720  003e 97            	ld	xl,a
1721  003f 7b03          	ld	a,(OFST+3,sp)
1722  0041 95            	ld	xh,a
1723  0042 cd0000        	call	L7_TI3_Config
1725  0045 84            	pop	a
1726                     ; 461     TIM1_SetIC3Prescaler(TIM1_ICPrescaler);
1728  0046 7b06          	ld	a,(OFST+6,sp)
1729  0048 cd0000        	call	_TIM1_SetIC3Prescaler
1732  004b 2012          	jra	L176
1733  004d               L776:
1734                     ; 466     TI4_Config((uint8_t)TIM1_ICPolarity,
1734                     ; 467                (uint8_t)TIM1_ICSelection,
1734                     ; 468                (uint8_t)TIM1_ICFilter);
1736  004d 7b07          	ld	a,(OFST+7,sp)
1737  004f 88            	push	a
1738  0050 7b06          	ld	a,(OFST+6,sp)
1739  0052 97            	ld	xl,a
1740  0053 7b03          	ld	a,(OFST+3,sp)
1741  0055 95            	ld	xh,a
1742  0056 cd0000        	call	L11_TI4_Config
1744  0059 84            	pop	a
1745                     ; 470     TIM1_SetIC4Prescaler(TIM1_ICPrescaler);
1747  005a 7b06          	ld	a,(OFST+6,sp)
1748  005c cd0000        	call	_TIM1_SetIC4Prescaler
1750  005f               L176:
1751                     ; 472 }
1754  005f 85            	popw	x
1755  0060 81            	ret
1851                     ; 488 void TIM1_PWMIConfig(TIM1_Channel_TypeDef TIM1_Channel,
1851                     ; 489                      TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
1851                     ; 490                      TIM1_ICSelection_TypeDef TIM1_ICSelection,
1851                     ; 491                      TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
1851                     ; 492                      uint8_t TIM1_ICFilter)
1851                     ; 493 {
1852                     .text:	section	.text,new
1853  0000               _TIM1_PWMIConfig:
1855  0000 89            	pushw	x
1856  0001 89            	pushw	x
1857       00000002      OFST:	set	2
1860                     ; 494   uint8_t icpolarity = TIM1_ICPOLARITY_RISING;
1862                     ; 495   uint8_t icselection = TIM1_ICSELECTION_DIRECTTI;
1864                     ; 498   assert_param(IS_TIM1_PWMI_CHANNEL_OK(TIM1_Channel));
1866                     ; 499   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
1868                     ; 500   assert_param(IS_TIM1_IC_SELECTION_OK(TIM1_ICSelection));
1870                     ; 501   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_ICPrescaler));
1872                     ; 504   if (TIM1_ICPolarity != TIM1_ICPOLARITY_FALLING)
1874  0002 9f            	ld	a,xl
1875  0003 a101          	cp	a,#1
1876  0005 2706          	jreq	L157
1877                     ; 506     icpolarity = TIM1_ICPOLARITY_FALLING;
1879  0007 a601          	ld	a,#1
1880  0009 6b01          	ld	(OFST-1,sp),a
1883  000b 2002          	jra	L357
1884  000d               L157:
1885                     ; 510     icpolarity = TIM1_ICPOLARITY_RISING;
1887  000d 0f01          	clr	(OFST-1,sp)
1889  000f               L357:
1890                     ; 514   if (TIM1_ICSelection == TIM1_ICSELECTION_DIRECTTI)
1892  000f 7b07          	ld	a,(OFST+5,sp)
1893  0011 a101          	cp	a,#1
1894  0013 2606          	jrne	L557
1895                     ; 516     icselection = TIM1_ICSELECTION_INDIRECTTI;
1897  0015 a602          	ld	a,#2
1898  0017 6b02          	ld	(OFST+0,sp),a
1901  0019 2004          	jra	L757
1902  001b               L557:
1903                     ; 520     icselection = TIM1_ICSELECTION_DIRECTTI;
1905  001b a601          	ld	a,#1
1906  001d 6b02          	ld	(OFST+0,sp),a
1908  001f               L757:
1909                     ; 523   if (TIM1_Channel == TIM1_CHANNEL_1)
1911  001f 0d03          	tnz	(OFST+1,sp)
1912  0021 2626          	jrne	L167
1913                     ; 526     TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
1913                     ; 527                (uint8_t)TIM1_ICFilter);
1915  0023 7b09          	ld	a,(OFST+7,sp)
1916  0025 88            	push	a
1917  0026 7b08          	ld	a,(OFST+6,sp)
1918  0028 97            	ld	xl,a
1919  0029 7b05          	ld	a,(OFST+3,sp)
1920  002b 95            	ld	xh,a
1921  002c cd0000        	call	L3_TI1_Config
1923  002f 84            	pop	a
1924                     ; 530     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1926  0030 7b08          	ld	a,(OFST+6,sp)
1927  0032 cd0000        	call	_TIM1_SetIC1Prescaler
1929                     ; 533     TI2_Config(icpolarity, icselection, TIM1_ICFilter);
1931  0035 7b09          	ld	a,(OFST+7,sp)
1932  0037 88            	push	a
1933  0038 7b03          	ld	a,(OFST+1,sp)
1934  003a 97            	ld	xl,a
1935  003b 7b02          	ld	a,(OFST+0,sp)
1936  003d 95            	ld	xh,a
1937  003e cd0000        	call	L5_TI2_Config
1939  0041 84            	pop	a
1940                     ; 536     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1942  0042 7b08          	ld	a,(OFST+6,sp)
1943  0044 cd0000        	call	_TIM1_SetIC2Prescaler
1946  0047 2024          	jra	L367
1947  0049               L167:
1948                     ; 541     TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
1948                     ; 542                (uint8_t)TIM1_ICFilter);
1950  0049 7b09          	ld	a,(OFST+7,sp)
1951  004b 88            	push	a
1952  004c 7b08          	ld	a,(OFST+6,sp)
1953  004e 97            	ld	xl,a
1954  004f 7b05          	ld	a,(OFST+3,sp)
1955  0051 95            	ld	xh,a
1956  0052 cd0000        	call	L5_TI2_Config
1958  0055 84            	pop	a
1959                     ; 545     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1961  0056 7b08          	ld	a,(OFST+6,sp)
1962  0058 cd0000        	call	_TIM1_SetIC2Prescaler
1964                     ; 548     TI1_Config(icpolarity, icselection, TIM1_ICFilter);
1966  005b 7b09          	ld	a,(OFST+7,sp)
1967  005d 88            	push	a
1968  005e 7b03          	ld	a,(OFST+1,sp)
1969  0060 97            	ld	xl,a
1970  0061 7b02          	ld	a,(OFST+0,sp)
1971  0063 95            	ld	xh,a
1972  0064 cd0000        	call	L3_TI1_Config
1974  0067 84            	pop	a
1975                     ; 551     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1977  0068 7b08          	ld	a,(OFST+6,sp)
1978  006a cd0000        	call	_TIM1_SetIC1Prescaler
1980  006d               L367:
1981                     ; 553 }
1984  006d 5b04          	addw	sp,#4
1985  006f 81            	ret
2040                     ; 561 void TIM1_Cmd(FunctionalState NewState)
2040                     ; 562 {
2041                     .text:	section	.text,new
2042  0000               _TIM1_Cmd:
2046                     ; 564   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2048                     ; 567   if (NewState != DISABLE)
2050  0000 4d            	tnz	a
2051  0001 2706          	jreq	L3101
2052                     ; 569     TIM1->CR1 |= TIM1_CR1_CEN;
2054  0003 72105250      	bset	21072,#0
2056  0007 2004          	jra	L5101
2057  0009               L3101:
2058                     ; 573     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_CEN);
2060  0009 72115250      	bres	21072,#0
2061  000d               L5101:
2062                     ; 575 }
2065  000d 81            	ret
2101                     ; 583 void TIM1_CtrlPWMOutputs(FunctionalState NewState)
2101                     ; 584 {
2102                     .text:	section	.text,new
2103  0000               _TIM1_CtrlPWMOutputs:
2107                     ; 586   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2109                     ; 590   if (NewState != DISABLE)
2111  0000 4d            	tnz	a
2112  0001 2706          	jreq	L5301
2113                     ; 592     TIM1->BKR |= TIM1_BKR_MOE;
2115  0003 721e526d      	bset	21101,#7
2117  0007 2004          	jra	L7301
2118  0009               L5301:
2119                     ; 596     TIM1->BKR &= (uint8_t)(~TIM1_BKR_MOE);
2121  0009 721f526d      	bres	21101,#7
2122  000d               L7301:
2123                     ; 598 }
2126  000d 81            	ret
2233                     ; 617 void TIM1_ITConfig(TIM1_IT_TypeDef  TIM1_IT, FunctionalState NewState)
2233                     ; 618 {
2234                     .text:	section	.text,new
2235  0000               _TIM1_ITConfig:
2237  0000 89            	pushw	x
2238       00000000      OFST:	set	0
2241                     ; 620   assert_param(IS_TIM1_IT_OK(TIM1_IT));
2243                     ; 621   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2245                     ; 623   if (NewState != DISABLE)
2247  0001 9f            	ld	a,xl
2248  0002 4d            	tnz	a
2249  0003 2709          	jreq	L7011
2250                     ; 626     TIM1->IER |= (uint8_t)TIM1_IT;
2252  0005 9e            	ld	a,xh
2253  0006 ca5254        	or	a,21076
2254  0009 c75254        	ld	21076,a
2256  000c 2009          	jra	L1111
2257  000e               L7011:
2258                     ; 631     TIM1->IER &= (uint8_t)(~(uint8_t)TIM1_IT);
2260  000e 7b01          	ld	a,(OFST+1,sp)
2261  0010 43            	cpl	a
2262  0011 c45254        	and	a,21076
2263  0014 c75254        	ld	21076,a
2264  0017               L1111:
2265                     ; 633 }
2268  0017 85            	popw	x
2269  0018 81            	ret
2293                     ; 640 void TIM1_InternalClockConfig(void)
2293                     ; 641 {
2294                     .text:	section	.text,new
2295  0000               _TIM1_InternalClockConfig:
2299                     ; 643   TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_SMS);
2301  0000 c65252        	ld	a,21074
2302  0003 a4f8          	and	a,#248
2303  0005 c75252        	ld	21074,a
2304                     ; 644 }
2307  0008 81            	ret
2424                     ; 662 void TIM1_ETRClockMode1Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
2424                     ; 663                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
2424                     ; 664                               uint8_t ExtTRGFilter)
2424                     ; 665 {
2425                     .text:	section	.text,new
2426  0000               _TIM1_ETRClockMode1Config:
2428  0000 89            	pushw	x
2429       00000000      OFST:	set	0
2432                     ; 667   assert_param(IS_TIM1_EXT_PRESCALER_OK(TIM1_ExtTRGPrescaler));
2434                     ; 668   assert_param(IS_TIM1_EXT_POLARITY_OK(TIM1_ExtTRGPolarity));
2436                     ; 671   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
2438  0001 7b05          	ld	a,(OFST+5,sp)
2439  0003 88            	push	a
2440  0004 9f            	ld	a,xl
2441  0005 97            	ld	xl,a
2442  0006 7b02          	ld	a,(OFST+2,sp)
2443  0008 95            	ld	xh,a
2444  0009 cd0000        	call	_TIM1_ETRConfig
2446  000c 84            	pop	a
2447                     ; 674   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~(uint8_t)(TIM1_SMCR_SMS | TIM1_SMCR_TS )))
2447                     ; 675                          | (uint8_t)((uint8_t)TIM1_SLAVEMODE_EXTERNAL1 | TIM1_TS_ETRF ));
2449  000d c65252        	ld	a,21074
2450  0010 a488          	and	a,#136
2451  0012 aa77          	or	a,#119
2452  0014 c75252        	ld	21074,a
2453                     ; 676 }
2456  0017 85            	popw	x
2457  0018 81            	ret
2515                     ; 694 void TIM1_ETRClockMode2Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
2515                     ; 695                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
2515                     ; 696                               uint8_t ExtTRGFilter)
2515                     ; 697 {
2516                     .text:	section	.text,new
2517  0000               _TIM1_ETRClockMode2Config:
2519  0000 89            	pushw	x
2520       00000000      OFST:	set	0
2523                     ; 699   assert_param(IS_TIM1_EXT_PRESCALER_OK(TIM1_ExtTRGPrescaler));
2525                     ; 700   assert_param(IS_TIM1_EXT_POLARITY_OK(TIM1_ExtTRGPolarity));
2527                     ; 703   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
2529  0001 7b05          	ld	a,(OFST+5,sp)
2530  0003 88            	push	a
2531  0004 9f            	ld	a,xl
2532  0005 97            	ld	xl,a
2533  0006 7b02          	ld	a,(OFST+2,sp)
2534  0008 95            	ld	xh,a
2535  0009 cd0000        	call	_TIM1_ETRConfig
2537  000c 84            	pop	a
2538                     ; 706   TIM1->ETR |= TIM1_ETR_ECE;
2540  000d 721c5253      	bset	21075,#6
2541                     ; 707 }
2544  0011 85            	popw	x
2545  0012 81            	ret
2601                     ; 725 void TIM1_ETRConfig(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
2601                     ; 726                     TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
2601                     ; 727                     uint8_t ExtTRGFilter)
2601                     ; 728 {
2602                     .text:	section	.text,new
2603  0000               _TIM1_ETRConfig:
2605  0000 89            	pushw	x
2606       00000000      OFST:	set	0
2609                     ; 730   assert_param(IS_TIM1_EXT_TRG_FILTER_OK(ExtTRGFilter));
2611                     ; 732   TIM1->ETR |= (uint8_t)((uint8_t)(TIM1_ExtTRGPrescaler | (uint8_t)TIM1_ExtTRGPolarity )|
2611                     ; 733                          (uint8_t)ExtTRGFilter );
2613  0001 9f            	ld	a,xl
2614  0002 1a01          	or	a,(OFST+1,sp)
2615  0004 1a05          	or	a,(OFST+5,sp)
2616  0006 ca5253        	or	a,21075
2617  0009 c75253        	ld	21075,a
2618                     ; 734 }
2621  000c 85            	popw	x
2622  000d 81            	ret
2711                     ; 751 void TIM1_TIxExternalClockConfig(TIM1_TIxExternalCLK1Source_TypeDef TIM1_TIxExternalCLKSource,
2711                     ; 752                                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
2711                     ; 753                                  uint8_t ICFilter)
2711                     ; 754 {
2712                     .text:	section	.text,new
2713  0000               _TIM1_TIxExternalClockConfig:
2715  0000 89            	pushw	x
2716       00000000      OFST:	set	0
2719                     ; 756   assert_param(IS_TIM1_TIXCLK_SOURCE_OK(TIM1_TIxExternalCLKSource));
2721                     ; 757   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
2723                     ; 758   assert_param(IS_TIM1_IC_FILTER_OK(ICFilter));
2725                     ; 761   if (TIM1_TIxExternalCLKSource == TIM1_TIXEXTERNALCLK1SOURCE_TI2)
2727  0001 9e            	ld	a,xh
2728  0002 a160          	cp	a,#96
2729  0004 260e          	jrne	L1131
2730                     ; 763     TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
2732  0006 7b05          	ld	a,(OFST+5,sp)
2733  0008 88            	push	a
2734  0009 9f            	ld	a,xl
2735  000a ae0001        	ldw	x,#1
2736  000d 95            	ld	xh,a
2737  000e cd0000        	call	L5_TI2_Config
2739  0011 84            	pop	a
2741  0012 200d          	jra	L3131
2742  0014               L1131:
2743                     ; 767     TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
2745  0014 7b05          	ld	a,(OFST+5,sp)
2746  0016 88            	push	a
2747  0017 7b03          	ld	a,(OFST+3,sp)
2748  0019 ae0001        	ldw	x,#1
2749  001c 95            	ld	xh,a
2750  001d cd0000        	call	L3_TI1_Config
2752  0020 84            	pop	a
2753  0021               L3131:
2754                     ; 771   TIM1_SelectInputTrigger((TIM1_TS_TypeDef)TIM1_TIxExternalCLKSource);
2756  0021 7b01          	ld	a,(OFST+1,sp)
2757  0023 cd0000        	call	_TIM1_SelectInputTrigger
2759                     ; 774   TIM1->SMCR |= (uint8_t)(TIM1_SLAVEMODE_EXTERNAL1);
2761  0026 c65252        	ld	a,21074
2762  0029 aa07          	or	a,#7
2763  002b c75252        	ld	21074,a
2764                     ; 775 }
2767  002e 85            	popw	x
2768  002f 81            	ret
2853                     ; 787 void TIM1_SelectInputTrigger(TIM1_TS_TypeDef TIM1_InputTriggerSource)
2853                     ; 788 {
2854                     .text:	section	.text,new
2855  0000               _TIM1_SelectInputTrigger:
2857  0000 88            	push	a
2858       00000000      OFST:	set	0
2861                     ; 790   assert_param(IS_TIM1_TRIGGER_SELECTION_OK(TIM1_InputTriggerSource));
2863                     ; 793   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_TS)) | (uint8_t)TIM1_InputTriggerSource);
2865  0001 c65252        	ld	a,21074
2866  0004 a48f          	and	a,#143
2867  0006 1a01          	or	a,(OFST+1,sp)
2868  0008 c75252        	ld	21074,a
2869                     ; 794 }
2872  000b 84            	pop	a
2873  000c 81            	ret
2909                     ; 803 void TIM1_UpdateDisableConfig(FunctionalState NewState)
2909                     ; 804 {
2910                     .text:	section	.text,new
2911  0000               _TIM1_UpdateDisableConfig:
2915                     ; 806   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2917                     ; 809   if (NewState != DISABLE)
2919  0000 4d            	tnz	a
2920  0001 2706          	jreq	L1731
2921                     ; 811     TIM1->CR1 |= TIM1_CR1_UDIS;
2923  0003 72125250      	bset	21072,#1
2925  0007 2004          	jra	L3731
2926  0009               L1731:
2927                     ; 815     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_UDIS);
2929  0009 72135250      	bres	21072,#1
2930  000d               L3731:
2931                     ; 817 }
2934  000d 81            	ret
2992                     ; 827 void TIM1_UpdateRequestConfig(TIM1_UpdateSource_TypeDef TIM1_UpdateSource)
2992                     ; 828 {
2993                     .text:	section	.text,new
2994  0000               _TIM1_UpdateRequestConfig:
2998                     ; 830   assert_param(IS_TIM1_UPDATE_SOURCE_OK(TIM1_UpdateSource));
3000                     ; 833   if (TIM1_UpdateSource != TIM1_UPDATESOURCE_GLOBAL)
3002  0000 4d            	tnz	a
3003  0001 2706          	jreq	L3241
3004                     ; 835     TIM1->CR1 |= TIM1_CR1_URS;
3006  0003 72145250      	bset	21072,#2
3008  0007 2004          	jra	L5241
3009  0009               L3241:
3010                     ; 839     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_URS);
3012  0009 72155250      	bres	21072,#2
3013  000d               L5241:
3014                     ; 841 }
3017  000d 81            	ret
3053                     ; 849 void TIM1_SelectHallSensor(FunctionalState NewState)
3053                     ; 850 {
3054                     .text:	section	.text,new
3055  0000               _TIM1_SelectHallSensor:
3059                     ; 852   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3061                     ; 855   if (NewState != DISABLE)
3063  0000 4d            	tnz	a
3064  0001 2706          	jreq	L5441
3065                     ; 857     TIM1->CR2 |= TIM1_CR2_TI1S;
3067  0003 721e5251      	bset	21073,#7
3069  0007 2004          	jra	L7441
3070  0009               L5441:
3071                     ; 861     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_TI1S);
3073  0009 721f5251      	bres	21073,#7
3074  000d               L7441:
3075                     ; 863 }
3078  000d 81            	ret
3135                     ; 873 void TIM1_SelectOnePulseMode(TIM1_OPMode_TypeDef TIM1_OPMode)
3135                     ; 874 {
3136                     .text:	section	.text,new
3137  0000               _TIM1_SelectOnePulseMode:
3141                     ; 876   assert_param(IS_TIM1_OPM_MODE_OK(TIM1_OPMode));
3143                     ; 879   if (TIM1_OPMode != TIM1_OPMODE_REPETITIVE)
3145  0000 4d            	tnz	a
3146  0001 2706          	jreq	L7741
3147                     ; 881     TIM1->CR1 |= TIM1_CR1_OPM;
3149  0003 72165250      	bset	21072,#3
3151  0007 2004          	jra	L1051
3152  0009               L7741:
3153                     ; 885     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_OPM);
3155  0009 72175250      	bres	21072,#3
3156  000d               L1051:
3157                     ; 888 }
3160  000d 81            	ret
3258                     ; 903 void TIM1_SelectOutputTrigger(TIM1_TRGOSource_TypeDef TIM1_TRGOSource)
3258                     ; 904 {
3259                     .text:	section	.text,new
3260  0000               _TIM1_SelectOutputTrigger:
3262  0000 88            	push	a
3263       00000000      OFST:	set	0
3266                     ; 906   assert_param(IS_TIM1_TRGO_SOURCE_OK(TIM1_TRGOSource));
3268                     ; 909   TIM1->CR2 = (uint8_t)((uint8_t)(TIM1->CR2 & (uint8_t)(~TIM1_CR2_MMS)) | 
3268                     ; 910                         (uint8_t) TIM1_TRGOSource);
3270  0001 c65251        	ld	a,21073
3271  0004 a48f          	and	a,#143
3272  0006 1a01          	or	a,(OFST+1,sp)
3273  0008 c75251        	ld	21073,a
3274                     ; 911 }
3277  000b 84            	pop	a
3278  000c 81            	ret
3352                     ; 923 void TIM1_SelectSlaveMode(TIM1_SlaveMode_TypeDef TIM1_SlaveMode)
3352                     ; 924 {
3353                     .text:	section	.text,new
3354  0000               _TIM1_SelectSlaveMode:
3356  0000 88            	push	a
3357       00000000      OFST:	set	0
3360                     ; 926   assert_param(IS_TIM1_SLAVE_MODE_OK(TIM1_SlaveMode));
3362                     ; 929   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_SMS)) |
3362                     ; 930                          (uint8_t)TIM1_SlaveMode);
3364  0001 c65252        	ld	a,21074
3365  0004 a4f8          	and	a,#248
3366  0006 1a01          	or	a,(OFST+1,sp)
3367  0008 c75252        	ld	21074,a
3368                     ; 931 }
3371  000b 84            	pop	a
3372  000c 81            	ret
3408                     ; 939 void TIM1_SelectMasterSlaveMode(FunctionalState NewState)
3408                     ; 940 {
3409                     .text:	section	.text,new
3410  0000               _TIM1_SelectMasterSlaveMode:
3414                     ; 942   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3416                     ; 945   if (NewState != DISABLE)
3418  0000 4d            	tnz	a
3419  0001 2706          	jreq	L3161
3420                     ; 947     TIM1->SMCR |= TIM1_SMCR_MSM;
3422  0003 721e5252      	bset	21074,#7
3424  0007 2004          	jra	L5161
3425  0009               L3161:
3426                     ; 951     TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_MSM);
3428  0009 721f5252      	bres	21074,#7
3429  000d               L5161:
3430                     ; 953 }
3433  000d 81            	ret
3519                     ; 975 void TIM1_EncoderInterfaceConfig(TIM1_EncoderMode_TypeDef TIM1_EncoderMode,
3519                     ; 976                                  TIM1_ICPolarity_TypeDef TIM1_IC1Polarity,
3519                     ; 977                                  TIM1_ICPolarity_TypeDef TIM1_IC2Polarity)
3519                     ; 978 {
3520                     .text:	section	.text,new
3521  0000               _TIM1_EncoderInterfaceConfig:
3523  0000 89            	pushw	x
3524       00000000      OFST:	set	0
3527                     ; 980   assert_param(IS_TIM1_ENCODER_MODE_OK(TIM1_EncoderMode));
3529                     ; 981   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_IC1Polarity));
3531                     ; 982   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_IC2Polarity));
3533                     ; 985   if (TIM1_IC1Polarity != TIM1_ICPOLARITY_RISING)
3535  0001 9f            	ld	a,xl
3536  0002 4d            	tnz	a
3537  0003 2706          	jreq	L7561
3538                     ; 987     TIM1->CCER1 |= TIM1_CCER1_CC1P;
3540  0005 7212525c      	bset	21084,#1
3542  0009 2004          	jra	L1661
3543  000b               L7561:
3544                     ; 991     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
3546  000b 7213525c      	bres	21084,#1
3547  000f               L1661:
3548                     ; 994   if (TIM1_IC2Polarity != TIM1_ICPOLARITY_RISING)
3550  000f 0d05          	tnz	(OFST+5,sp)
3551  0011 2706          	jreq	L3661
3552                     ; 996     TIM1->CCER1 |= TIM1_CCER1_CC2P;
3554  0013 721a525c      	bset	21084,#5
3556  0017 2004          	jra	L5661
3557  0019               L3661:
3558                     ; 1000     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
3560  0019 721b525c      	bres	21084,#5
3561  001d               L5661:
3562                     ; 1003   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(TIM1_SMCR_MSM | TIM1_SMCR_TS))
3562                     ; 1004                          | (uint8_t) TIM1_EncoderMode);
3564  001d c65252        	ld	a,21074
3565  0020 a4f0          	and	a,#240
3566  0022 1a01          	or	a,(OFST+1,sp)
3567  0024 c75252        	ld	21074,a
3568                     ; 1007   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_CCxS)) 
3568                     ; 1008                           | (uint8_t) CCMR_TIxDirect_Set);
3570  0027 c65258        	ld	a,21080
3571  002a a4fc          	and	a,#252
3572  002c aa01          	or	a,#1
3573  002e c75258        	ld	21080,a
3574                     ; 1009   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_CCxS))
3574                     ; 1010                           | (uint8_t) CCMR_TIxDirect_Set);
3576  0031 c65259        	ld	a,21081
3577  0034 a4fc          	and	a,#252
3578  0036 aa01          	or	a,#1
3579  0038 c75259        	ld	21081,a
3580                     ; 1011 }
3583  003b 85            	popw	x
3584  003c 81            	ret
3651                     ; 1023 void TIM1_PrescalerConfig(uint16_t Prescaler,
3651                     ; 1024                           TIM1_PSCReloadMode_TypeDef TIM1_PSCReloadMode)
3651                     ; 1025 {
3652                     .text:	section	.text,new
3653  0000               _TIM1_PrescalerConfig:
3655  0000 89            	pushw	x
3656       00000000      OFST:	set	0
3659                     ; 1027   assert_param(IS_TIM1_PRESCALER_RELOAD_OK(TIM1_PSCReloadMode));
3661                     ; 1030   TIM1->PSCRH = (uint8_t)(Prescaler >> 8);
3663  0001 9e            	ld	a,xh
3664  0002 c75260        	ld	21088,a
3665                     ; 1031   TIM1->PSCRL = (uint8_t)(Prescaler);
3667  0005 9f            	ld	a,xl
3668  0006 c75261        	ld	21089,a
3669                     ; 1034   TIM1->EGR = (uint8_t)TIM1_PSCReloadMode;
3671  0009 7b05          	ld	a,(OFST+5,sp)
3672  000b c75257        	ld	21079,a
3673                     ; 1035 }
3676  000e 85            	popw	x
3677  000f 81            	ret
3713                     ; 1048 void TIM1_CounterModeConfig(TIM1_CounterMode_TypeDef TIM1_CounterMode)
3713                     ; 1049 {
3714                     .text:	section	.text,new
3715  0000               _TIM1_CounterModeConfig:
3717  0000 88            	push	a
3718       00000000      OFST:	set	0
3721                     ; 1051   assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
3723                     ; 1055   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)((uint8_t)(~TIM1_CR1_CMS) & (uint8_t)(~TIM1_CR1_DIR)))
3723                     ; 1056                         | (uint8_t)TIM1_CounterMode);
3725  0001 c65250        	ld	a,21072
3726  0004 a48f          	and	a,#143
3727  0006 1a01          	or	a,(OFST+1,sp)
3728  0008 c75250        	ld	21072,a
3729                     ; 1057 }
3732  000b 84            	pop	a
3733  000c 81            	ret
3791                     ; 1067 void TIM1_ForcedOC1Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3791                     ; 1068 {
3792                     .text:	section	.text,new
3793  0000               _TIM1_ForcedOC1Config:
3795  0000 88            	push	a
3796       00000000      OFST:	set	0
3799                     ; 1070   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3801                     ; 1073   TIM1->CCMR1 =  (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM))|
3801                     ; 1074                            (uint8_t)TIM1_ForcedAction);
3803  0001 c65258        	ld	a,21080
3804  0004 a48f          	and	a,#143
3805  0006 1a01          	or	a,(OFST+1,sp)
3806  0008 c75258        	ld	21080,a
3807                     ; 1075 }
3810  000b 84            	pop	a
3811  000c 81            	ret
3847                     ; 1085 void TIM1_ForcedOC2Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3847                     ; 1086 {
3848                     .text:	section	.text,new
3849  0000               _TIM1_ForcedOC2Config:
3851  0000 88            	push	a
3852       00000000      OFST:	set	0
3855                     ; 1088   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3857                     ; 1091   TIM1->CCMR2  =  (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM))
3857                     ; 1092                             | (uint8_t)TIM1_ForcedAction);
3859  0001 c65259        	ld	a,21081
3860  0004 a48f          	and	a,#143
3861  0006 1a01          	or	a,(OFST+1,sp)
3862  0008 c75259        	ld	21081,a
3863                     ; 1093 }
3866  000b 84            	pop	a
3867  000c 81            	ret
3903                     ; 1104 void TIM1_ForcedOC3Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3903                     ; 1105 {
3904                     .text:	section	.text,new
3905  0000               _TIM1_ForcedOC3Config:
3907  0000 88            	push	a
3908       00000000      OFST:	set	0
3911                     ; 1107   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3913                     ; 1110   TIM1->CCMR3  =  (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM))  
3913                     ; 1111                             | (uint8_t)TIM1_ForcedAction);
3915  0001 c6525a        	ld	a,21082
3916  0004 a48f          	and	a,#143
3917  0006 1a01          	or	a,(OFST+1,sp)
3918  0008 c7525a        	ld	21082,a
3919                     ; 1112 }
3922  000b 84            	pop	a
3923  000c 81            	ret
3959                     ; 1123 void TIM1_ForcedOC4Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3959                     ; 1124 {
3960                     .text:	section	.text,new
3961  0000               _TIM1_ForcedOC4Config:
3963  0000 88            	push	a
3964       00000000      OFST:	set	0
3967                     ; 1126   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3969                     ; 1129   TIM1->CCMR4  =  (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) 
3969                     ; 1130                             | (uint8_t)TIM1_ForcedAction);
3971  0001 c6525b        	ld	a,21083
3972  0004 a48f          	and	a,#143
3973  0006 1a01          	or	a,(OFST+1,sp)
3974  0008 c7525b        	ld	21083,a
3975                     ; 1131 }
3978  000b 84            	pop	a
3979  000c 81            	ret
4015                     ; 1139 void TIM1_ARRPreloadConfig(FunctionalState NewState)
4015                     ; 1140 {
4016                     .text:	section	.text,new
4017  0000               _TIM1_ARRPreloadConfig:
4021                     ; 1142   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4023                     ; 1145   if (NewState != DISABLE)
4025  0000 4d            	tnz	a
4026  0001 2706          	jreq	L5502
4027                     ; 1147     TIM1->CR1 |= TIM1_CR1_ARPE;
4029  0003 721e5250      	bset	21072,#7
4031  0007 2004          	jra	L7502
4032  0009               L5502:
4033                     ; 1151     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_ARPE);
4035  0009 721f5250      	bres	21072,#7
4036  000d               L7502:
4037                     ; 1153 }
4040  000d 81            	ret
4075                     ; 1161 void TIM1_SelectCOM(FunctionalState NewState)
4075                     ; 1162 {
4076                     .text:	section	.text,new
4077  0000               _TIM1_SelectCOM:
4081                     ; 1164   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4083                     ; 1167   if (NewState != DISABLE)
4085  0000 4d            	tnz	a
4086  0001 2706          	jreq	L7702
4087                     ; 1169     TIM1->CR2 |= TIM1_CR2_COMS;
4089  0003 72145251      	bset	21073,#2
4091  0007 2004          	jra	L1012
4092  0009               L7702:
4093                     ; 1173     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_COMS);
4095  0009 72155251      	bres	21073,#2
4096  000d               L1012:
4097                     ; 1175 }
4100  000d 81            	ret
4136                     ; 1183 void TIM1_CCPreloadControl(FunctionalState NewState)
4136                     ; 1184 {
4137                     .text:	section	.text,new
4138  0000               _TIM1_CCPreloadControl:
4142                     ; 1186   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4144                     ; 1189   if (NewState != DISABLE)
4146  0000 4d            	tnz	a
4147  0001 2706          	jreq	L1212
4148                     ; 1191     TIM1->CR2 |= TIM1_CR2_CCPC;
4150  0003 72105251      	bset	21073,#0
4152  0007 2004          	jra	L3212
4153  0009               L1212:
4154                     ; 1195     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCPC);
4156  0009 72115251      	bres	21073,#0
4157  000d               L3212:
4158                     ; 1197 }
4161  000d 81            	ret
4197                     ; 1205 void TIM1_OC1PreloadConfig(FunctionalState NewState)
4197                     ; 1206 {
4198                     .text:	section	.text,new
4199  0000               _TIM1_OC1PreloadConfig:
4203                     ; 1208   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4205                     ; 1211   if (NewState != DISABLE)
4207  0000 4d            	tnz	a
4208  0001 2706          	jreq	L3412
4209                     ; 1213     TIM1->CCMR1 |= TIM1_CCMR_OCxPE;
4211  0003 72165258      	bset	21080,#3
4213  0007 2004          	jra	L5412
4214  0009               L3412:
4215                     ; 1217     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4217  0009 72175258      	bres	21080,#3
4218  000d               L5412:
4219                     ; 1219 }
4222  000d 81            	ret
4258                     ; 1227 void TIM1_OC2PreloadConfig(FunctionalState NewState)
4258                     ; 1228 {
4259                     .text:	section	.text,new
4260  0000               _TIM1_OC2PreloadConfig:
4264                     ; 1230   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4266                     ; 1233   if (NewState != DISABLE)
4268  0000 4d            	tnz	a
4269  0001 2706          	jreq	L5612
4270                     ; 1235     TIM1->CCMR2 |= TIM1_CCMR_OCxPE;
4272  0003 72165259      	bset	21081,#3
4274  0007 2004          	jra	L7612
4275  0009               L5612:
4276                     ; 1239     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4278  0009 72175259      	bres	21081,#3
4279  000d               L7612:
4280                     ; 1241 }
4283  000d 81            	ret
4319                     ; 1249 void TIM1_OC3PreloadConfig(FunctionalState NewState)
4319                     ; 1250 {
4320                     .text:	section	.text,new
4321  0000               _TIM1_OC3PreloadConfig:
4325                     ; 1252   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4327                     ; 1255   if (NewState != DISABLE)
4329  0000 4d            	tnz	a
4330  0001 2706          	jreq	L7022
4331                     ; 1257     TIM1->CCMR3 |= TIM1_CCMR_OCxPE;
4333  0003 7216525a      	bset	21082,#3
4335  0007 2004          	jra	L1122
4336  0009               L7022:
4337                     ; 1261     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4339  0009 7217525a      	bres	21082,#3
4340  000d               L1122:
4341                     ; 1263 }
4344  000d 81            	ret
4380                     ; 1271 void TIM1_OC4PreloadConfig(FunctionalState NewState)
4380                     ; 1272 {
4381                     .text:	section	.text,new
4382  0000               _TIM1_OC4PreloadConfig:
4386                     ; 1274   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4388                     ; 1277   if (NewState != DISABLE)
4390  0000 4d            	tnz	a
4391  0001 2706          	jreq	L1322
4392                     ; 1279     TIM1->CCMR4 |= TIM1_CCMR_OCxPE;
4394  0003 7216525b      	bset	21083,#3
4396  0007 2004          	jra	L3322
4397  0009               L1322:
4398                     ; 1283     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4400  0009 7217525b      	bres	21083,#3
4401  000d               L3322:
4402                     ; 1285 }
4405  000d 81            	ret
4440                     ; 1293 void TIM1_OC1FastConfig(FunctionalState NewState)
4440                     ; 1294 {
4441                     .text:	section	.text,new
4442  0000               _TIM1_OC1FastConfig:
4446                     ; 1296   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4448                     ; 1299   if (NewState != DISABLE)
4450  0000 4d            	tnz	a
4451  0001 2706          	jreq	L3522
4452                     ; 1301     TIM1->CCMR1 |= TIM1_CCMR_OCxFE;
4454  0003 72145258      	bset	21080,#2
4456  0007 2004          	jra	L5522
4457  0009               L3522:
4458                     ; 1305     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4460  0009 72155258      	bres	21080,#2
4461  000d               L5522:
4462                     ; 1307 }
4465  000d 81            	ret
4500                     ; 1315 void TIM1_OC2FastConfig(FunctionalState NewState)
4500                     ; 1316 {
4501                     .text:	section	.text,new
4502  0000               _TIM1_OC2FastConfig:
4506                     ; 1318   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4508                     ; 1321   if (NewState != DISABLE)
4510  0000 4d            	tnz	a
4511  0001 2706          	jreq	L5722
4512                     ; 1323     TIM1->CCMR2 |= TIM1_CCMR_OCxFE;
4514  0003 72145259      	bset	21081,#2
4516  0007 2004          	jra	L7722
4517  0009               L5722:
4518                     ; 1327     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4520  0009 72155259      	bres	21081,#2
4521  000d               L7722:
4522                     ; 1329 }
4525  000d 81            	ret
4560                     ; 1337 void TIM1_OC3FastConfig(FunctionalState NewState)
4560                     ; 1338 {
4561                     .text:	section	.text,new
4562  0000               _TIM1_OC3FastConfig:
4566                     ; 1340   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4568                     ; 1343   if (NewState != DISABLE)
4570  0000 4d            	tnz	a
4571  0001 2706          	jreq	L7132
4572                     ; 1345     TIM1->CCMR3 |= TIM1_CCMR_OCxFE;
4574  0003 7214525a      	bset	21082,#2
4576  0007 2004          	jra	L1232
4577  0009               L7132:
4578                     ; 1349     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4580  0009 7215525a      	bres	21082,#2
4581  000d               L1232:
4582                     ; 1351 }
4585  000d 81            	ret
4620                     ; 1359 void TIM1_OC4FastConfig(FunctionalState NewState)
4620                     ; 1360 {
4621                     .text:	section	.text,new
4622  0000               _TIM1_OC4FastConfig:
4626                     ; 1362   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4628                     ; 1365   if (NewState != DISABLE)
4630  0000 4d            	tnz	a
4631  0001 2706          	jreq	L1432
4632                     ; 1367     TIM1->CCMR4 |= TIM1_CCMR_OCxFE;
4634  0003 7214525b      	bset	21083,#2
4636  0007 2004          	jra	L3432
4637  0009               L1432:
4638                     ; 1371     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4640  0009 7215525b      	bres	21083,#2
4641  000d               L3432:
4642                     ; 1373 }
4645  000d 81            	ret
4750                     ; 1389 void TIM1_GenerateEvent(TIM1_EventSource_TypeDef TIM1_EventSource)
4750                     ; 1390 {
4751                     .text:	section	.text,new
4752  0000               _TIM1_GenerateEvent:
4756                     ; 1392   assert_param(IS_TIM1_EVENT_SOURCE_OK(TIM1_EventSource));
4758                     ; 1395   TIM1->EGR = (uint8_t)TIM1_EventSource;
4760  0000 c75257        	ld	21079,a
4761                     ; 1396 }
4764  0003 81            	ret
4800                     ; 1406 void TIM1_OC1PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
4800                     ; 1407 {
4801                     .text:	section	.text,new
4802  0000               _TIM1_OC1PolarityConfig:
4806                     ; 1409   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
4808                     ; 1412   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
4810  0000 4d            	tnz	a
4811  0001 2706          	jreq	L5242
4812                     ; 1414     TIM1->CCER1 |= TIM1_CCER1_CC1P;
4814  0003 7212525c      	bset	21084,#1
4816  0007 2004          	jra	L7242
4817  0009               L5242:
4818                     ; 1418     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
4820  0009 7213525c      	bres	21084,#1
4821  000d               L7242:
4822                     ; 1420 }
4825  000d 81            	ret
4861                     ; 1430 void TIM1_OC1NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
4861                     ; 1431 {
4862                     .text:	section	.text,new
4863  0000               _TIM1_OC1NPolarityConfig:
4867                     ; 1433   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
4869                     ; 1436   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
4871  0000 4d            	tnz	a
4872  0001 2706          	jreq	L7442
4873                     ; 1438     TIM1->CCER1 |= TIM1_CCER1_CC1NP;
4875  0003 7216525c      	bset	21084,#3
4877  0007 2004          	jra	L1542
4878  0009               L7442:
4879                     ; 1442     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NP);
4881  0009 7217525c      	bres	21084,#3
4882  000d               L1542:
4883                     ; 1444 }
4886  000d 81            	ret
4922                     ; 1454 void TIM1_OC2PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
4922                     ; 1455 {
4923                     .text:	section	.text,new
4924  0000               _TIM1_OC2PolarityConfig:
4928                     ; 1457   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
4930                     ; 1460   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
4932  0000 4d            	tnz	a
4933  0001 2706          	jreq	L1742
4934                     ; 1462     TIM1->CCER1 |= TIM1_CCER1_CC2P;
4936  0003 721a525c      	bset	21084,#5
4938  0007 2004          	jra	L3742
4939  0009               L1742:
4940                     ; 1466     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
4942  0009 721b525c      	bres	21084,#5
4943  000d               L3742:
4944                     ; 1468 }
4947  000d 81            	ret
4983                     ; 1478 void TIM1_OC2NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
4983                     ; 1479 {
4984                     .text:	section	.text,new
4985  0000               _TIM1_OC2NPolarityConfig:
4989                     ; 1481   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
4991                     ; 1484   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
4993  0000 4d            	tnz	a
4994  0001 2706          	jreq	L3152
4995                     ; 1486     TIM1->CCER1 |= TIM1_CCER1_CC2NP;
4997  0003 721e525c      	bset	21084,#7
4999  0007 2004          	jra	L5152
5000  0009               L3152:
5001                     ; 1490     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NP);
5003  0009 721f525c      	bres	21084,#7
5004  000d               L5152:
5005                     ; 1492 }
5008  000d 81            	ret
5044                     ; 1502 void TIM1_OC3PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
5044                     ; 1503 {
5045                     .text:	section	.text,new
5046  0000               _TIM1_OC3PolarityConfig:
5050                     ; 1505   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
5052                     ; 1508   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
5054  0000 4d            	tnz	a
5055  0001 2706          	jreq	L5352
5056                     ; 1510     TIM1->CCER2 |= TIM1_CCER2_CC3P;
5058  0003 7212525d      	bset	21085,#1
5060  0007 2004          	jra	L7352
5061  0009               L5352:
5062                     ; 1514     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
5064  0009 7213525d      	bres	21085,#1
5065  000d               L7352:
5066                     ; 1516 }
5069  000d 81            	ret
5105                     ; 1527 void TIM1_OC3NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
5105                     ; 1528 {
5106                     .text:	section	.text,new
5107  0000               _TIM1_OC3NPolarityConfig:
5111                     ; 1530   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
5113                     ; 1533   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
5115  0000 4d            	tnz	a
5116  0001 2706          	jreq	L7552
5117                     ; 1535     TIM1->CCER2 |= TIM1_CCER2_CC3NP;
5119  0003 7216525d      	bset	21085,#3
5121  0007 2004          	jra	L1652
5122  0009               L7552:
5123                     ; 1539     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NP);
5125  0009 7217525d      	bres	21085,#3
5126  000d               L1652:
5127                     ; 1541 }
5130  000d 81            	ret
5166                     ; 1551 void TIM1_OC4PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
5166                     ; 1552 {
5167                     .text:	section	.text,new
5168  0000               _TIM1_OC4PolarityConfig:
5172                     ; 1554   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
5174                     ; 1557   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
5176  0000 4d            	tnz	a
5177  0001 2706          	jreq	L1062
5178                     ; 1559     TIM1->CCER2 |= TIM1_CCER2_CC4P;
5180  0003 721a525d      	bset	21085,#5
5182  0007 2004          	jra	L3062
5183  0009               L1062:
5184                     ; 1563     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
5186  0009 721b525d      	bres	21085,#5
5187  000d               L3062:
5188                     ; 1565 }
5191  000d 81            	ret
5236                     ; 1579 void TIM1_CCxCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
5236                     ; 1580 {
5237                     .text:	section	.text,new
5238  0000               _TIM1_CCxCmd:
5240  0000 89            	pushw	x
5241       00000000      OFST:	set	0
5244                     ; 1582   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
5246                     ; 1583   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5248                     ; 1585   if (TIM1_Channel == TIM1_CHANNEL_1)
5250  0001 9e            	ld	a,xh
5251  0002 4d            	tnz	a
5252  0003 2610          	jrne	L7262
5253                     ; 1588     if (NewState != DISABLE)
5255  0005 9f            	ld	a,xl
5256  0006 4d            	tnz	a
5257  0007 2706          	jreq	L1362
5258                     ; 1590       TIM1->CCER1 |= TIM1_CCER1_CC1E;
5260  0009 7210525c      	bset	21084,#0
5262  000d 2040          	jra	L5362
5263  000f               L1362:
5264                     ; 1594       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
5266  000f 7211525c      	bres	21084,#0
5267  0013 203a          	jra	L5362
5268  0015               L7262:
5269                     ; 1598   else if (TIM1_Channel == TIM1_CHANNEL_2)
5271  0015 7b01          	ld	a,(OFST+1,sp)
5272  0017 a101          	cp	a,#1
5273  0019 2610          	jrne	L7362
5274                     ; 1601     if (NewState != DISABLE)
5276  001b 0d02          	tnz	(OFST+2,sp)
5277  001d 2706          	jreq	L1462
5278                     ; 1603       TIM1->CCER1 |= TIM1_CCER1_CC2E;
5280  001f 7218525c      	bset	21084,#4
5282  0023 202a          	jra	L5362
5283  0025               L1462:
5284                     ; 1607       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
5286  0025 7219525c      	bres	21084,#4
5287  0029 2024          	jra	L5362
5288  002b               L7362:
5289                     ; 1610   else if (TIM1_Channel == TIM1_CHANNEL_3)
5291  002b 7b01          	ld	a,(OFST+1,sp)
5292  002d a102          	cp	a,#2
5293  002f 2610          	jrne	L7462
5294                     ; 1613     if (NewState != DISABLE)
5296  0031 0d02          	tnz	(OFST+2,sp)
5297  0033 2706          	jreq	L1562
5298                     ; 1615       TIM1->CCER2 |= TIM1_CCER2_CC3E;
5300  0035 7210525d      	bset	21085,#0
5302  0039 2014          	jra	L5362
5303  003b               L1562:
5304                     ; 1619       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
5306  003b 7211525d      	bres	21085,#0
5307  003f 200e          	jra	L5362
5308  0041               L7462:
5309                     ; 1625     if (NewState != DISABLE)
5311  0041 0d02          	tnz	(OFST+2,sp)
5312  0043 2706          	jreq	L7562
5313                     ; 1627       TIM1->CCER2 |= TIM1_CCER2_CC4E;
5315  0045 7218525d      	bset	21085,#4
5317  0049 2004          	jra	L5362
5318  004b               L7562:
5319                     ; 1631       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
5321  004b 7219525d      	bres	21085,#4
5322  004f               L5362:
5323                     ; 1634 }
5326  004f 85            	popw	x
5327  0050 81            	ret
5372                     ; 1647 void TIM1_CCxNCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
5372                     ; 1648 {
5373                     .text:	section	.text,new
5374  0000               _TIM1_CCxNCmd:
5376  0000 89            	pushw	x
5377       00000000      OFST:	set	0
5380                     ; 1650   assert_param(IS_TIM1_COMPLEMENTARY_CHANNEL_OK(TIM1_Channel));
5382                     ; 1651   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5384                     ; 1653   if (TIM1_Channel == TIM1_CHANNEL_1)
5386  0001 9e            	ld	a,xh
5387  0002 4d            	tnz	a
5388  0003 2610          	jrne	L5072
5389                     ; 1656     if (NewState != DISABLE)
5391  0005 9f            	ld	a,xl
5392  0006 4d            	tnz	a
5393  0007 2706          	jreq	L7072
5394                     ; 1658       TIM1->CCER1 |= TIM1_CCER1_CC1NE;
5396  0009 7214525c      	bset	21084,#2
5398  000d 202a          	jra	L3172
5399  000f               L7072:
5400                     ; 1662       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NE);
5402  000f 7215525c      	bres	21084,#2
5403  0013 2024          	jra	L3172
5404  0015               L5072:
5405                     ; 1665   else if (TIM1_Channel == TIM1_CHANNEL_2)
5407  0015 7b01          	ld	a,(OFST+1,sp)
5408  0017 a101          	cp	a,#1
5409  0019 2610          	jrne	L5172
5410                     ; 1668     if (NewState != DISABLE)
5412  001b 0d02          	tnz	(OFST+2,sp)
5413  001d 2706          	jreq	L7172
5414                     ; 1670       TIM1->CCER1 |= TIM1_CCER1_CC2NE;
5416  001f 721c525c      	bset	21084,#6
5418  0023 2014          	jra	L3172
5419  0025               L7172:
5420                     ; 1674       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NE);
5422  0025 721d525c      	bres	21084,#6
5423  0029 200e          	jra	L3172
5424  002b               L5172:
5425                     ; 1680     if (NewState != DISABLE)
5427  002b 0d02          	tnz	(OFST+2,sp)
5428  002d 2706          	jreq	L5272
5429                     ; 1682       TIM1->CCER2 |= TIM1_CCER2_CC3NE;
5431  002f 7214525d      	bset	21085,#2
5433  0033 2004          	jra	L3172
5434  0035               L5272:
5435                     ; 1686       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NE);
5437  0035 7215525d      	bres	21085,#2
5438  0039               L3172:
5439                     ; 1689 }
5442  0039 85            	popw	x
5443  003a 81            	ret
5488                     ; 1712 void TIM1_SelectOCxM(TIM1_Channel_TypeDef TIM1_Channel, TIM1_OCMode_TypeDef TIM1_OCMode)
5488                     ; 1713 {
5489                     .text:	section	.text,new
5490  0000               _TIM1_SelectOCxM:
5492  0000 89            	pushw	x
5493       00000000      OFST:	set	0
5496                     ; 1715   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
5498                     ; 1716   assert_param(IS_TIM1_OCM_OK(TIM1_OCMode));
5500                     ; 1718   if (TIM1_Channel == TIM1_CHANNEL_1)
5502  0001 9e            	ld	a,xh
5503  0002 4d            	tnz	a
5504  0003 2610          	jrne	L3572
5505                     ; 1721     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
5507  0005 7211525c      	bres	21084,#0
5508                     ; 1724     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) 
5508                     ; 1725                             | (uint8_t)TIM1_OCMode);
5510  0009 c65258        	ld	a,21080
5511  000c a48f          	and	a,#143
5512  000e 1a02          	or	a,(OFST+2,sp)
5513  0010 c75258        	ld	21080,a
5515  0013 203a          	jra	L5572
5516  0015               L3572:
5517                     ; 1727   else if (TIM1_Channel == TIM1_CHANNEL_2)
5519  0015 7b01          	ld	a,(OFST+1,sp)
5520  0017 a101          	cp	a,#1
5521  0019 2610          	jrne	L7572
5522                     ; 1730     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
5524  001b 7219525c      	bres	21084,#4
5525                     ; 1733     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM))
5525                     ; 1734                             | (uint8_t)TIM1_OCMode);
5527  001f c65259        	ld	a,21081
5528  0022 a48f          	and	a,#143
5529  0024 1a02          	or	a,(OFST+2,sp)
5530  0026 c75259        	ld	21081,a
5532  0029 2024          	jra	L5572
5533  002b               L7572:
5534                     ; 1736   else if (TIM1_Channel == TIM1_CHANNEL_3)
5536  002b 7b01          	ld	a,(OFST+1,sp)
5537  002d a102          	cp	a,#2
5538  002f 2610          	jrne	L3672
5539                     ; 1739     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
5541  0031 7211525d      	bres	21085,#0
5542                     ; 1742     TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) 
5542                     ; 1743                             | (uint8_t)TIM1_OCMode);
5544  0035 c6525a        	ld	a,21082
5545  0038 a48f          	and	a,#143
5546  003a 1a02          	or	a,(OFST+2,sp)
5547  003c c7525a        	ld	21082,a
5549  003f 200e          	jra	L5572
5550  0041               L3672:
5551                     ; 1748     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
5553  0041 7219525d      	bres	21085,#4
5554                     ; 1751     TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) 
5554                     ; 1752                             | (uint8_t)TIM1_OCMode);
5556  0045 c6525b        	ld	a,21083
5557  0048 a48f          	and	a,#143
5558  004a 1a02          	or	a,(OFST+2,sp)
5559  004c c7525b        	ld	21083,a
5560  004f               L5572:
5561                     ; 1754 }
5564  004f 85            	popw	x
5565  0050 81            	ret
5599                     ; 1762 void TIM1_SetCounter(uint16_t Counter)
5599                     ; 1763 {
5600                     .text:	section	.text,new
5601  0000               _TIM1_SetCounter:
5605                     ; 1765   TIM1->CNTRH = (uint8_t)(Counter >> 8);
5607  0000 9e            	ld	a,xh
5608  0001 c7525e        	ld	21086,a
5609                     ; 1766   TIM1->CNTRL = (uint8_t)(Counter);
5611  0004 9f            	ld	a,xl
5612  0005 c7525f        	ld	21087,a
5613                     ; 1767 }
5616  0008 81            	ret
5650                     ; 1775 void TIM1_SetAutoreload(uint16_t Autoreload)
5650                     ; 1776 {
5651                     .text:	section	.text,new
5652  0000               _TIM1_SetAutoreload:
5656                     ; 1778   TIM1->ARRH = (uint8_t)(Autoreload >> 8);
5658  0000 9e            	ld	a,xh
5659  0001 c75262        	ld	21090,a
5660                     ; 1779   TIM1->ARRL = (uint8_t)(Autoreload);
5662  0004 9f            	ld	a,xl
5663  0005 c75263        	ld	21091,a
5664                     ; 1780  }
5667  0008 81            	ret
5701                     ; 1788 void TIM1_SetCompare1(uint16_t Compare1)
5701                     ; 1789 {
5702                     .text:	section	.text,new
5703  0000               _TIM1_SetCompare1:
5707                     ; 1791   TIM1->CCR1H = (uint8_t)(Compare1 >> 8);
5709  0000 9e            	ld	a,xh
5710  0001 c75265        	ld	21093,a
5711                     ; 1792   TIM1->CCR1L = (uint8_t)(Compare1);
5713  0004 9f            	ld	a,xl
5714  0005 c75266        	ld	21094,a
5715                     ; 1793 }
5718  0008 81            	ret
5752                     ; 1801 void TIM1_SetCompare2(uint16_t Compare2)
5752                     ; 1802 {
5753                     .text:	section	.text,new
5754  0000               _TIM1_SetCompare2:
5758                     ; 1804   TIM1->CCR2H = (uint8_t)(Compare2 >> 8);
5760  0000 9e            	ld	a,xh
5761  0001 c75267        	ld	21095,a
5762                     ; 1805   TIM1->CCR2L = (uint8_t)(Compare2);
5764  0004 9f            	ld	a,xl
5765  0005 c75268        	ld	21096,a
5766                     ; 1806 }
5769  0008 81            	ret
5803                     ; 1814 void TIM1_SetCompare3(uint16_t Compare3)
5803                     ; 1815 {
5804                     .text:	section	.text,new
5805  0000               _TIM1_SetCompare3:
5809                     ; 1817   TIM1->CCR3H = (uint8_t)(Compare3 >> 8);
5811  0000 9e            	ld	a,xh
5812  0001 c75269        	ld	21097,a
5813                     ; 1818   TIM1->CCR3L = (uint8_t)(Compare3);
5815  0004 9f            	ld	a,xl
5816  0005 c7526a        	ld	21098,a
5817                     ; 1819 }
5820  0008 81            	ret
5854                     ; 1827 void TIM1_SetCompare4(uint16_t Compare4)
5854                     ; 1828 {
5855                     .text:	section	.text,new
5856  0000               _TIM1_SetCompare4:
5860                     ; 1830   TIM1->CCR4H = (uint8_t)(Compare4 >> 8);
5862  0000 9e            	ld	a,xh
5863  0001 c7526b        	ld	21099,a
5864                     ; 1831   TIM1->CCR4L = (uint8_t)(Compare4);
5866  0004 9f            	ld	a,xl
5867  0005 c7526c        	ld	21100,a
5868                     ; 1832 }
5871  0008 81            	ret
5907                     ; 1844 void TIM1_SetIC1Prescaler(TIM1_ICPSC_TypeDef TIM1_IC1Prescaler)
5907                     ; 1845 {
5908                     .text:	section	.text,new
5909  0000               _TIM1_SetIC1Prescaler:
5911  0000 88            	push	a
5912       00000000      OFST:	set	0
5915                     ; 1847   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC1Prescaler));
5917                     ; 1850   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_ICxPSC)) 
5917                     ; 1851                           | (uint8_t)TIM1_IC1Prescaler);
5919  0001 c65258        	ld	a,21080
5920  0004 a4f3          	and	a,#243
5921  0006 1a01          	or	a,(OFST+1,sp)
5922  0008 c75258        	ld	21080,a
5923                     ; 1852 }
5926  000b 84            	pop	a
5927  000c 81            	ret
5963                     ; 1864 void TIM1_SetIC2Prescaler(TIM1_ICPSC_TypeDef TIM1_IC2Prescaler)
5963                     ; 1865 {
5964                     .text:	section	.text,new
5965  0000               _TIM1_SetIC2Prescaler:
5967  0000 88            	push	a
5968       00000000      OFST:	set	0
5971                     ; 1868   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC2Prescaler));
5973                     ; 1871   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_ICxPSC))
5973                     ; 1872                           | (uint8_t)TIM1_IC2Prescaler);
5975  0001 c65259        	ld	a,21081
5976  0004 a4f3          	and	a,#243
5977  0006 1a01          	or	a,(OFST+1,sp)
5978  0008 c75259        	ld	21081,a
5979                     ; 1873 }
5982  000b 84            	pop	a
5983  000c 81            	ret
6019                     ; 1885 void TIM1_SetIC3Prescaler(TIM1_ICPSC_TypeDef TIM1_IC3Prescaler)
6019                     ; 1886 {
6020                     .text:	section	.text,new
6021  0000               _TIM1_SetIC3Prescaler:
6023  0000 88            	push	a
6024       00000000      OFST:	set	0
6027                     ; 1889   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC3Prescaler));
6029                     ; 1892   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | 
6029                     ; 1893                           (uint8_t)TIM1_IC3Prescaler);
6031  0001 c6525a        	ld	a,21082
6032  0004 a4f3          	and	a,#243
6033  0006 1a01          	or	a,(OFST+1,sp)
6034  0008 c7525a        	ld	21082,a
6035                     ; 1894 }
6038  000b 84            	pop	a
6039  000c 81            	ret
6075                     ; 1906 void TIM1_SetIC4Prescaler(TIM1_ICPSC_TypeDef TIM1_IC4Prescaler)
6075                     ; 1907 {
6076                     .text:	section	.text,new
6077  0000               _TIM1_SetIC4Prescaler:
6079  0000 88            	push	a
6080       00000000      OFST:	set	0
6083                     ; 1910   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC4Prescaler));
6085                     ; 1913   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_ICxPSC)) |
6085                     ; 1914                           (uint8_t)TIM1_IC4Prescaler);
6087  0001 c6525b        	ld	a,21083
6088  0004 a4f3          	and	a,#243
6089  0006 1a01          	or	a,(OFST+1,sp)
6090  0008 c7525b        	ld	21083,a
6091                     ; 1915 }
6094  000b 84            	pop	a
6095  000c 81            	ret
6147                     ; 1922 uint16_t TIM1_GetCapture1(void)
6147                     ; 1923 {
6148                     .text:	section	.text,new
6149  0000               _TIM1_GetCapture1:
6151  0000 5204          	subw	sp,#4
6152       00000004      OFST:	set	4
6155                     ; 1926   uint16_t tmpccr1 = 0;
6157                     ; 1927   uint8_t tmpccr1l=0, tmpccr1h=0;
6161                     ; 1929   tmpccr1h = TIM1->CCR1H;
6163  0002 c65265        	ld	a,21093
6164  0005 6b02          	ld	(OFST-2,sp),a
6166                     ; 1930   tmpccr1l = TIM1->CCR1L;
6168  0007 c65266        	ld	a,21094
6169  000a 6b01          	ld	(OFST-3,sp),a
6171                     ; 1932   tmpccr1 = (uint16_t)(tmpccr1l);
6173  000c 7b01          	ld	a,(OFST-3,sp)
6174  000e 5f            	clrw	x
6175  000f 97            	ld	xl,a
6176  0010 1f03          	ldw	(OFST-1,sp),x
6178                     ; 1933   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
6180  0012 7b02          	ld	a,(OFST-2,sp)
6181  0014 5f            	clrw	x
6182  0015 97            	ld	xl,a
6183  0016 4f            	clr	a
6184  0017 02            	rlwa	x,a
6185  0018 01            	rrwa	x,a
6186  0019 1a04          	or	a,(OFST+0,sp)
6187  001b 01            	rrwa	x,a
6188  001c 1a03          	or	a,(OFST-1,sp)
6189  001e 01            	rrwa	x,a
6190  001f 1f03          	ldw	(OFST-1,sp),x
6192                     ; 1935   return (uint16_t)tmpccr1;
6194  0021 1e03          	ldw	x,(OFST-1,sp)
6197  0023 5b04          	addw	sp,#4
6198  0025 81            	ret
6250                     ; 1943 uint16_t TIM1_GetCapture2(void)
6250                     ; 1944 {
6251                     .text:	section	.text,new
6252  0000               _TIM1_GetCapture2:
6254  0000 5204          	subw	sp,#4
6255       00000004      OFST:	set	4
6258                     ; 1947   uint16_t tmpccr2 = 0;
6260                     ; 1948   uint8_t tmpccr2l=0, tmpccr2h=0;
6264                     ; 1950   tmpccr2h = TIM1->CCR2H;
6266  0002 c65267        	ld	a,21095
6267  0005 6b02          	ld	(OFST-2,sp),a
6269                     ; 1951   tmpccr2l = TIM1->CCR2L;
6271  0007 c65268        	ld	a,21096
6272  000a 6b01          	ld	(OFST-3,sp),a
6274                     ; 1953   tmpccr2 = (uint16_t)(tmpccr2l);
6276  000c 7b01          	ld	a,(OFST-3,sp)
6277  000e 5f            	clrw	x
6278  000f 97            	ld	xl,a
6279  0010 1f03          	ldw	(OFST-1,sp),x
6281                     ; 1954   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
6283  0012 7b02          	ld	a,(OFST-2,sp)
6284  0014 5f            	clrw	x
6285  0015 97            	ld	xl,a
6286  0016 4f            	clr	a
6287  0017 02            	rlwa	x,a
6288  0018 01            	rrwa	x,a
6289  0019 1a04          	or	a,(OFST+0,sp)
6290  001b 01            	rrwa	x,a
6291  001c 1a03          	or	a,(OFST-1,sp)
6292  001e 01            	rrwa	x,a
6293  001f 1f03          	ldw	(OFST-1,sp),x
6295                     ; 1956   return (uint16_t)tmpccr2;
6297  0021 1e03          	ldw	x,(OFST-1,sp)
6300  0023 5b04          	addw	sp,#4
6301  0025 81            	ret
6353                     ; 1964 uint16_t TIM1_GetCapture3(void)
6353                     ; 1965 {
6354                     .text:	section	.text,new
6355  0000               _TIM1_GetCapture3:
6357  0000 5204          	subw	sp,#4
6358       00000004      OFST:	set	4
6361                     ; 1967   uint16_t tmpccr3 = 0;
6363                     ; 1968   uint8_t tmpccr3l=0, tmpccr3h=0;
6367                     ; 1970   tmpccr3h = TIM1->CCR3H;
6369  0002 c65269        	ld	a,21097
6370  0005 6b02          	ld	(OFST-2,sp),a
6372                     ; 1971   tmpccr3l = TIM1->CCR3L;
6374  0007 c6526a        	ld	a,21098
6375  000a 6b01          	ld	(OFST-3,sp),a
6377                     ; 1973   tmpccr3 = (uint16_t)(tmpccr3l);
6379  000c 7b01          	ld	a,(OFST-3,sp)
6380  000e 5f            	clrw	x
6381  000f 97            	ld	xl,a
6382  0010 1f03          	ldw	(OFST-1,sp),x
6384                     ; 1974   tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
6386  0012 7b02          	ld	a,(OFST-2,sp)
6387  0014 5f            	clrw	x
6388  0015 97            	ld	xl,a
6389  0016 4f            	clr	a
6390  0017 02            	rlwa	x,a
6391  0018 01            	rrwa	x,a
6392  0019 1a04          	or	a,(OFST+0,sp)
6393  001b 01            	rrwa	x,a
6394  001c 1a03          	or	a,(OFST-1,sp)
6395  001e 01            	rrwa	x,a
6396  001f 1f03          	ldw	(OFST-1,sp),x
6398                     ; 1976   return (uint16_t)tmpccr3;
6400  0021 1e03          	ldw	x,(OFST-1,sp)
6403  0023 5b04          	addw	sp,#4
6404  0025 81            	ret
6456                     ; 1984 uint16_t TIM1_GetCapture4(void)
6456                     ; 1985 {
6457                     .text:	section	.text,new
6458  0000               _TIM1_GetCapture4:
6460  0000 5204          	subw	sp,#4
6461       00000004      OFST:	set	4
6464                     ; 1987   uint16_t tmpccr4 = 0;
6466                     ; 1988   uint8_t tmpccr4l=0, tmpccr4h=0;
6470                     ; 1990   tmpccr4h = TIM1->CCR4H;
6472  0002 c6526b        	ld	a,21099
6473  0005 6b02          	ld	(OFST-2,sp),a
6475                     ; 1991   tmpccr4l = TIM1->CCR4L;
6477  0007 c6526c        	ld	a,21100
6478  000a 6b01          	ld	(OFST-3,sp),a
6480                     ; 1993   tmpccr4 = (uint16_t)(tmpccr4l);
6482  000c 7b01          	ld	a,(OFST-3,sp)
6483  000e 5f            	clrw	x
6484  000f 97            	ld	xl,a
6485  0010 1f03          	ldw	(OFST-1,sp),x
6487                     ; 1994   tmpccr4 |= (uint16_t)((uint16_t)tmpccr4h << 8);
6489  0012 7b02          	ld	a,(OFST-2,sp)
6490  0014 5f            	clrw	x
6491  0015 97            	ld	xl,a
6492  0016 4f            	clr	a
6493  0017 02            	rlwa	x,a
6494  0018 01            	rrwa	x,a
6495  0019 1a04          	or	a,(OFST+0,sp)
6496  001b 01            	rrwa	x,a
6497  001c 1a03          	or	a,(OFST-1,sp)
6498  001e 01            	rrwa	x,a
6499  001f 1f03          	ldw	(OFST-1,sp),x
6501                     ; 1996   return (uint16_t)tmpccr4;
6503  0021 1e03          	ldw	x,(OFST-1,sp)
6506  0023 5b04          	addw	sp,#4
6507  0025 81            	ret
6541                     ; 2004 uint16_t TIM1_GetCounter(void)
6541                     ; 2005 {
6542                     .text:	section	.text,new
6543  0000               _TIM1_GetCounter:
6545  0000 89            	pushw	x
6546       00000002      OFST:	set	2
6549                     ; 2006   uint16_t tmpcntr = 0;
6551                     ; 2008   tmpcntr = ((uint16_t)TIM1->CNTRH << 8);
6553  0001 c6525e        	ld	a,21086
6554  0004 5f            	clrw	x
6555  0005 97            	ld	xl,a
6556  0006 4f            	clr	a
6557  0007 02            	rlwa	x,a
6558  0008 1f01          	ldw	(OFST-1,sp),x
6560                     ; 2011   return (uint16_t)(tmpcntr | (uint16_t)(TIM1->CNTRL));
6562  000a c6525f        	ld	a,21087
6563  000d 5f            	clrw	x
6564  000e 97            	ld	xl,a
6565  000f 01            	rrwa	x,a
6566  0010 1a02          	or	a,(OFST+0,sp)
6567  0012 01            	rrwa	x,a
6568  0013 1a01          	or	a,(OFST-1,sp)
6569  0015 01            	rrwa	x,a
6572  0016 5b02          	addw	sp,#2
6573  0018 81            	ret
6607                     ; 2019 uint16_t TIM1_GetPrescaler(void)
6607                     ; 2020 {
6608                     .text:	section	.text,new
6609  0000               _TIM1_GetPrescaler:
6611  0000 89            	pushw	x
6612       00000002      OFST:	set	2
6615                     ; 2021   uint16_t temp = 0;
6617                     ; 2023   temp = ((uint16_t)TIM1->PSCRH << 8);
6619  0001 c65260        	ld	a,21088
6620  0004 5f            	clrw	x
6621  0005 97            	ld	xl,a
6622  0006 4f            	clr	a
6623  0007 02            	rlwa	x,a
6624  0008 1f01          	ldw	(OFST-1,sp),x
6626                     ; 2026   return (uint16_t)( temp | (uint16_t)(TIM1->PSCRL));
6628  000a c65261        	ld	a,21089
6629  000d 5f            	clrw	x
6630  000e 97            	ld	xl,a
6631  000f 01            	rrwa	x,a
6632  0010 1a02          	or	a,(OFST+0,sp)
6633  0012 01            	rrwa	x,a
6634  0013 1a01          	or	a,(OFST-1,sp)
6635  0015 01            	rrwa	x,a
6638  0016 5b02          	addw	sp,#2
6639  0018 81            	ret
6813                     ; 2047 FlagStatus TIM1_GetFlagStatus(TIM1_FLAG_TypeDef TIM1_FLAG)
6813                     ; 2048 {
6814                     .text:	section	.text,new
6815  0000               _TIM1_GetFlagStatus:
6817  0000 89            	pushw	x
6818  0001 89            	pushw	x
6819       00000002      OFST:	set	2
6822                     ; 2049   FlagStatus bitstatus = RESET;
6824                     ; 2050   uint8_t tim1_flag_l = 0, tim1_flag_h = 0;
6828                     ; 2053   assert_param(IS_TIM1_GET_FLAG_OK(TIM1_FLAG));
6830                     ; 2055   tim1_flag_l = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_FLAG);
6832  0002 9f            	ld	a,xl
6833  0003 c45255        	and	a,21077
6834  0006 6b01          	ld	(OFST-1,sp),a
6836                     ; 2056   tim1_flag_h = (uint8_t)((uint16_t)TIM1_FLAG >> 8);
6838  0008 7b03          	ld	a,(OFST+1,sp)
6839  000a 6b02          	ld	(OFST+0,sp),a
6841                     ; 2058   if ((tim1_flag_l | (uint8_t)(TIM1->SR2 & tim1_flag_h)) != 0)
6843  000c c65256        	ld	a,21078
6844  000f 1402          	and	a,(OFST+0,sp)
6845  0011 1a01          	or	a,(OFST-1,sp)
6846  0013 2706          	jreq	L5643
6847                     ; 2060     bitstatus = SET;
6849  0015 a601          	ld	a,#1
6850  0017 6b02          	ld	(OFST+0,sp),a
6853  0019 2002          	jra	L7643
6854  001b               L5643:
6855                     ; 2064     bitstatus = RESET;
6857  001b 0f02          	clr	(OFST+0,sp)
6859  001d               L7643:
6860                     ; 2066   return (FlagStatus)(bitstatus);
6862  001d 7b02          	ld	a,(OFST+0,sp)
6865  001f 5b04          	addw	sp,#4
6866  0021 81            	ret
6901                     ; 2087 void TIM1_ClearFlag(TIM1_FLAG_TypeDef TIM1_FLAG)
6901                     ; 2088 {
6902                     .text:	section	.text,new
6903  0000               _TIM1_ClearFlag:
6905  0000 89            	pushw	x
6906       00000000      OFST:	set	0
6909                     ; 2090   assert_param(IS_TIM1_CLEAR_FLAG_OK(TIM1_FLAG));
6911                     ; 2093   TIM1->SR1 = (uint8_t)(~(uint8_t)(TIM1_FLAG));
6913  0001 9f            	ld	a,xl
6914  0002 43            	cpl	a
6915  0003 c75255        	ld	21077,a
6916                     ; 2094   TIM1->SR2 = (uint8_t)((uint8_t)(~((uint8_t)((uint16_t)TIM1_FLAG >> 8))) & 
6916                     ; 2095                         (uint8_t)0x1E);
6918  0006 7b01          	ld	a,(OFST+1,sp)
6919  0008 43            	cpl	a
6920  0009 a41e          	and	a,#30
6921  000b c75256        	ld	21078,a
6922                     ; 2096 }
6925  000e 85            	popw	x
6926  000f 81            	ret
6990                     ; 2112 ITStatus TIM1_GetITStatus(TIM1_IT_TypeDef TIM1_IT)
6990                     ; 2113 {
6991                     .text:	section	.text,new
6992  0000               _TIM1_GetITStatus:
6994  0000 88            	push	a
6995  0001 89            	pushw	x
6996       00000002      OFST:	set	2
6999                     ; 2114   ITStatus bitstatus = RESET;
7001                     ; 2115   uint8_t TIM1_itStatus = 0, TIM1_itEnable = 0;
7005                     ; 2118   assert_param(IS_TIM1_GET_IT_OK(TIM1_IT));
7007                     ; 2120   TIM1_itStatus = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_IT);
7009  0002 c45255        	and	a,21077
7010  0005 6b01          	ld	(OFST-1,sp),a
7012                     ; 2122   TIM1_itEnable = (uint8_t)(TIM1->IER & (uint8_t)TIM1_IT);
7014  0007 c65254        	ld	a,21076
7015  000a 1403          	and	a,(OFST+1,sp)
7016  000c 6b02          	ld	(OFST+0,sp),a
7018                     ; 2124   if ((TIM1_itStatus != (uint8_t)RESET ) && (TIM1_itEnable != (uint8_t)RESET ))
7020  000e 0d01          	tnz	(OFST-1,sp)
7021  0010 270a          	jreq	L1453
7023  0012 0d02          	tnz	(OFST+0,sp)
7024  0014 2706          	jreq	L1453
7025                     ; 2126     bitstatus = SET;
7027  0016 a601          	ld	a,#1
7028  0018 6b02          	ld	(OFST+0,sp),a
7031  001a 2002          	jra	L3453
7032  001c               L1453:
7033                     ; 2130     bitstatus = RESET;
7035  001c 0f02          	clr	(OFST+0,sp)
7037  001e               L3453:
7038                     ; 2132   return (ITStatus)(bitstatus);
7040  001e 7b02          	ld	a,(OFST+0,sp)
7043  0020 5b03          	addw	sp,#3
7044  0022 81            	ret
7080                     ; 2149 void TIM1_ClearITPendingBit(TIM1_IT_TypeDef TIM1_IT)
7080                     ; 2150 {
7081                     .text:	section	.text,new
7082  0000               _TIM1_ClearITPendingBit:
7086                     ; 2152   assert_param(IS_TIM1_IT_OK(TIM1_IT));
7088                     ; 2155   TIM1->SR1 = (uint8_t)(~(uint8_t)TIM1_IT);
7090  0000 43            	cpl	a
7091  0001 c75255        	ld	21077,a
7092                     ; 2156 }
7095  0004 81            	ret
7147                     ; 2174 static void TI1_Config(uint8_t TIM1_ICPolarity,
7147                     ; 2175                        uint8_t TIM1_ICSelection,
7147                     ; 2176                        uint8_t TIM1_ICFilter)
7147                     ; 2177 {
7148                     .text:	section	.text,new
7149  0000               L3_TI1_Config:
7151  0000 89            	pushw	x
7152  0001 88            	push	a
7153       00000001      OFST:	set	1
7156                     ; 2179   TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
7158  0002 7211525c      	bres	21084,#0
7159                     ; 2182   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF ))) | 
7159                     ; 2183                           (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7161  0006 7b06          	ld	a,(OFST+5,sp)
7162  0008 97            	ld	xl,a
7163  0009 a610          	ld	a,#16
7164  000b 42            	mul	x,a
7165  000c 9f            	ld	a,xl
7166  000d 1a03          	or	a,(OFST+2,sp)
7167  000f 6b01          	ld	(OFST+0,sp),a
7169  0011 c65258        	ld	a,21080
7170  0014 a40c          	and	a,#12
7171  0016 1a01          	or	a,(OFST+0,sp)
7172  0018 c75258        	ld	21080,a
7173                     ; 2186   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7175  001b 0d02          	tnz	(OFST+1,sp)
7176  001d 2706          	jreq	L1163
7177                     ; 2188     TIM1->CCER1 |= TIM1_CCER1_CC1P;
7179  001f 7212525c      	bset	21084,#1
7181  0023 2004          	jra	L3163
7182  0025               L1163:
7183                     ; 2192     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
7185  0025 7213525c      	bres	21084,#1
7186  0029               L3163:
7187                     ; 2196   TIM1->CCER1 |=  TIM1_CCER1_CC1E;
7189  0029 7210525c      	bset	21084,#0
7190                     ; 2197 }
7193  002d 5b03          	addw	sp,#3
7194  002f 81            	ret
7246                     ; 2215 static void TI2_Config(uint8_t TIM1_ICPolarity,
7246                     ; 2216                        uint8_t TIM1_ICSelection,
7246                     ; 2217                        uint8_t TIM1_ICFilter)
7246                     ; 2218 {
7247                     .text:	section	.text,new
7248  0000               L5_TI2_Config:
7250  0000 89            	pushw	x
7251  0001 88            	push	a
7252       00000001      OFST:	set	1
7255                     ; 2220   TIM1->CCER1 &=  (uint8_t)(~TIM1_CCER1_CC2E);
7257  0002 7219525c      	bres	21084,#4
7258                     ; 2223   TIM1->CCMR2  = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF ))) 
7258                     ; 2224                            | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7260  0006 7b06          	ld	a,(OFST+5,sp)
7261  0008 97            	ld	xl,a
7262  0009 a610          	ld	a,#16
7263  000b 42            	mul	x,a
7264  000c 9f            	ld	a,xl
7265  000d 1a03          	or	a,(OFST+2,sp)
7266  000f 6b01          	ld	(OFST+0,sp),a
7268  0011 c65259        	ld	a,21081
7269  0014 a40c          	and	a,#12
7270  0016 1a01          	or	a,(OFST+0,sp)
7271  0018 c75259        	ld	21081,a
7272                     ; 2226   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7274  001b 0d02          	tnz	(OFST+1,sp)
7275  001d 2706          	jreq	L3463
7276                     ; 2228     TIM1->CCER1 |= TIM1_CCER1_CC2P;
7278  001f 721a525c      	bset	21084,#5
7280  0023 2004          	jra	L5463
7281  0025               L3463:
7282                     ; 2232     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
7284  0025 721b525c      	bres	21084,#5
7285  0029               L5463:
7286                     ; 2235   TIM1->CCER1 |=  TIM1_CCER1_CC2E;
7288  0029 7218525c      	bset	21084,#4
7289                     ; 2236 }
7292  002d 5b03          	addw	sp,#3
7293  002f 81            	ret
7345                     ; 2254 static void TI3_Config(uint8_t TIM1_ICPolarity,
7345                     ; 2255                        uint8_t TIM1_ICSelection,
7345                     ; 2256                        uint8_t TIM1_ICFilter)
7345                     ; 2257 {
7346                     .text:	section	.text,new
7347  0000               L7_TI3_Config:
7349  0000 89            	pushw	x
7350  0001 88            	push	a
7351       00000001      OFST:	set	1
7354                     ; 2259   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC3E);
7356  0002 7211525d      	bres	21085,#0
7357                     ; 2262   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF))) 
7357                     ; 2263                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7359  0006 7b06          	ld	a,(OFST+5,sp)
7360  0008 97            	ld	xl,a
7361  0009 a610          	ld	a,#16
7362  000b 42            	mul	x,a
7363  000c 9f            	ld	a,xl
7364  000d 1a03          	or	a,(OFST+2,sp)
7365  000f 6b01          	ld	(OFST+0,sp),a
7367  0011 c6525a        	ld	a,21082
7368  0014 a40c          	and	a,#12
7369  0016 1a01          	or	a,(OFST+0,sp)
7370  0018 c7525a        	ld	21082,a
7371                     ; 2266   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7373  001b 0d02          	tnz	(OFST+1,sp)
7374  001d 2706          	jreq	L5763
7375                     ; 2268     TIM1->CCER2 |= TIM1_CCER2_CC3P;
7377  001f 7212525d      	bset	21085,#1
7379  0023 2004          	jra	L7763
7380  0025               L5763:
7381                     ; 2272     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
7383  0025 7213525d      	bres	21085,#1
7384  0029               L7763:
7385                     ; 2275   TIM1->CCER2 |=  TIM1_CCER2_CC3E;
7387  0029 7210525d      	bset	21085,#0
7388                     ; 2276 }
7391  002d 5b03          	addw	sp,#3
7392  002f 81            	ret
7444                     ; 2294 static void TI4_Config(uint8_t TIM1_ICPolarity,
7444                     ; 2295                        uint8_t TIM1_ICSelection,
7444                     ; 2296                        uint8_t TIM1_ICFilter)
7444                     ; 2297 {
7445                     .text:	section	.text,new
7446  0000               L11_TI4_Config:
7448  0000 89            	pushw	x
7449  0001 88            	push	a
7450       00000001      OFST:	set	1
7453                     ; 2299   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC4E);
7455  0002 7219525d      	bres	21085,#4
7456                     ; 2302   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF )))
7456                     ; 2303                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7458  0006 7b06          	ld	a,(OFST+5,sp)
7459  0008 97            	ld	xl,a
7460  0009 a610          	ld	a,#16
7461  000b 42            	mul	x,a
7462  000c 9f            	ld	a,xl
7463  000d 1a03          	or	a,(OFST+2,sp)
7464  000f 6b01          	ld	(OFST+0,sp),a
7466  0011 c6525b        	ld	a,21083
7467  0014 a40c          	and	a,#12
7468  0016 1a01          	or	a,(OFST+0,sp)
7469  0018 c7525b        	ld	21083,a
7470                     ; 2306   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7472  001b 0d02          	tnz	(OFST+1,sp)
7473  001d 2706          	jreq	L7273
7474                     ; 2308     TIM1->CCER2 |= TIM1_CCER2_CC4P;
7476  001f 721a525d      	bset	21085,#5
7478  0023 2004          	jra	L1373
7479  0025               L7273:
7480                     ; 2312     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
7482  0025 721b525d      	bres	21085,#5
7483  0029               L1373:
7484                     ; 2316   TIM1->CCER2 |=  TIM1_CCER2_CC4E;
7486  0029 7218525d      	bset	21085,#4
7487                     ; 2317 }
7490  002d 5b03          	addw	sp,#3
7491  002f 81            	ret
7504                     	xdef	_TIM1_ClearITPendingBit
7505                     	xdef	_TIM1_GetITStatus
7506                     	xdef	_TIM1_ClearFlag
7507                     	xdef	_TIM1_GetFlagStatus
7508                     	xdef	_TIM1_GetPrescaler
7509                     	xdef	_TIM1_GetCounter
7510                     	xdef	_TIM1_GetCapture4
7511                     	xdef	_TIM1_GetCapture3
7512                     	xdef	_TIM1_GetCapture2
7513                     	xdef	_TIM1_GetCapture1
7514                     	xdef	_TIM1_SetIC4Prescaler
7515                     	xdef	_TIM1_SetIC3Prescaler
7516                     	xdef	_TIM1_SetIC2Prescaler
7517                     	xdef	_TIM1_SetIC1Prescaler
7518                     	xdef	_TIM1_SetCompare4
7519                     	xdef	_TIM1_SetCompare3
7520                     	xdef	_TIM1_SetCompare2
7521                     	xdef	_TIM1_SetCompare1
7522                     	xdef	_TIM1_SetAutoreload
7523                     	xdef	_TIM1_SetCounter
7524                     	xdef	_TIM1_SelectOCxM
7525                     	xdef	_TIM1_CCxNCmd
7526                     	xdef	_TIM1_CCxCmd
7527                     	xdef	_TIM1_OC4PolarityConfig
7528                     	xdef	_TIM1_OC3NPolarityConfig
7529                     	xdef	_TIM1_OC3PolarityConfig
7530                     	xdef	_TIM1_OC2NPolarityConfig
7531                     	xdef	_TIM1_OC2PolarityConfig
7532                     	xdef	_TIM1_OC1NPolarityConfig
7533                     	xdef	_TIM1_OC1PolarityConfig
7534                     	xdef	_TIM1_GenerateEvent
7535                     	xdef	_TIM1_OC4FastConfig
7536                     	xdef	_TIM1_OC3FastConfig
7537                     	xdef	_TIM1_OC2FastConfig
7538                     	xdef	_TIM1_OC1FastConfig
7539                     	xdef	_TIM1_OC4PreloadConfig
7540                     	xdef	_TIM1_OC3PreloadConfig
7541                     	xdef	_TIM1_OC2PreloadConfig
7542                     	xdef	_TIM1_OC1PreloadConfig
7543                     	xdef	_TIM1_CCPreloadControl
7544                     	xdef	_TIM1_SelectCOM
7545                     	xdef	_TIM1_ARRPreloadConfig
7546                     	xdef	_TIM1_ForcedOC4Config
7547                     	xdef	_TIM1_ForcedOC3Config
7548                     	xdef	_TIM1_ForcedOC2Config
7549                     	xdef	_TIM1_ForcedOC1Config
7550                     	xdef	_TIM1_CounterModeConfig
7551                     	xdef	_TIM1_PrescalerConfig
7552                     	xdef	_TIM1_EncoderInterfaceConfig
7553                     	xdef	_TIM1_SelectMasterSlaveMode
7554                     	xdef	_TIM1_SelectSlaveMode
7555                     	xdef	_TIM1_SelectOutputTrigger
7556                     	xdef	_TIM1_SelectOnePulseMode
7557                     	xdef	_TIM1_SelectHallSensor
7558                     	xdef	_TIM1_UpdateRequestConfig
7559                     	xdef	_TIM1_UpdateDisableConfig
7560                     	xdef	_TIM1_SelectInputTrigger
7561                     	xdef	_TIM1_TIxExternalClockConfig
7562                     	xdef	_TIM1_ETRConfig
7563                     	xdef	_TIM1_ETRClockMode2Config
7564                     	xdef	_TIM1_ETRClockMode1Config
7565                     	xdef	_TIM1_InternalClockConfig
7566                     	xdef	_TIM1_ITConfig
7567                     	xdef	_TIM1_CtrlPWMOutputs
7568                     	xdef	_TIM1_Cmd
7569                     	xdef	_TIM1_PWMIConfig
7570                     	xdef	_TIM1_ICInit
7571                     	xdef	_TIM1_BDTRConfig
7572                     	xdef	_TIM1_OC4Init
7573                     	xdef	_TIM1_OC3Init
7574                     	xdef	_TIM1_OC2Init
7575                     	xdef	_TIM1_OC1Init
7576                     	xdef	_TIM1_TimeBaseInit
7577                     	xdef	_TIM1_DeInit
7596                     	end
