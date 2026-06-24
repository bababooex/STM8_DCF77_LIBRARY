   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.3 - 22 May 2025
   3                     ; Generator (Limited) V4.6.6 - 07 Jan 2026
  15                     	bsct
  16  0000               _set_brightness:
  17  0000 07            	dc.b	7
  18  0001               _set_state:
  19  0001 08            	dc.b	8
  59                     .const:	section	.text
  60  0000               L01:
  61  0000 02f5          	dc.w	L112
  62  0002 032c          	dc.w	L322
  63  0004 032c          	dc.w	L322
  64  0006 030b          	dc.w	L512
  65  0008 0300          	dc.w	L312
  66  000a 032c          	dc.w	L322
  67  000c 02d4          	dc.w	L302
  68  000e 0321          	dc.w	L122
  69  0010 0316          	dc.w	L712
  70  0012 001f          	dc.w	L5
  71  0014 002a          	dc.w	L7
  72  0016 0035          	dc.w	L11
  73  0018 0040          	dc.w	L31
  74  001a 004b          	dc.w	L51
  75  001c 0056          	dc.w	L71
  76  001e 0061          	dc.w	L12
  77  0020 006c          	dc.w	L32
  78  0022 0077          	dc.w	L52
  79  0024 0082          	dc.w	L72
  80  0026 032c          	dc.w	L322
  81  0028 032c          	dc.w	L322
  82  002a 032c          	dc.w	L322
  83  002c 032c          	dc.w	L322
  84  002e 032c          	dc.w	L322
  85  0030 032c          	dc.w	L322
  86  0032 032c          	dc.w	L322
  87  0034 008d          	dc.w	L13
  88  0036 0098          	dc.w	L33
  89  0038 00a3          	dc.w	L53
  90  003a 00ae          	dc.w	L73
  91  003c 00b9          	dc.w	L14
  92  003e 00c4          	dc.w	L34
  93  0040 00cf          	dc.w	L54
  94  0042 00da          	dc.w	L74
  95  0044 00e5          	dc.w	L15
  96  0046 00f0          	dc.w	L35
  97  0048 00fb          	dc.w	L55
  98  004a 0106          	dc.w	L75
  99  004c 0111          	dc.w	L16
 100  004e 011c          	dc.w	L36
 101  0050 0127          	dc.w	L56
 102  0052 0132          	dc.w	L76
 103  0054 013d          	dc.w	L17
 104  0056 0148          	dc.w	L37
 105  0058 0153          	dc.w	L57
 106  005a 015e          	dc.w	L77
 107  005c 0169          	dc.w	L101
 108  005e 0174          	dc.w	L301
 109  0060 017f          	dc.w	L501
 110  0062 018a          	dc.w	L701
 111  0064 0195          	dc.w	L111
 112  0066 01a0          	dc.w	L311
 113  0068 032c          	dc.w	L322
 114  006a 032c          	dc.w	L322
 115  006c 032c          	dc.w	L322
 116  006e 032c          	dc.w	L322
 117  0070 02df          	dc.w	L502
 118  0072 032c          	dc.w	L322
 119  0074 01ab          	dc.w	L511
 120  0076 01b6          	dc.w	L711
 121  0078 01c1          	dc.w	L121
 122  007a 01cc          	dc.w	L321
 123  007c 01d7          	dc.w	L521
 124  007e 01e2          	dc.w	L721
 125  0080 01ed          	dc.w	L131
 126  0082 01f8          	dc.w	L331
 127  0084 0203          	dc.w	L531
 128  0086 020e          	dc.w	L731
 129  0088 0219          	dc.w	L141
 130  008a 0224          	dc.w	L341
 131  008c 022f          	dc.w	L541
 132  008e 023a          	dc.w	L741
 133  0090 0245          	dc.w	L151
 134  0092 0250          	dc.w	L351
 135  0094 025b          	dc.w	L551
 136  0096 0266          	dc.w	L751
 137  0098 0271          	dc.w	L161
 138  009a 027c          	dc.w	L361
 139  009c 0287          	dc.w	L561
 140  009e 0292          	dc.w	L761
 141  00a0 029d          	dc.w	L171
 142  00a2 02a8          	dc.w	L371
 143  00a4 02b3          	dc.w	L571
 144  00a6 02be          	dc.w	L771
 145                     ; 7 static uint32_t pt6311_font(char chr)
 145                     ; 8 {
 146                     	scross	off
 147                     .text:	section	.text,new
 148  0000               L3_pt6311_font:
 152                     ; 9     switch(chr)
 155                     ; 88         default: return 0;
 156  0000 a027          	sub	a,#39
 157  0002 a154          	cp	a,#84
 158  0004 2407          	jruge	L6
 159  0006 5f            	clrw	x
 160  0007 97            	ld	xl,a
 161  0008 58            	sllw	x
 162  0009 de0000        	ldw	x,(L01,x)
 163  000c fc            	jp	(x)
 164  000d               L6:
 165  000d a0f9          	sub	a,#-7
 166  000f 2603          	jrne	L21
 167  0011 cc02c9        	jp	L102
 168  0014               L21:
 169  0014 a002          	sub	a,#2
 170  0016 2603          	jrne	L41
 171  0018 cc02ea        	jp	L702
 172  001b               L41:
 173  001b ac2c032c      	jpf	L322
 174  001f               L5:
 175                     ; 12         case '0': return SEG_A | SEG_B | SEG_C | SEG_D | SEG_E | SEG_F;
 177  001f ae003f        	ldw	x,#63
 178  0022 bf02          	ldw	c_lreg+2,x
 179  0024 ae0000        	ldw	x,#0
 180  0027 bf00          	ldw	c_lreg,x
 183  0029 81            	ret
 184  002a               L7:
 185                     ; 13         case '1': return SEG_B | SEG_C | SEG_J ;
 187  002a ae0406        	ldw	x,#1030
 188  002d bf02          	ldw	c_lreg+2,x
 189  002f ae0000        	ldw	x,#0
 190  0032 bf00          	ldw	c_lreg,x
 193  0034 81            	ret
 194  0035               L11:
 195                     ; 14         case '2': return SEG_A | SEG_B | SEG_G1 | SEG_G2 | SEG_D | SEG_E;
 197  0035 ae00db        	ldw	x,#219
 198  0038 bf02          	ldw	c_lreg+2,x
 199  003a ae0000        	ldw	x,#0
 200  003d bf00          	ldw	c_lreg,x
 203  003f 81            	ret
 204  0040               L31:
 205                     ; 15         case '3': return SEG_A | SEG_B | SEG_C | SEG_D | SEG_G1 | SEG_G2;
 207  0040 ae00cf        	ldw	x,#207
 208  0043 bf02          	ldw	c_lreg+2,x
 209  0045 ae0000        	ldw	x,#0
 210  0048 bf00          	ldw	c_lreg,x
 213  004a 81            	ret
 214  004b               L51:
 215                     ; 16         case '4': return SEG_F | SEG_G1 | SEG_G2 | SEG_B | SEG_C;
 217  004b ae00e6        	ldw	x,#230
 218  004e bf02          	ldw	c_lreg+2,x
 219  0050 ae0000        	ldw	x,#0
 220  0053 bf00          	ldw	c_lreg,x
 223  0055 81            	ret
 224  0056               L71:
 225                     ; 17         case '5': return SEG_A | SEG_F | SEG_G1 | SEG_M | SEG_D;
 227  0056 ae2069        	ldw	x,#8297
 228  0059 bf02          	ldw	c_lreg+2,x
 229  005b ae0000        	ldw	x,#0
 230  005e bf00          	ldw	c_lreg,x
 233  0060 81            	ret
 234  0061               L12:
 235                     ; 18         case '6': return SEG_A | SEG_F | SEG_E | SEG_D | SEG_C | SEG_G1 | SEG_G2;
 237  0061 ae00fd        	ldw	x,#253
 238  0064 bf02          	ldw	c_lreg+2,x
 239  0066 ae0000        	ldw	x,#0
 240  0069 bf00          	ldw	c_lreg,x
 243  006b 81            	ret
 244  006c               L32:
 245                     ; 19         case '7': return SEG_A | SEG_B | SEG_C;
 247  006c ae0007        	ldw	x,#7
 248  006f bf02          	ldw	c_lreg+2,x
 249  0071 ae0000        	ldw	x,#0
 250  0074 bf00          	ldw	c_lreg,x
 253  0076 81            	ret
 254  0077               L52:
 255                     ; 20         case '8': return SEG_A | SEG_B | SEG_C | SEG_D | SEG_E | SEG_F | SEG_G1 | SEG_G2;
 257  0077 ae00ff        	ldw	x,#255
 258  007a bf02          	ldw	c_lreg+2,x
 259  007c ae0000        	ldw	x,#0
 260  007f bf00          	ldw	c_lreg,x
 263  0081 81            	ret
 264  0082               L72:
 265                     ; 21         case '9': return SEG_A | SEG_B | SEG_C | SEG_D | SEG_F | SEG_G1 | SEG_G2;
 267  0082 ae00ef        	ldw	x,#239
 268  0085 bf02          	ldw	c_lreg+2,x
 269  0087 ae0000        	ldw	x,#0
 270  008a bf00          	ldw	c_lreg,x
 273  008c 81            	ret
 274  008d               L13:
 275                     ; 24 				case 'A': return SEG_A|SEG_B|SEG_C|SEG_E|SEG_F|SEG_G1|SEG_G2;
 277  008d ae00f7        	ldw	x,#247
 278  0090 bf02          	ldw	c_lreg+2,x
 279  0092 ae0000        	ldw	x,#0
 280  0095 bf00          	ldw	c_lreg,x
 283  0097 81            	ret
 284  0098               L33:
 285                     ; 25 				case 'B': return SEG_A|SEG_B|SEG_C|SEG_D|SEG_G1|SEG_G2|SEG_I|SEG_L;
 287  0098 ae12cf        	ldw	x,#4815
 288  009b bf02          	ldw	c_lreg+2,x
 289  009d ae0000        	ldw	x,#0
 290  00a0 bf00          	ldw	c_lreg,x
 293  00a2 81            	ret
 294  00a3               L53:
 295                     ; 26 				case 'C': return SEG_A|SEG_D|SEG_E|SEG_F;
 297  00a3 ae0039        	ldw	x,#57
 298  00a6 bf02          	ldw	c_lreg+2,x
 299  00a8 ae0000        	ldw	x,#0
 300  00ab bf00          	ldw	c_lreg,x
 303  00ad 81            	ret
 304  00ae               L73:
 305                     ; 27 				case 'D': return SEG_A|SEG_B|SEG_C|SEG_D|SEG_I|SEG_L;
 307  00ae ae120f        	ldw	x,#4623
 308  00b1 bf02          	ldw	c_lreg+2,x
 309  00b3 ae0000        	ldw	x,#0
 310  00b6 bf00          	ldw	c_lreg,x
 313  00b8 81            	ret
 314  00b9               L14:
 315                     ; 28 				case 'E': return SEG_A|SEG_D|SEG_E|SEG_F|SEG_G1|SEG_G2;
 317  00b9 ae00f9        	ldw	x,#249
 318  00bc bf02          	ldw	c_lreg+2,x
 319  00be ae0000        	ldw	x,#0
 320  00c1 bf00          	ldw	c_lreg,x
 323  00c3 81            	ret
 324  00c4               L34:
 325                     ; 29 				case 'F': return SEG_A|SEG_E|SEG_F|SEG_G1|SEG_G2;
 327  00c4 ae00f1        	ldw	x,#241
 328  00c7 bf02          	ldw	c_lreg+2,x
 329  00c9 ae0000        	ldw	x,#0
 330  00cc bf00          	ldw	c_lreg,x
 333  00ce 81            	ret
 334  00cf               L54:
 335                     ; 30 				case 'G': return SEG_A|SEG_C|SEG_D|SEG_E|SEG_F|SEG_G2;
 337  00cf ae00bd        	ldw	x,#189
 338  00d2 bf02          	ldw	c_lreg+2,x
 339  00d4 ae0000        	ldw	x,#0
 340  00d7 bf00          	ldw	c_lreg,x
 343  00d9 81            	ret
 344  00da               L74:
 345                     ; 31 				case 'H': return SEG_B|SEG_C|SEG_E|SEG_F|SEG_G1|SEG_G2;
 347  00da ae00f6        	ldw	x,#246
 348  00dd bf02          	ldw	c_lreg+2,x
 349  00df ae0000        	ldw	x,#0
 350  00e2 bf00          	ldw	c_lreg,x
 353  00e4 81            	ret
 354  00e5               L15:
 355                     ; 32 				case 'I': return SEG_A|SEG_D|SEG_I|SEG_L;
 357  00e5 ae1209        	ldw	x,#4617
 358  00e8 bf02          	ldw	c_lreg+2,x
 359  00ea ae0000        	ldw	x,#0
 360  00ed bf00          	ldw	c_lreg,x
 363  00ef 81            	ret
 364  00f0               L35:
 365                     ; 33 				case 'J': return SEG_B|SEG_C|SEG_D|SEG_E;
 367  00f0 ae001e        	ldw	x,#30
 368  00f3 bf02          	ldw	c_lreg+2,x
 369  00f5 ae0000        	ldw	x,#0
 370  00f8 bf00          	ldw	c_lreg,x
 373  00fa 81            	ret
 374  00fb               L55:
 375                     ; 34 				case 'K': return SEG_E|SEG_F|SEG_G1|SEG_J|SEG_M;
 377  00fb ae2470        	ldw	x,#9328
 378  00fe bf02          	ldw	c_lreg+2,x
 379  0100 ae0000        	ldw	x,#0
 380  0103 bf00          	ldw	c_lreg,x
 383  0105 81            	ret
 384  0106               L75:
 385                     ; 35 				case 'L': return SEG_D|SEG_E|SEG_F;
 387  0106 ae0038        	ldw	x,#56
 388  0109 bf02          	ldw	c_lreg+2,x
 389  010b ae0000        	ldw	x,#0
 390  010e bf00          	ldw	c_lreg,x
 393  0110 81            	ret
 394  0111               L16:
 395                     ; 36 				case 'M': return SEG_B|SEG_C|SEG_E|SEG_F|SEG_H|SEG_J;
 397  0111 ae0536        	ldw	x,#1334
 398  0114 bf02          	ldw	c_lreg+2,x
 399  0116 ae0000        	ldw	x,#0
 400  0119 bf00          	ldw	c_lreg,x
 403  011b 81            	ret
 404  011c               L36:
 405                     ; 37 				case 'N': return SEG_B|SEG_C|SEG_E|SEG_F|SEG_H|SEG_M;
 407  011c ae2136        	ldw	x,#8502
 408  011f bf02          	ldw	c_lreg+2,x
 409  0121 ae0000        	ldw	x,#0
 410  0124 bf00          	ldw	c_lreg,x
 413  0126 81            	ret
 414  0127               L56:
 415                     ; 38 				case 'O': return SEG_A|SEG_B|SEG_C|SEG_D|SEG_E|SEG_F;
 417  0127 ae003f        	ldw	x,#63
 418  012a bf02          	ldw	c_lreg+2,x
 419  012c ae0000        	ldw	x,#0
 420  012f bf00          	ldw	c_lreg,x
 423  0131 81            	ret
 424  0132               L76:
 425                     ; 39 				case 'P': return SEG_A|SEG_B|SEG_E|SEG_F|SEG_G1|SEG_G2;
 427  0132 ae00f3        	ldw	x,#243
 428  0135 bf02          	ldw	c_lreg+2,x
 429  0137 ae0000        	ldw	x,#0
 430  013a bf00          	ldw	c_lreg,x
 433  013c 81            	ret
 434  013d               L17:
 435                     ; 40 				case 'Q': return SEG_A|SEG_B|SEG_C|SEG_D|SEG_E|SEG_F|SEG_M;
 437  013d ae203f        	ldw	x,#8255
 438  0140 bf02          	ldw	c_lreg+2,x
 439  0142 ae0000        	ldw	x,#0
 440  0145 bf00          	ldw	c_lreg,x
 443  0147 81            	ret
 444  0148               L37:
 445                     ; 41 				case 'R': return SEG_A|SEG_B|SEG_E|SEG_F|SEG_G1|SEG_G2|SEG_M;
 447  0148 ae20f3        	ldw	x,#8435
 448  014b bf02          	ldw	c_lreg+2,x
 449  014d ae0000        	ldw	x,#0
 450  0150 bf00          	ldw	c_lreg,x
 453  0152 81            	ret
 454  0153               L57:
 455                     ; 42 				case 'S': return SEG_A|SEG_C|SEG_D|SEG_F|SEG_G1|SEG_G2;
 457  0153 ae00ed        	ldw	x,#237
 458  0156 bf02          	ldw	c_lreg+2,x
 459  0158 ae0000        	ldw	x,#0
 460  015b bf00          	ldw	c_lreg,x
 463  015d 81            	ret
 464  015e               L77:
 465                     ; 43 				case 'T': return SEG_A|SEG_I|SEG_L;
 467  015e ae1201        	ldw	x,#4609
 468  0161 bf02          	ldw	c_lreg+2,x
 469  0163 ae0000        	ldw	x,#0
 470  0166 bf00          	ldw	c_lreg,x
 473  0168 81            	ret
 474  0169               L101:
 475                     ; 44 				case 'U': return SEG_B|SEG_C|SEG_D|SEG_E|SEG_F;
 477  0169 ae003e        	ldw	x,#62
 478  016c bf02          	ldw	c_lreg+2,x
 479  016e ae0000        	ldw	x,#0
 480  0171 bf00          	ldw	c_lreg,x
 483  0173 81            	ret
 484  0174               L301:
 485                     ; 45 				case 'V': return SEG_E|SEG_F|SEG_J|SEG_K;
 487  0174 ae0c30        	ldw	x,#3120
 488  0177 bf02          	ldw	c_lreg+2,x
 489  0179 ae0000        	ldw	x,#0
 490  017c bf00          	ldw	c_lreg,x
 493  017e 81            	ret
 494  017f               L501:
 495                     ; 46 				case 'W': return SEG_B|SEG_C|SEG_E|SEG_F|SEG_K|SEG_M;
 497  017f ae2836        	ldw	x,#10294
 498  0182 bf02          	ldw	c_lreg+2,x
 499  0184 ae0000        	ldw	x,#0
 500  0187 bf00          	ldw	c_lreg,x
 503  0189 81            	ret
 504  018a               L701:
 505                     ; 47 				case 'X': return SEG_H|SEG_J|SEG_K|SEG_M;
 507  018a ae2d00        	ldw	x,#11520
 508  018d bf02          	ldw	c_lreg+2,x
 509  018f ae0000        	ldw	x,#0
 510  0192 bf00          	ldw	c_lreg,x
 513  0194 81            	ret
 514  0195               L111:
 515                     ; 48 				case 'Y': return SEG_B|SEG_C|SEG_D|SEG_F|SEG_G1|SEG_G2;
 517  0195 ae00ee        	ldw	x,#238
 518  0198 bf02          	ldw	c_lreg+2,x
 519  019a ae0000        	ldw	x,#0
 520  019d bf00          	ldw	c_lreg,x
 523  019f 81            	ret
 524  01a0               L311:
 525                     ; 49 				case 'Z': return SEG_A|SEG_D|SEG_J|SEG_K;
 527  01a0 ae0c09        	ldw	x,#3081
 528  01a3 bf02          	ldw	c_lreg+2,x
 529  01a5 ae0000        	ldw	x,#0
 530  01a8 bf00          	ldw	c_lreg,x
 533  01aa 81            	ret
 534  01ab               L511:
 535                     ; 52 				case 'a': return SEG_B|SEG_C|SEG_D|SEG_E|SEG_G1|SEG_G2;
 537  01ab ae00de        	ldw	x,#222
 538  01ae bf02          	ldw	c_lreg+2,x
 539  01b0 ae0000        	ldw	x,#0
 540  01b3 bf00          	ldw	c_lreg,x
 543  01b5 81            	ret
 544  01b6               L711:
 545                     ; 53 				case 'b': return SEG_C|SEG_D|SEG_E|SEG_F|SEG_G1|SEG_G2;
 547  01b6 ae00fc        	ldw	x,#252
 548  01b9 bf02          	ldw	c_lreg+2,x
 549  01bb ae0000        	ldw	x,#0
 550  01be bf00          	ldw	c_lreg,x
 553  01c0 81            	ret
 554  01c1               L121:
 555                     ; 54 				case 'c': return SEG_D|SEG_E|SEG_G1|SEG_G2;
 557  01c1 ae00d8        	ldw	x,#216
 558  01c4 bf02          	ldw	c_lreg+2,x
 559  01c6 ae0000        	ldw	x,#0
 560  01c9 bf00          	ldw	c_lreg,x
 563  01cb 81            	ret
 564  01cc               L321:
 565                     ; 55 				case 'd': return SEG_B|SEG_C|SEG_D|SEG_E|SEG_G1|SEG_G2;
 567  01cc ae00de        	ldw	x,#222
 568  01cf bf02          	ldw	c_lreg+2,x
 569  01d1 ae0000        	ldw	x,#0
 570  01d4 bf00          	ldw	c_lreg,x
 573  01d6 81            	ret
 574  01d7               L521:
 575                     ; 56 				case 'e': return SEG_A|SEG_B|SEG_D|SEG_E|SEG_G1|SEG_G2;
 577  01d7 ae00db        	ldw	x,#219
 578  01da bf02          	ldw	c_lreg+2,x
 579  01dc ae0000        	ldw	x,#0
 580  01df bf00          	ldw	c_lreg,x
 583  01e1 81            	ret
 584  01e2               L721:
 585                     ; 57 				case 'f': return SEG_A|SEG_E|SEG_F|SEG_G1|SEG_G2;
 587  01e2 ae00f1        	ldw	x,#241
 588  01e5 bf02          	ldw	c_lreg+2,x
 589  01e7 ae0000        	ldw	x,#0
 590  01ea bf00          	ldw	c_lreg,x
 593  01ec 81            	ret
 594  01ed               L131:
 595                     ; 58 				case 'g': return SEG_A|SEG_B|SEG_C|SEG_D|SEG_F|SEG_G1|SEG_G2;
 597  01ed ae00ef        	ldw	x,#239
 598  01f0 bf02          	ldw	c_lreg+2,x
 599  01f2 ae0000        	ldw	x,#0
 600  01f5 bf00          	ldw	c_lreg,x
 603  01f7 81            	ret
 604  01f8               L331:
 605                     ; 59 				case 'h': return SEG_C|SEG_E|SEG_F|SEG_G1|SEG_G2;
 607  01f8 ae00f4        	ldw	x,#244
 608  01fb bf02          	ldw	c_lreg+2,x
 609  01fd ae0000        	ldw	x,#0
 610  0200 bf00          	ldw	c_lreg,x
 613  0202 81            	ret
 614  0203               L531:
 615                     ; 60 				case 'i': return SEG_L;
 617  0203 ae1000        	ldw	x,#4096
 618  0206 bf02          	ldw	c_lreg+2,x
 619  0208 ae0000        	ldw	x,#0
 620  020b bf00          	ldw	c_lreg,x
 623  020d 81            	ret
 624  020e               L731:
 625                     ; 61 				case 'j': return SEG_C|SEG_D;
 627  020e ae000c        	ldw	x,#12
 628  0211 bf02          	ldw	c_lreg+2,x
 629  0213 ae0000        	ldw	x,#0
 630  0216 bf00          	ldw	c_lreg,x
 633  0218 81            	ret
 634  0219               L141:
 635                     ; 62 				case 'k': return SEG_E|SEG_F|SEG_G1|SEG_M;
 637  0219 ae2070        	ldw	x,#8304
 638  021c bf02          	ldw	c_lreg+2,x
 639  021e ae0000        	ldw	x,#0
 640  0221 bf00          	ldw	c_lreg,x
 643  0223 81            	ret
 644  0224               L341:
 645                     ; 63 				case 'l': return SEG_D|SEG_E|SEG_F;
 647  0224 ae0038        	ldw	x,#56
 648  0227 bf02          	ldw	c_lreg+2,x
 649  0229 ae0000        	ldw	x,#0
 650  022c bf00          	ldw	c_lreg,x
 653  022e 81            	ret
 654  022f               L541:
 655                     ; 64 				case 'm': return SEG_C|SEG_E|SEG_G1|SEG_G2|SEG_K|SEG_M;
 657  022f ae28d4        	ldw	x,#10452
 658  0232 bf02          	ldw	c_lreg+2,x
 659  0234 ae0000        	ldw	x,#0
 660  0237 bf00          	ldw	c_lreg,x
 663  0239 81            	ret
 664  023a               L741:
 665                     ; 65 				case 'n': return SEG_C|SEG_E|SEG_G1|SEG_G2;
 667  023a ae00d4        	ldw	x,#212
 668  023d bf02          	ldw	c_lreg+2,x
 669  023f ae0000        	ldw	x,#0
 670  0242 bf00          	ldw	c_lreg,x
 673  0244 81            	ret
 674  0245               L151:
 675                     ; 66 				case 'o': return SEG_C|SEG_D|SEG_E|SEG_G1|SEG_G2;
 677  0245 ae00dc        	ldw	x,#220
 678  0248 bf02          	ldw	c_lreg+2,x
 679  024a ae0000        	ldw	x,#0
 680  024d bf00          	ldw	c_lreg,x
 683  024f 81            	ret
 684  0250               L351:
 685                     ; 67 				case 'p': return SEG_A|SEG_B|SEG_E|SEG_F|SEG_G1|SEG_G2;
 687  0250 ae00f3        	ldw	x,#243
 688  0253 bf02          	ldw	c_lreg+2,x
 689  0255 ae0000        	ldw	x,#0
 690  0258 bf00          	ldw	c_lreg,x
 693  025a 81            	ret
 694  025b               L551:
 695                     ; 68 				case 'q': return SEG_A|SEG_B|SEG_C|SEG_F|SEG_G1|SEG_G2;
 697  025b ae00e7        	ldw	x,#231
 698  025e bf02          	ldw	c_lreg+2,x
 699  0260 ae0000        	ldw	x,#0
 700  0263 bf00          	ldw	c_lreg,x
 703  0265 81            	ret
 704  0266               L751:
 705                     ; 69 				case 'r': return SEG_E|SEG_G1|SEG_G2;
 707  0266 ae00d0        	ldw	x,#208
 708  0269 bf02          	ldw	c_lreg+2,x
 709  026b ae0000        	ldw	x,#0
 710  026e bf00          	ldw	c_lreg,x
 713  0270 81            	ret
 714  0271               L161:
 715                     ; 70 				case 's': return SEG_A|SEG_C|SEG_D|SEG_F|SEG_G1|SEG_G2;
 717  0271 ae00ed        	ldw	x,#237
 718  0274 bf02          	ldw	c_lreg+2,x
 719  0276 ae0000        	ldw	x,#0
 720  0279 bf00          	ldw	c_lreg,x
 723  027b 81            	ret
 724  027c               L361:
 725                     ; 71 				case 't': return SEG_D|SEG_E|SEG_F|SEG_G1|SEG_G2;
 727  027c ae00f8        	ldw	x,#248
 728  027f bf02          	ldw	c_lreg+2,x
 729  0281 ae0000        	ldw	x,#0
 730  0284 bf00          	ldw	c_lreg,x
 733  0286 81            	ret
 734  0287               L561:
 735                     ; 72 				case 'u': return SEG_C|SEG_D|SEG_E;
 737  0287 ae001c        	ldw	x,#28
 738  028a bf02          	ldw	c_lreg+2,x
 739  028c ae0000        	ldw	x,#0
 740  028f bf00          	ldw	c_lreg,x
 743  0291 81            	ret
 744  0292               L761:
 745                     ; 73 				case 'v': return SEG_E|SEG_K|SEG_M;
 747  0292 ae2810        	ldw	x,#10256
 748  0295 bf02          	ldw	c_lreg+2,x
 749  0297 ae0000        	ldw	x,#0
 750  029a bf00          	ldw	c_lreg,x
 753  029c 81            	ret
 754  029d               L171:
 755                     ; 74 				case 'w': return SEG_C|SEG_E|SEG_K|SEG_M;
 757  029d ae2814        	ldw	x,#10260
 758  02a0 bf02          	ldw	c_lreg+2,x
 759  02a2 ae0000        	ldw	x,#0
 760  02a5 bf00          	ldw	c_lreg,x
 763  02a7 81            	ret
 764  02a8               L371:
 765                     ; 75 				case 'x': return SEG_H|SEG_J|SEG_K|SEG_M;
 767  02a8 ae2d00        	ldw	x,#11520
 768  02ab bf02          	ldw	c_lreg+2,x
 769  02ad ae0000        	ldw	x,#0
 770  02b0 bf00          	ldw	c_lreg,x
 773  02b2 81            	ret
 774  02b3               L571:
 775                     ; 76 				case 'y': return SEG_B|SEG_C|SEG_D|SEG_F|SEG_G1|SEG_G2;
 777  02b3 ae00ee        	ldw	x,#238
 778  02b6 bf02          	ldw	c_lreg+2,x
 779  02b8 ae0000        	ldw	x,#0
 780  02bb bf00          	ldw	c_lreg,x
 783  02bd 81            	ret
 784  02be               L771:
 785                     ; 77 				case 'z': return SEG_A|SEG_D|SEG_J|SEG_K;
 787  02be ae0c09        	ldw	x,#3081
 788  02c1 bf02          	ldw	c_lreg+2,x
 789  02c3 ae0000        	ldw	x,#0
 790  02c6 bf00          	ldw	c_lreg,x
 793  02c8 81            	ret
 794  02c9               L102:
 795                     ; 79         case ' ': return 0;
 797  02c9 ae0000        	ldw	x,#0
 798  02cc bf02          	ldw	c_lreg+2,x
 799  02ce ae0000        	ldw	x,#0
 800  02d1 bf00          	ldw	c_lreg,x
 803  02d3 81            	ret
 804  02d4               L302:
 805                     ; 80         case '-': return SEG_G1 | SEG_G2;
 807  02d4 ae00c0        	ldw	x,#192
 808  02d7 bf02          	ldw	c_lreg+2,x
 809  02d9 ae0000        	ldw	x,#0
 810  02dc bf00          	ldw	c_lreg,x
 813  02de 81            	ret
 814  02df               L502:
 815                     ; 81         case '_': return SEG_D;
 817  02df ae0008        	ldw	x,#8
 818  02e2 bf02          	ldw	c_lreg+2,x
 819  02e4 ae0000        	ldw	x,#0
 820  02e7 bf00          	ldw	c_lreg,x
 823  02e9 81            	ret
 824  02ea               L702:
 825                     ; 82         case '"': return SEG_H | SEG_J;
 827  02ea ae0500        	ldw	x,#1280
 828  02ed bf02          	ldw	c_lreg+2,x
 829  02ef ae0000        	ldw	x,#0
 830  02f2 bf00          	ldw	c_lreg,x
 833  02f4 81            	ret
 834  02f5               L112:
 835                     ; 83         case '\'': return SEG_H | SEG_M;
 837  02f5 ae2100        	ldw	x,#8448
 838  02f8 bf02          	ldw	c_lreg+2,x
 839  02fa ae0000        	ldw	x,#0
 840  02fd bf00          	ldw	c_lreg,x
 843  02ff 81            	ret
 844  0300               L312:
 845                     ; 84         case '+': return SEG_G1 | SEG_G2 | SEG_I | SEG_L;
 847  0300 ae12c0        	ldw	x,#4800
 848  0303 bf02          	ldw	c_lreg+2,x
 849  0305 ae0000        	ldw	x,#0
 850  0308 bf00          	ldw	c_lreg,x
 853  030a 81            	ret
 854  030b               L512:
 855                     ; 85         case '*': return SEG_G1 | SEG_G2 | SEG_H | SEG_I | SEG_J | SEG_K | SEG_L | SEG_M;
 857  030b ae3fc0        	ldw	x,#16320
 858  030e bf02          	ldw	c_lreg+2,x
 859  0310 ae0000        	ldw	x,#0
 860  0313 bf00          	ldw	c_lreg,x
 863  0315 81            	ret
 864  0316               L712:
 865                     ; 86         case '/': return SEG_J | SEG_K;
 867  0316 ae0c00        	ldw	x,#3072
 868  0319 bf02          	ldw	c_lreg+2,x
 869  031b ae0000        	ldw	x,#0
 870  031e bf00          	ldw	c_lreg,x
 873  0320 81            	ret
 874  0321               L122:
 875                     ; 87 				case '.': return SEG_DP;//if avaiable
 877  0321 ae4000        	ldw	x,#16384
 878  0324 bf02          	ldw	c_lreg+2,x
 879  0326 ae0000        	ldw	x,#0
 880  0329 bf00          	ldw	c_lreg,x
 883  032b 81            	ret
 884  032c               L322:
 885                     ; 88         default: return 0;
 887  032c ae0000        	ldw	x,#0
 888  032f bf02          	ldw	c_lreg+2,x
 889  0331 ae0000        	ldw	x,#0
 890  0334 bf00          	ldw	c_lreg,x
 893  0336 81            	ret
 896                     	switch	.const
 897  00a8               L552_logical_to_physical:
 898  00a8 04            	dc.b	4
 899  00a9 05            	dc.b	5
 900  00aa 10            	dc.b	16
 901  00ab 0e            	dc.b	14
 902  00ac 0f            	dc.b	15
 903  00ad 06            	dc.b	6
 904  00ae 0b            	dc.b	11
 905  00af 0a            	dc.b	10
 906  00b0 09            	dc.b	9
 907  00b1 08            	dc.b	8
 908  00b2 07            	dc.b	7
 909  00b3 11            	dc.b	17
 910  00b4 0d            	dc.b	13
 911  00b5 0c            	dc.b	12
 912  00b6 03            	dc.b	3
 913  00b7 00            	ds.b	1
 964                     ; 109 static uint32_t pt6311_remap(uint32_t logical) {
 965                     .text:	section	.text,new
 966  0000               L752_pt6311_remap:
 968  0000 5205          	subw	sp,#5
 969       00000005      OFST:	set	5
 972                     ; 110     uint32_t physical = 0;
 974  0002 ae0000        	ldw	x,#0
 975  0005 1f03          	ldw	(OFST-2,sp),x
 976  0007 ae0000        	ldw	x,#0
 977  000a 1f01          	ldw	(OFST-4,sp),x
 979                     ; 112     for (i = 0; i < 15; i++) {
 981  000c 0f05          	clr	(OFST+0,sp)
 983  000e               L703:
 984                     ; 113         if (logical & (1UL << i)) {
 986  000e ae0001        	ldw	x,#1
 987  0011 bf02          	ldw	c_lreg+2,x
 988  0013 ae0000        	ldw	x,#0
 989  0016 bf00          	ldw	c_lreg,x
 990  0018 7b05          	ld	a,(OFST+0,sp)
 991  001a cd0000        	call	c_llsh
 993  001d 96            	ldw	x,sp
 994  001e 1c0008        	addw	x,#OFST+3
 995  0021 cd0000        	call	c_land
 997  0024 cd0000        	call	c_lrzmp
 999  0027 271b          	jreq	L513
1000                     ; 114             physical |= (1UL << logical_to_physical[i]);
1002  0029 ae0001        	ldw	x,#1
1003  002c bf02          	ldw	c_lreg+2,x
1004  002e ae0000        	ldw	x,#0
1005  0031 bf00          	ldw	c_lreg,x
1006  0033 7b05          	ld	a,(OFST+0,sp)
1007  0035 5f            	clrw	x
1008  0036 97            	ld	xl,a
1009  0037 d600a8        	ld	a,(L552_logical_to_physical,x)
1010  003a cd0000        	call	c_llsh
1012  003d 96            	ldw	x,sp
1013  003e 1c0001        	addw	x,#OFST-4
1014  0041 cd0000        	call	c_lgor
1017  0044               L513:
1018                     ; 112     for (i = 0; i < 15; i++) {
1020  0044 0c05          	inc	(OFST+0,sp)
1024  0046 7b05          	ld	a,(OFST+0,sp)
1025  0048 a10f          	cp	a,#15
1026  004a 25c2          	jrult	L703
1027                     ; 117     return physical;
1029  004c 96            	ldw	x,sp
1030  004d 1c0001        	addw	x,#OFST-4
1031  0050 cd0000        	call	c_ltor
1035  0053 5b05          	addw	sp,#5
1036  0055 81            	ret
1061                     ; 120 void pt6311_setup_io(void)
1061                     ; 121 {
1062                     .text:	section	.text,new
1063  0000               _pt6311_setup_io:
1067                     ; 122     GPIO_Init(PT6311_DIN_PORT,  PT6311_DIN_PIN,  GPIO_MODE_OUT_PP_HIGH_FAST);
1069  0000 4bf0          	push	#240
1070  0002 4b20          	push	#32
1071  0004 ae500a        	ldw	x,#20490
1072  0007 cd0000        	call	_GPIO_Init
1074  000a 85            	popw	x
1075                     ; 123     GPIO_Init(PT6311_CLK_PORT,  PT6311_CLK_PIN,  GPIO_MODE_OUT_PP_HIGH_FAST);
1077  000b 4bf0          	push	#240
1078  000d 4b10          	push	#16
1079  000f ae500a        	ldw	x,#20490
1080  0012 cd0000        	call	_GPIO_Init
1082  0015 85            	popw	x
1083                     ; 124     GPIO_Init(PT6311_STB_PORT,  PT6311_STB_PIN,  GPIO_MODE_OUT_PP_HIGH_FAST);
1085  0016 4bf0          	push	#240
1086  0018 4b08          	push	#8
1087  001a ae500a        	ldw	x,#20490
1088  001d cd0000        	call	_GPIO_Init
1090  0020 85            	popw	x
1091                     ; 126     PT6311_DIN_HIGH();
1093  0021 4b20          	push	#32
1094  0023 ae500a        	ldw	x,#20490
1095  0026 cd0000        	call	_GPIO_WriteHigh
1097  0029 84            	pop	a
1098                     ; 127     PT6311_CLK_HIGH();
1100  002a 4b10          	push	#16
1101  002c ae500a        	ldw	x,#20490
1102  002f cd0000        	call	_GPIO_WriteHigh
1104  0032 84            	pop	a
1105                     ; 128     PT6311_STB_HIGH();
1107  0033 4b08          	push	#8
1108  0035 ae500a        	ldw	x,#20490
1109  0038 cd0000        	call	_GPIO_WriteHigh
1111  003b 84            	pop	a
1112                     ; 129 }
1115  003c 81            	ret
1140                     ; 131 static void pt6311_start(void)
1140                     ; 132 {
1141                     .text:	section	.text,new
1142  0000               L723_pt6311_start:
1146                     ; 133     PT6311_STB_LOW();
1148  0000 4b08          	push	#8
1149  0002 ae500a        	ldw	x,#20490
1150  0005 cd0000        	call	_GPIO_WriteLow
1152  0008 84            	pop	a
1153                     ; 134     delay_us(10);        
1155  0009 ae000a        	ldw	x,#10
1156  000c cd0000        	call	_delay_us
1158                     ; 135 }
1161  000f 81            	ret
1186                     ; 137 static void pt6311_stop(void)
1186                     ; 138 {
1187                     .text:	section	.text,new
1188  0000               L143_pt6311_stop:
1192                     ; 139     PT6311_STB_HIGH();
1194  0000 4b08          	push	#8
1195  0002 ae500a        	ldw	x,#20490
1196  0005 cd0000        	call	_GPIO_WriteHigh
1198  0008 84            	pop	a
1199                     ; 140     delay_us(10);
1201  0009 ae000a        	ldw	x,#10
1202  000c cd0000        	call	_delay_us
1204                     ; 141 }
1207  000f 81            	ret
1253                     ; 143 static void pt6311_shift_out(uint8_t data)
1253                     ; 144 {
1254                     .text:	section	.text,new
1255  0000               L353_pt6311_shift_out:
1257  0000 88            	push	a
1258  0001 88            	push	a
1259       00000001      OFST:	set	1
1262                     ; 146     for (i = 0; i < 8; i++)
1264  0002 0f01          	clr	(OFST+0,sp)
1266  0004               L773:
1267                     ; 148         if (data & 0x01)
1269  0004 7b02          	ld	a,(OFST+1,sp)
1270  0006 a501          	bcp	a,#1
1271  0008 270b          	jreq	L504
1272                     ; 149             PT6311_DIN_HIGH();
1274  000a 4b20          	push	#32
1275  000c ae500a        	ldw	x,#20490
1276  000f cd0000        	call	_GPIO_WriteHigh
1278  0012 84            	pop	a
1280  0013 2009          	jra	L704
1281  0015               L504:
1282                     ; 151             PT6311_DIN_LOW();
1284  0015 4b20          	push	#32
1285  0017 ae500a        	ldw	x,#20490
1286  001a cd0000        	call	_GPIO_WriteLow
1288  001d 84            	pop	a
1289  001e               L704:
1290                     ; 153         PT6311_CLK_LOW();
1292  001e 4b10          	push	#16
1293  0020 ae500a        	ldw	x,#20490
1294  0023 cd0000        	call	_GPIO_WriteLow
1296  0026 84            	pop	a
1297                     ; 154         delay_us(5);    
1299  0027 ae0005        	ldw	x,#5
1300  002a cd0000        	call	_delay_us
1302                     ; 155         PT6311_CLK_HIGH();
1304  002d 4b10          	push	#16
1305  002f ae500a        	ldw	x,#20490
1306  0032 cd0000        	call	_GPIO_WriteHigh
1308  0035 84            	pop	a
1309                     ; 156         delay_us(5);
1311  0036 ae0005        	ldw	x,#5
1312  0039 cd0000        	call	_delay_us
1314                     ; 158         data >>= 1;
1316  003c 0402          	srl	(OFST+1,sp)
1317                     ; 146     for (i = 0; i < 8; i++)
1319  003e 0c01          	inc	(OFST+0,sp)
1323  0040 7b01          	ld	a,(OFST+0,sp)
1324  0042 a108          	cp	a,#8
1325  0044 25be          	jrult	L773
1326                     ; 160 }
1329  0046 85            	popw	x
1330  0047 81            	ret
1392                     ; 161 void pt6311_init(uint8_t num_digits)
1392                     ; 162 {
1393                     .text:	section	.text,new
1394  0000               _pt6311_init:
1396  0000 88            	push	a
1397  0001 88            	push	a
1398       00000001      OFST:	set	1
1401                     ; 164     if (num_digits < PT6311_MIN_DIGITS) num_digits = PT6311_MIN_DIGITS;
1403  0002 a104          	cp	a,#4
1404  0004 2404          	jruge	L164
1407  0006 a604          	ld	a,#4
1408  0008 6b02          	ld	(OFST+1,sp),a
1409  000a               L164:
1410                     ; 165     if (num_digits > PT6311_MAX_DIGITS) num_digits = PT6311_MAX_DIGITS;
1412  000a 7b02          	ld	a,(OFST+1,sp)
1413  000c a10d          	cp	a,#13
1414  000e 2504          	jrult	L364
1417  0010 a60c          	ld	a,#12
1418  0012 6b02          	ld	(OFST+1,sp),a
1419  0014               L364:
1420                     ; 166     pt6311_num_digits = num_digits+1;//correct num digits error
1422  0014 7b02          	ld	a,(OFST+1,sp)
1423  0016 4c            	inc	a
1424  0017 b700          	ld	_pt6311_num_digits,a
1425                     ; 167     pt6311_setup_io();
1427  0019 cd0000        	call	_pt6311_setup_io
1429                     ; 169     delay_ms(50);
1431  001c ae0032        	ldw	x,#50
1432  001f cd0000        	call	_delay_ms
1434                     ; 170     pt6311_start();
1436  0022 cd0000        	call	L723_pt6311_start
1438                     ; 171     pt6311_shift_out(PT6311_CMD2 | 0b00000000);
1440  0025 a640          	ld	a,#64
1441  0027 cd0000        	call	L353_pt6311_shift_out
1443                     ; 172     pt6311_stop();
1445  002a cd0000        	call	L143_pt6311_stop
1447                     ; 174     pt6311_start();
1449  002d cd0000        	call	L723_pt6311_start
1451                     ; 175     pt6311_shift_out(PT6311_CMD3); 
1453  0030 a6c0          	ld	a,#192
1454  0032 cd0000        	call	L353_pt6311_shift_out
1456                     ; 176     for (i = 0; i < (pt6311_num_digits * 3); i++) {
1458  0035 0f01          	clr	(OFST+0,sp)
1461  0037 2006          	jra	L174
1462  0039               L564:
1463                     ; 177     pt6311_shift_out(0x00);
1465  0039 4f            	clr	a
1466  003a cd0000        	call	L353_pt6311_shift_out
1468                     ; 176     for (i = 0; i < (pt6311_num_digits * 3); i++) {
1470  003d 0c01          	inc	(OFST+0,sp)
1472  003f               L174:
1475  003f 9c            	rvf
1476  0040 b600          	ld	a,_pt6311_num_digits
1477  0042 97            	ld	xl,a
1478  0043 a603          	ld	a,#3
1479  0045 42            	mul	x,a
1480  0046 7b01          	ld	a,(OFST+0,sp)
1481  0048 905f          	clrw	y
1482  004a 9097          	ld	yl,a
1483  004c 90bf00        	ldw	c_y,y
1484  004f b300          	cpw	x,c_y
1485  0051 2ce6          	jrsgt	L564
1486                     ; 179     pt6311_stop();
1488  0053 cd0000        	call	L143_pt6311_stop
1490                     ; 181     cmd1 = PT6311_CMD1;
1492  0056 0f01          	clr	(OFST+0,sp)
1494                     ; 195     switch(pt6311_num_digits) {
1496  0058 b600          	ld	a,_pt6311_num_digits
1498                     ; 204         default:  cmd1 |= PT6311_DIG4_SEG24;  break;
1499  005a a005          	sub	a,#5
1500  005c 274f          	jreq	L724
1501  005e 4a            	dec	a
1502  005f 2744          	jreq	L524
1503  0061 4a            	dec	a
1504  0062 2739          	jreq	L324
1505  0064 4a            	dec	a
1506  0065 272e          	jreq	L124
1507  0067 4a            	dec	a
1508  0068 2723          	jreq	L714
1509  006a 4a            	dec	a
1510  006b 2718          	jreq	L514
1511  006d 4a            	dec	a
1512  006e 270d          	jreq	L314
1513  0070 4a            	dec	a
1514  0071 2702          	jreq	L114
1515  0073               L134:
1520  0073 203e          	jra	L774
1521  0075               L114:
1522                     ; 196         case 12:  cmd1 |= PT6311_DIG12_SEG16; break;
1524  0075 7b01          	ld	a,(OFST+0,sp)
1525  0077 aa08          	or	a,#8
1526  0079 6b01          	ld	(OFST+0,sp),a
1530  007b 2036          	jra	L774
1531  007d               L314:
1532                     ; 197         case 11:  cmd1 |= PT6311_DIG11_SEG17; break;
1534  007d 7b01          	ld	a,(OFST+0,sp)
1535  007f aa07          	or	a,#7
1536  0081 6b01          	ld	(OFST+0,sp),a
1540  0083 202e          	jra	L774
1541  0085               L514:
1542                     ; 198         case 10:  cmd1 |= PT6311_DIG10_SEG18; break;
1544  0085 7b01          	ld	a,(OFST+0,sp)
1545  0087 aa06          	or	a,#6
1546  0089 6b01          	ld	(OFST+0,sp),a
1550  008b 2026          	jra	L774
1551  008d               L714:
1552                     ; 199         case 9:   cmd1 |= PT6311_DIG9_SEG19;  break;
1554  008d 7b01          	ld	a,(OFST+0,sp)
1555  008f aa05          	or	a,#5
1556  0091 6b01          	ld	(OFST+0,sp),a
1560  0093 201e          	jra	L774
1561  0095               L124:
1562                     ; 200         case 8:   cmd1 |= PT6311_DIG8_SEG20;  break;
1564  0095 7b01          	ld	a,(OFST+0,sp)
1565  0097 aa04          	or	a,#4
1566  0099 6b01          	ld	(OFST+0,sp),a
1570  009b 2016          	jra	L774
1571  009d               L324:
1572                     ; 201         case 7:   cmd1 |= PT6311_DIG7_SEG21;  break;
1574  009d 7b01          	ld	a,(OFST+0,sp)
1575  009f aa03          	or	a,#3
1576  00a1 6b01          	ld	(OFST+0,sp),a
1580  00a3 200e          	jra	L774
1581  00a5               L524:
1582                     ; 202         case 6:   cmd1 |= PT6311_DIG6_SEG22;  break;
1584  00a5 7b01          	ld	a,(OFST+0,sp)
1585  00a7 aa02          	or	a,#2
1586  00a9 6b01          	ld	(OFST+0,sp),a
1590  00ab 2006          	jra	L774
1591  00ad               L724:
1592                     ; 203         case 5:   cmd1 |= PT6311_DIG5_SEG23;  break;
1594  00ad 7b01          	ld	a,(OFST+0,sp)
1595  00af aa01          	or	a,#1
1596  00b1 6b01          	ld	(OFST+0,sp),a
1600  00b3               L774:
1601                     ; 207     pt6311_start();
1603  00b3 cd0000        	call	L723_pt6311_start
1605                     ; 208     pt6311_shift_out(cmd1);
1607  00b6 7b01          	ld	a,(OFST+0,sp)
1608  00b8 cd0000        	call	L353_pt6311_shift_out
1610                     ; 209     pt6311_stop();
1612  00bb cd0000        	call	L143_pt6311_stop
1614                     ; 211     pt6311_set_display_state(set_state);
1616  00be b601          	ld	a,_set_state
1617  00c0 cd0000        	call	_pt6311_set_display_state
1619                     ; 212     pt6311_set_brightness(set_brightness);
1621  00c3 b600          	ld	a,_set_brightness
1622  00c5 cd0000        	call	_pt6311_set_brightness
1624                     ; 213 }
1627  00c8 85            	popw	x
1628  00c9 81            	ret
1739                     ; 215 void pt6311_set_brightness(pt6311_brightness_t brightness)
1739                     ; 216 {
1740                     .text:	section	.text,new
1741  0000               _pt6311_set_brightness:
1745                     ; 217     set_brightness = brightness;
1747  0000 b700          	ld	_set_brightness,a
1748                     ; 219     pt6311_start();
1750  0002 cd0000        	call	L723_pt6311_start
1752                     ; 220     pt6311_shift_out(PT6311_CMD4 | set_state | set_brightness);
1754  0005 b601          	ld	a,_set_state
1755  0007 aa80          	or	a,#128
1756  0009 ba00          	or	a,_set_brightness
1757  000b cd0000        	call	L353_pt6311_shift_out
1759                     ; 221     pt6311_stop();
1761  000e cd0000        	call	L143_pt6311_stop
1763                     ; 222 }
1766  0011 81            	ret
1827                     ; 224 void pt6311_set_display_state(pt6311_display_state_t state)
1827                     ; 225 {
1828                     .text:	section	.text,new
1829  0000               _pt6311_set_display_state:
1833                     ; 226     set_state = state;
1835  0000 b701          	ld	_set_state,a
1836                     ; 228     pt6311_start();
1838  0002 cd0000        	call	L723_pt6311_start
1840                     ; 229     pt6311_shift_out(PT6311_CMD4 | set_state | set_brightness);
1842  0005 b601          	ld	a,_set_state
1843  0007 aa80          	or	a,#128
1844  0009 ba00          	or	a,_set_brightness
1845  000b cd0000        	call	L353_pt6311_shift_out
1847                     ; 230     pt6311_stop();
1849  000e cd0000        	call	L143_pt6311_stop
1851                     ; 231 }
1854  0011 81            	ret
1910                     ; 233 void pt6311_write_digit(uint8_t logical_digit, uint32_t segments)
1910                     ; 234 {
1911                     .text:	section	.text,new
1912  0000               _pt6311_write_digit:
1914  0000 88            	push	a
1915  0001 88            	push	a
1916       00000001      OFST:	set	1
1919                     ; 237 		physical_pos = pt6311_num_digits - logical_digit;
1921  0002 b000          	sub	a,_pt6311_num_digits
1922  0004 40            	neg	a
1923  0005 6b01          	ld	(OFST+0,sp),a
1925                     ; 239     pt6311_start();
1927  0007 cd0000        	call	L723_pt6311_start
1929                     ; 240     pt6311_shift_out(PT6311_CMD3 | (physical_pos * 3u));
1931  000a 7b01          	ld	a,(OFST+0,sp)
1932  000c 97            	ld	xl,a
1933  000d a603          	ld	a,#3
1934  000f 42            	mul	x,a
1935  0010 9f            	ld	a,xl
1936  0011 aac0          	or	a,#192
1937  0013 cd0000        	call	L353_pt6311_shift_out
1939                     ; 241     pt6311_shift_out((uint8_t)segments);
1941  0016 7b08          	ld	a,(OFST+7,sp)
1942  0018 cd0000        	call	L353_pt6311_shift_out
1944                     ; 242     pt6311_shift_out((uint8_t)(segments >> 8));
1946  001b 7b07          	ld	a,(OFST+6,sp)
1947  001d cd0000        	call	L353_pt6311_shift_out
1949                     ; 243     pt6311_shift_out((uint8_t)(segments >> 16));
1951  0020 7b06          	ld	a,(OFST+5,sp)
1952  0022 cd0000        	call	L353_pt6311_shift_out
1954                     ; 244     pt6311_stop();
1956  0025 cd0000        	call	L143_pt6311_stop
1958                     ; 245 }
1961  0028 85            	popw	x
1962  0029 81            	ret
2026                     ; 247 void pt6311_write_char(uint8_t digit_pos, char chr)
2026                     ; 248 {
2027                     .text:	section	.text,new
2028  0000               _pt6311_write_char:
2030  0000 89            	pushw	x
2031  0001 5204          	subw	sp,#4
2032       00000004      OFST:	set	4
2035                     ; 249     uint32_t logical = pt6311_font(chr);
2037  0003 9f            	ld	a,xl
2038  0004 cd0000        	call	L3_pt6311_font
2040  0007 96            	ldw	x,sp
2041  0008 1c0001        	addw	x,#OFST-3
2042  000b cd0000        	call	c_rtol
2045                     ; 250     uint32_t physical = pt6311_remap(logical);
2047  000e 1e03          	ldw	x,(OFST-1,sp)
2048  0010 89            	pushw	x
2049  0011 1e03          	ldw	x,(OFST-1,sp)
2050  0013 89            	pushw	x
2051  0014 cd0000        	call	L752_pt6311_remap
2053  0017 5b04          	addw	sp,#4
2054  0019 96            	ldw	x,sp
2055  001a 1c0001        	addw	x,#OFST-3
2056  001d cd0000        	call	c_rtol
2059                     ; 251     pt6311_write_digit(digit_pos, physical);
2061  0020 1e03          	ldw	x,(OFST-1,sp)
2062  0022 89            	pushw	x
2063  0023 1e03          	ldw	x,(OFST-1,sp)
2064  0025 89            	pushw	x
2065  0026 7b09          	ld	a,(OFST+5,sp)
2066  0028 cd0000        	call	_pt6311_write_digit
2068  002b 5b04          	addw	sp,#4
2069                     ; 252 }
2072  002d 5b06          	addw	sp,#6
2073  002f 81            	ret
2148                     ; 254 void pt6311_write_char_dot(uint8_t digit_pos, char chr, bool dot) {
2149                     .text:	section	.text,new
2150  0000               _pt6311_write_char_dot:
2152  0000 89            	pushw	x
2153  0001 5204          	subw	sp,#4
2154       00000004      OFST:	set	4
2157                     ; 256 		uint32_t logical = pt6311_font(chr);
2159  0003 9f            	ld	a,xl
2160  0004 cd0000        	call	L3_pt6311_font
2162  0007 96            	ldw	x,sp
2163  0008 1c0001        	addw	x,#OFST-3
2164  000b cd0000        	call	c_rtol
2167                     ; 257     if (dot) {
2169  000e 7b09          	ld	a,(OFST+5,sp)
2170  0010 a501          	bcp	a,#1
2171  0012 2706          	jreq	L707
2172                     ; 258         logical |= SEG_DP;
2174  0014 7b03          	ld	a,(OFST-1,sp)
2175  0016 aa40          	or	a,#64
2176  0018 6b03          	ld	(OFST-1,sp),a
2178  001a               L707:
2179                     ; 260     physical = pt6311_remap(logical);
2181  001a 1e03          	ldw	x,(OFST-1,sp)
2182  001c 89            	pushw	x
2183  001d 1e03          	ldw	x,(OFST-1,sp)
2184  001f 89            	pushw	x
2185  0020 cd0000        	call	L752_pt6311_remap
2187  0023 5b04          	addw	sp,#4
2188  0025 96            	ldw	x,sp
2189  0026 1c0001        	addw	x,#OFST-3
2190  0029 cd0000        	call	c_rtol
2193                     ; 261     pt6311_write_digit(digit_pos, physical);
2195  002c 1e03          	ldw	x,(OFST-1,sp)
2196  002e 89            	pushw	x
2197  002f 1e03          	ldw	x,(OFST-1,sp)
2198  0031 89            	pushw	x
2199  0032 7b09          	ld	a,(OFST+5,sp)
2200  0034 cd0000        	call	_pt6311_write_digit
2202  0037 5b04          	addw	sp,#4
2203                     ; 262 }
2206  0039 5b06          	addw	sp,#6
2207  003b 81            	ret
2254                     ; 264 void pt6311_write_string(uint8_t digit_pos,const char *str)
2254                     ; 265 {
2255                     .text:	section	.text,new
2256  0000               _pt6311_write_string:
2258  0000 88            	push	a
2259       00000000      OFST:	set	0
2262  0001 2013          	jra	L537
2263  0003               L337:
2264                     ; 268         pt6311_write_char(digit_pos, *str);
2266  0003 1e04          	ldw	x,(OFST+4,sp)
2267  0005 f6            	ld	a,(x)
2268  0006 97            	ld	xl,a
2269  0007 7b01          	ld	a,(OFST+1,sp)
2270  0009 95            	ld	xh,a
2271  000a cd0000        	call	_pt6311_write_char
2273                     ; 269         str++;
2275  000d 1e04          	ldw	x,(OFST+4,sp)
2276  000f 1c0001        	addw	x,#1
2277  0012 1f04          	ldw	(OFST+4,sp),x
2278                     ; 270         digit_pos++;
2280  0014 0c01          	inc	(OFST+1,sp)
2281  0016               L537:
2282                     ; 266     while (*str && digit_pos < pt6311_num_digits)
2284  0016 1e04          	ldw	x,(OFST+4,sp)
2285  0018 7d            	tnz	(x)
2286  0019 2706          	jreq	L147
2288  001b 7b01          	ld	a,(OFST+1,sp)
2289  001d b100          	cp	a,_pt6311_num_digits
2290  001f 25e2          	jrult	L337
2291  0021               L147:
2292                     ; 272 }
2295  0021 84            	pop	a
2296  0022 81            	ret
2351                     ; 273 void pt6311_clock_format(uint8_t digit_pos, uint8_t value,bool colon)
2351                     ; 274 {
2352                     .text:	section	.text,new
2353  0000               _pt6311_clock_format:
2355  0000 89            	pushw	x
2356       00000000      OFST:	set	0
2359                     ; 275     pt6311_write_char_dot(digit_pos,(value / 10) + '0',colon);
2361  0001 7b05          	ld	a,(OFST+5,sp)
2362  0003 a401          	and	a,#1
2363  0005 88            	push	a
2364  0006 9f            	ld	a,xl
2365  0007 5f            	clrw	x
2366  0008 97            	ld	xl,a
2367  0009 a60a          	ld	a,#10
2368  000b 62            	div	x,a
2369  000c 9f            	ld	a,xl
2370  000d ab30          	add	a,#48
2371  000f 97            	ld	xl,a
2372  0010 7b02          	ld	a,(OFST+2,sp)
2373  0012 95            	ld	xh,a
2374  0013 cd0000        	call	_pt6311_write_char_dot
2376  0016 84            	pop	a
2377                     ; 277     pt6311_write_char_dot(digit_pos + 1,(value % 10) + '0',colon);
2379  0017 7b05          	ld	a,(OFST+5,sp)
2380  0019 a401          	and	a,#1
2381  001b 88            	push	a
2382  001c 7b03          	ld	a,(OFST+3,sp)
2383  001e 5f            	clrw	x
2384  001f 97            	ld	xl,a
2385  0020 a60a          	ld	a,#10
2386  0022 62            	div	x,a
2387  0023 5f            	clrw	x
2388  0024 97            	ld	xl,a
2389  0025 9f            	ld	a,xl
2390  0026 ab30          	add	a,#48
2391  0028 97            	ld	xl,a
2392  0029 7b02          	ld	a,(OFST+2,sp)
2393  002b 4c            	inc	a
2394  002c 95            	ld	xh,a
2395  002d cd0000        	call	_pt6311_write_char_dot
2397  0030 84            	pop	a
2398                     ; 278 }
2401  0031 85            	popw	x
2402  0032 81            	ret
2486                     ; 279 void pt6311_scroll_string(uint8_t digit_pos,const char *str) {
2487                     .text:	section	.text,new
2488  0000               _pt6311_scroll_string:
2490  0000 88            	push	a
2491  0001 5204          	subw	sp,#4
2492       00000004      OFST:	set	4
2495                     ; 281 		uint8_t scroll_pos = 0; 
2497  0003 0f02          	clr	(OFST-2,sp)
2499                     ; 282     len = strlen(str);
2501  0005 1e08          	ldw	x,(OFST+4,sp)
2502  0007 cd0000        	call	_strlen
2504  000a 01            	rrwa	x,a
2505  000b 6b01          	ld	(OFST-3,sp),a
2506  000d 02            	rlwa	x,a
2508                     ; 284     for (i = 0; i < pt6311_num_digits; i++) {
2510  000e 0f04          	clr	(OFST+0,sp)
2513  0010 2028          	jra	L7301
2514  0012               L3301:
2515                     ; 285         idx = scroll_pos + i;
2517  0012 7b02          	ld	a,(OFST-2,sp)
2518  0014 1b04          	add	a,(OFST+0,sp)
2519  0016 6b03          	ld	(OFST-1,sp),a
2521                     ; 286         if (idx < len) {
2523  0018 7b03          	ld	a,(OFST-1,sp)
2524  001a 1101          	cp	a,(OFST-3,sp)
2525  001c 2411          	jruge	L3401
2526                     ; 287             pt6311_write_char(i, str[idx]);
2528  001e 7b03          	ld	a,(OFST-1,sp)
2529  0020 5f            	clrw	x
2530  0021 97            	ld	xl,a
2531  0022 72fb08        	addw	x,(OFST+4,sp)
2532  0025 f6            	ld	a,(x)
2533  0026 97            	ld	xl,a
2534  0027 7b04          	ld	a,(OFST+0,sp)
2535  0029 95            	ld	xh,a
2536  002a cd0000        	call	_pt6311_write_char
2539  002d 2009          	jra	L5401
2540  002f               L3401:
2541                     ; 289             pt6311_write_char(i, ' ');
2543  002f 7b04          	ld	a,(OFST+0,sp)
2544  0031 ae0020        	ldw	x,#32
2545  0034 95            	ld	xh,a
2546  0035 cd0000        	call	_pt6311_write_char
2548  0038               L5401:
2549                     ; 284     for (i = 0; i < pt6311_num_digits; i++) {
2551  0038 0c04          	inc	(OFST+0,sp)
2553  003a               L7301:
2556  003a 7b04          	ld	a,(OFST+0,sp)
2557  003c b100          	cp	a,_pt6311_num_digits
2558  003e 25d2          	jrult	L3301
2559                     ; 292     scroll_pos++;
2561  0040 0c02          	inc	(OFST-2,sp)
2563                     ; 293     if (scroll_pos > len) {
2565  0042 7b02          	ld	a,(OFST-2,sp)
2566  0044 1101          	cp	a,(OFST-3,sp)
2567  0046 2300          	jrule	L7401
2568                     ; 294         scroll_pos = 0;
2570  0048               L7401:
2571                     ; 296 }
2574  0048 5b05          	addw	sp,#5
2575  004a 81            	ret
2639                     ; 299 void pt6311_write_int(uint8_t digit_pos,int value)
2639                     ; 300 {
2640                     .text:	section	.text,new
2641  0000               _pt6311_write_int:
2643  0000 88            	push	a
2644  0001 520b          	subw	sp,#11
2645       0000000b      OFST:	set	11
2648                     ; 302     uint8_t i = 0;
2650  0003 0f0b          	clr	(OFST+0,sp)
2652                     ; 304     if (value < 0)
2654  0005 9c            	rvf
2655  0006 1e0f          	ldw	x,(OFST+4,sp)
2656  0008 2e3e          	jrsge	L7011
2657                     ; 306         pt6311_write_char(digit_pos, '-');
2659  000a ae002d        	ldw	x,#45
2660  000d 95            	ld	xh,a
2661  000e cd0000        	call	_pt6311_write_char
2663                     ; 307         value = -value;
2665  0011 1e0f          	ldw	x,(OFST+4,sp)
2666  0013 50            	negw	x
2667  0014 1f0f          	ldw	(OFST+4,sp),x
2668                     ; 308         digit_pos++;
2670  0016 0c0c          	inc	(OFST+1,sp)
2671  0018 202e          	jra	L7011
2672  001a               L5011:
2673                     ; 313         buf[i++] = (value % 10) + '0';
2675  001a 1e0f          	ldw	x,(OFST+4,sp)
2676  001c a60a          	ld	a,#10
2677  001e cd0000        	call	c_smodx
2679  0021 1c0030        	addw	x,#48
2680  0024 9096          	ldw	y,sp
2681  0026 72a90003      	addw	y,#OFST-8
2682  002a 1701          	ldw	(OFST-10,sp),y
2684  002c 7b0b          	ld	a,(OFST+0,sp)
2685  002e 9097          	ld	yl,a
2686  0030 0c0b          	inc	(OFST+0,sp)
2688  0032 909f          	ld	a,yl
2689  0034 905f          	clrw	y
2690  0036 9097          	ld	yl,a
2691  0038 72f901        	addw	y,(OFST-10,sp)
2692  003b 01            	rrwa	x,a
2693  003c 90f7          	ld	(y),a
2694  003e 02            	rlwa	x,a
2695                     ; 314         value /= 10;
2697  003f 1e0f          	ldw	x,(OFST+4,sp)
2698  0041 a60a          	ld	a,#10
2699  0043 cd0000        	call	c_sdivx
2701  0046 1f0f          	ldw	(OFST+4,sp),x
2702  0048               L7011:
2703                     ; 311     while (value > 0 && i < sizeof(buf))
2705  0048 9c            	rvf
2706  0049 1e0f          	ldw	x,(OFST+4,sp)
2707  004b 2d21          	jrsle	L7111
2709  004d 7b0b          	ld	a,(OFST+0,sp)
2710  004f a108          	cp	a,#8
2711  0051 25c7          	jrult	L5011
2712  0053 2019          	jra	L7111
2713  0055               L5111:
2714                     ; 319         pt6311_write_char(digit_pos++, buf[--i]);
2716  0055 96            	ldw	x,sp
2717  0056 1c0003        	addw	x,#OFST-8
2718  0059 1f01          	ldw	(OFST-10,sp),x
2720  005b 0a0b          	dec	(OFST+0,sp)
2722  005d 7b0b          	ld	a,(OFST+0,sp)
2723  005f 5f            	clrw	x
2724  0060 97            	ld	xl,a
2725  0061 72fb01        	addw	x,(OFST-10,sp)
2726  0064 f6            	ld	a,(x)
2727  0065 97            	ld	xl,a
2728  0066 7b0c          	ld	a,(OFST+1,sp)
2729  0068 0c0c          	inc	(OFST+1,sp)
2730  006a 95            	ld	xh,a
2731  006b cd0000        	call	_pt6311_write_char
2733  006e               L7111:
2734                     ; 317     while (i > 0 && digit_pos < pt6311_num_digits)
2736  006e 0d0b          	tnz	(OFST+0,sp)
2737  0070 2706          	jreq	L3211
2739  0072 7b0c          	ld	a,(OFST+1,sp)
2740  0074 b100          	cp	a,_pt6311_num_digits
2741  0076 25dd          	jrult	L5111
2742  0078               L3211:
2743                     ; 321 }
2746  0078 5b0c          	addw	sp,#12
2747  007a 81            	ret
2784                     ; 322 void pt6311_clear_display(void) {
2785                     .text:	section	.text,new
2786  0000               _pt6311_clear_display:
2788  0000 88            	push	a
2789       00000001      OFST:	set	1
2792                     ; 324     for (i = 0; i < pt6311_num_digits; i++) {
2794  0001 0f01          	clr	(OFST+0,sp)
2797  0003 2011          	jra	L7411
2798  0005               L3411:
2799                     ; 325         pt6311_write_digit(i, 0);
2801  0005 ae0000        	ldw	x,#0
2802  0008 89            	pushw	x
2803  0009 ae0000        	ldw	x,#0
2804  000c 89            	pushw	x
2805  000d 7b05          	ld	a,(OFST+4,sp)
2806  000f cd0000        	call	_pt6311_write_digit
2808  0012 5b04          	addw	sp,#4
2809                     ; 324     for (i = 0; i < pt6311_num_digits; i++) {
2811  0014 0c01          	inc	(OFST+0,sp)
2813  0016               L7411:
2816  0016 7b01          	ld	a,(OFST+0,sp)
2817  0018 b100          	cp	a,_pt6311_num_digits
2818  001a 25e9          	jrult	L3411
2819                     ; 327 }
2822  001c 84            	pop	a
2823  001d 81            	ret
2878                     ; 330 void pt6311_test_digit_positions(uint8_t num_digits, uint16_t delay_per_digit_ms)
2878                     ; 331 {
2879                     .text:	section	.text,new
2880  0000               _pt6311_test_digit_positions:
2882  0000 88            	push	a
2883  0001 88            	push	a
2884       00000001      OFST:	set	1
2887                     ; 334     for (pos = 1; pos < num_digits+1; pos++)
2889  0002 a601          	ld	a,#1
2890  0004 6b01          	ld	(OFST+0,sp),a
2893  0006 2025          	jra	L5021
2894  0008               L1021:
2895                     ; 336         pt6311_write_digit(pos, 0xFFFFFF); 
2897  0008 aeffff        	ldw	x,#65535
2898  000b 89            	pushw	x
2899  000c ae00ff        	ldw	x,#255
2900  000f 89            	pushw	x
2901  0010 7b05          	ld	a,(OFST+4,sp)
2902  0012 cd0000        	call	_pt6311_write_digit
2904  0015 5b04          	addw	sp,#4
2905                     ; 337         delay_ms(delay_per_digit_ms);
2907  0017 1e05          	ldw	x,(OFST+4,sp)
2908  0019 cd0000        	call	_delay_ms
2910                     ; 338         pt6311_write_digit(pos, 0x000000); 
2912  001c ae0000        	ldw	x,#0
2913  001f 89            	pushw	x
2914  0020 ae0000        	ldw	x,#0
2915  0023 89            	pushw	x
2916  0024 7b05          	ld	a,(OFST+4,sp)
2917  0026 cd0000        	call	_pt6311_write_digit
2919  0029 5b04          	addw	sp,#4
2920                     ; 334     for (pos = 1; pos < num_digits+1; pos++)
2922  002b 0c01          	inc	(OFST+0,sp)
2924  002d               L5021:
2927  002d 9c            	rvf
2928  002e 7b02          	ld	a,(OFST+1,sp)
2929  0030 5f            	clrw	x
2930  0031 97            	ld	xl,a
2931  0032 5c            	incw	x
2932  0033 7b01          	ld	a,(OFST+0,sp)
2933  0035 905f          	clrw	y
2934  0037 9097          	ld	yl,a
2935  0039 90bf00        	ldw	c_y,y
2936  003c b300          	cpw	x,c_y
2937  003e 2cc8          	jrsgt	L1021
2938                     ; 340 }
2941  0040 85            	popw	x
2942  0041 81            	ret
2998                     ; 343 void pt6311_test_segments(uint8_t digit_pos, uint16_t delay_per_segment_ms)
2998                     ; 344 {
2999                     .text:	section	.text,new
3000  0000               _pt6311_test_segments:
3002  0000 88            	push	a
3003  0001 88            	push	a
3004       00000001      OFST:	set	1
3007                     ; 347     for (bit = 0; bit < 24; bit++)
3009  0002 0f01          	clr	(OFST+0,sp)
3011  0004               L7321:
3012                     ; 349         pt6311_write_digit(digit_pos, (uint32_t)1 << bit);
3014  0004 ae0001        	ldw	x,#1
3015  0007 bf02          	ldw	c_lreg+2,x
3016  0009 ae0000        	ldw	x,#0
3017  000c bf00          	ldw	c_lreg,x
3018  000e 7b01          	ld	a,(OFST+0,sp)
3019  0010 cd0000        	call	c_llsh
3021  0013 be02          	ldw	x,c_lreg+2
3022  0015 89            	pushw	x
3023  0016 be00          	ldw	x,c_lreg
3024  0018 89            	pushw	x
3025  0019 7b06          	ld	a,(OFST+5,sp)
3026  001b cd0000        	call	_pt6311_write_digit
3028  001e 5b04          	addw	sp,#4
3029                     ; 350 				pt6311_write_digit(digit_pos+2, 0x005000);//blink random other for counting
3031  0020 ae5000        	ldw	x,#20480
3032  0023 89            	pushw	x
3033  0024 ae0000        	ldw	x,#0
3034  0027 89            	pushw	x
3035  0028 7b06          	ld	a,(OFST+5,sp)
3036  002a ab02          	add	a,#2
3037  002c cd0000        	call	_pt6311_write_digit
3039  002f 5b04          	addw	sp,#4
3040                     ; 351 				delay_ms(delay_per_segment_ms);
3042  0031 1e05          	ldw	x,(OFST+4,sp)
3043  0033 cd0000        	call	_delay_ms
3045                     ; 352         pt6311_write_digit(digit_pos, 0x000000);
3047  0036 ae0000        	ldw	x,#0
3048  0039 89            	pushw	x
3049  003a ae0000        	ldw	x,#0
3050  003d 89            	pushw	x
3051  003e 7b06          	ld	a,(OFST+5,sp)
3052  0040 cd0000        	call	_pt6311_write_digit
3054  0043 5b04          	addw	sp,#4
3055                     ; 353 				pt6311_write_digit(digit_pos+2, 0x000000);
3057  0045 ae0000        	ldw	x,#0
3058  0048 89            	pushw	x
3059  0049 ae0000        	ldw	x,#0
3060  004c 89            	pushw	x
3061  004d 7b06          	ld	a,(OFST+5,sp)
3062  004f ab02          	add	a,#2
3063  0051 cd0000        	call	_pt6311_write_digit
3065  0054 5b04          	addw	sp,#4
3066                     ; 354         delay_ms(150); 
3068  0056 ae0096        	ldw	x,#150
3069  0059 cd0000        	call	_delay_ms
3071                     ; 347     for (bit = 0; bit < 24; bit++)
3073  005c 0c01          	inc	(OFST+0,sp)
3077  005e 7b01          	ld	a,(OFST+0,sp)
3078  0060 a118          	cp	a,#24
3079  0062 25a0          	jrult	L7321
3080                     ; 356 }
3083  0064 85            	popw	x
3084  0065 81            	ret
3139                     	xdef	_set_state
3140                     	xdef	_set_brightness
3141                     	switch	.ubsct
3142  0000               _pt6311_num_digits:
3143  0000 00            	ds.b	1
3144                     	xdef	_pt6311_num_digits
3145                     	xdef	_pt6311_setup_io
3146                     	xdef	_pt6311_write_digit
3147                     	xdef	_pt6311_test_segments
3148                     	xdef	_pt6311_test_digit_positions
3149                     	xdef	_pt6311_clear_display
3150                     	xdef	_pt6311_write_int
3151                     	xdef	_pt6311_scroll_string
3152                     	xdef	_pt6311_write_string
3153                     	xdef	_pt6311_clock_format
3154                     	xdef	_pt6311_write_char_dot
3155                     	xdef	_pt6311_write_char
3156                     	xdef	_pt6311_set_display_state
3157                     	xdef	_pt6311_set_brightness
3158                     	xdef	_pt6311_init
3159                     	xref	_strlen
3160                     	xref	_GPIO_WriteLow
3161                     	xref	_GPIO_WriteHigh
3162                     	xref	_GPIO_Init
3163                     	xref	_delay_ms
3164                     	xref	_delay_us
3165                     	xref.b	c_lreg
3166                     	xref.b	c_x
3167                     	xref.b	c_y
3187                     	xref	c_sdivx
3188                     	xref	c_smodx
3189                     	xref	c_rtol
3190                     	xref	c_ltor
3191                     	xref	c_lgor
3192                     	xref	c_lrzmp
3193                     	xref	c_land
3194                     	xref	c_llsh
3195                     	end
