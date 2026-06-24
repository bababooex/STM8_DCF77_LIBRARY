   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.3 - 22 May 2025
   3                     ; Generator (Limited) V4.6.6 - 07 Jan 2026
 122                     ; 12 uint8_t swi2c_write_eemem(uint8_t slv_addr, uint16_t address, uint8_t* data, uint16_t num){
 124                     .text:	section	.text,new
 125  0000               _swi2c_write_eemem:
 127  0000 88            	push	a
 128  0001 5204          	subw	sp,#4
 129       00000004      OFST:	set	4
 132                     ; 19 if(swi2c_START()){return 0xaa;} 
 134  0003 cd0000        	call	_swi2c_START
 136  0006 4d            	tnz	a
 137  0007 2704          	jreq	L36
 140  0009 a6aa          	ld	a,#170
 142  000b 2010          	jra	L6
 143  000d               L36:
 144                     ; 22 mask=0b1<<7;
 146  000d a680          	ld	a,#128
 147  000f 6b04          	ld	(OFST+0,sp),a
 149  0011               L56:
 150                     ; 24 if(swi2c_writebit(slv_addr & mask)){return 0xff;}
 152  0011 7b05          	ld	a,(OFST+1,sp)
 153  0013 1404          	and	a,(OFST+0,sp)
 154  0015 cd0000        	call	_swi2c_writebit
 156  0018 4d            	tnz	a
 157  0019 2705          	jreq	L37
 160  001b a6ff          	ld	a,#255
 162  001d               L6:
 164  001d 5b05          	addw	sp,#5
 165  001f 81            	ret
 166  0020               L37:
 167                     ; 25 mask = mask >>1;
 169  0020 0404          	srl	(OFST+0,sp)
 171                     ; 23 while(mask){
 173  0022 0d04          	tnz	(OFST+0,sp)
 174  0024 26eb          	jrne	L56
 175                     ; 27 ack=swi2c_readbit();
 177  0026 cd0000        	call	_swi2c_readbit
 179  0029 6b04          	ld	(OFST+0,sp),a
 181                     ; 28 if(ack){
 183  002b 0d04          	tnz	(OFST+0,sp)
 184  002d 270e          	jreq	L57
 185                     ; 29 	if(swi2c_STOP()){return 0xff;}
 187  002f cd0000        	call	_swi2c_STOP
 189  0032 4d            	tnz	a
 190  0033 2704          	jreq	L77
 193  0035 a6ff          	ld	a,#255
 195  0037 20e4          	jra	L6
 196  0039               L77:
 197                     ; 30 	return ack;
 199  0039 7b04          	ld	a,(OFST+0,sp)
 201  003b 20e0          	jra	L6
 202  003d               L57:
 203                     ; 34 tmp = address >> 8;
 205  003d 7b08          	ld	a,(OFST+4,sp)
 206  003f 6b01          	ld	(OFST-3,sp),a
 208                     ; 35 mask=0b1<<7;
 210  0041 a680          	ld	a,#128
 211  0043 6b04          	ld	(OFST+0,sp),a
 213  0045               L101:
 214                     ; 37 if(swi2c_writebit(tmp & mask)){return 0xff;}
 216  0045 7b01          	ld	a,(OFST-3,sp)
 217  0047 1404          	and	a,(OFST+0,sp)
 218  0049 cd0000        	call	_swi2c_writebit
 220  004c 4d            	tnz	a
 221  004d 2704          	jreq	L701
 224  004f a6ff          	ld	a,#255
 226  0051 20ca          	jra	L6
 227  0053               L701:
 228                     ; 38 mask = mask >>1;
 230  0053 0404          	srl	(OFST+0,sp)
 232                     ; 36 while(mask){
 234  0055 0d04          	tnz	(OFST+0,sp)
 235  0057 26ec          	jrne	L101
 236                     ; 40 ack=swi2c_readbit();
 238  0059 cd0000        	call	_swi2c_readbit
 240  005c 6b04          	ld	(OFST+0,sp),a
 242                     ; 41 if(ack){
 244  005e 0d04          	tnz	(OFST+0,sp)
 245  0060 270e          	jreq	L111
 246                     ; 42 	if(swi2c_STOP()){return 0xff;}
 248  0062 cd0000        	call	_swi2c_STOP
 250  0065 4d            	tnz	a
 251  0066 2704          	jreq	L311
 254  0068 a6ff          	ld	a,#255
 256  006a 20b1          	jra	L6
 257  006c               L311:
 258                     ; 43 	return ack;
 260  006c 7b04          	ld	a,(OFST+0,sp)
 262  006e 20ad          	jra	L6
 263  0070               L111:
 264                     ; 47 tmp = (uint8_t)address;
 266  0070 7b09          	ld	a,(OFST+5,sp)
 267  0072 6b01          	ld	(OFST-3,sp),a
 269                     ; 48 mask=0b1<<7;
 271  0074 a680          	ld	a,#128
 272  0076 6b04          	ld	(OFST+0,sp),a
 274  0078               L511:
 275                     ; 50 if(swi2c_writebit(tmp & mask)){return 0xff;}
 277  0078 7b01          	ld	a,(OFST-3,sp)
 278  007a 1404          	and	a,(OFST+0,sp)
 279  007c cd0000        	call	_swi2c_writebit
 281  007f 4d            	tnz	a
 282  0080 2704          	jreq	L321
 285  0082 a6ff          	ld	a,#255
 287  0084 2097          	jra	L6
 288  0086               L321:
 289                     ; 51 mask = mask >>1;
 291  0086 0404          	srl	(OFST+0,sp)
 293                     ; 49 while(mask){
 295  0088 0d04          	tnz	(OFST+0,sp)
 296  008a 26ec          	jrne	L511
 297                     ; 53 ack=swi2c_readbit();
 299  008c cd0000        	call	_swi2c_readbit
 301  008f 6b04          	ld	(OFST+0,sp),a
 303                     ; 54 if(ack){
 305  0091 0d04          	tnz	(OFST+0,sp)
 306  0093 2712          	jreq	L521
 307                     ; 55 	if(swi2c_STOP()){return 0xff;}
 309  0095 cd0000        	call	_swi2c_STOP
 311  0098 4d            	tnz	a
 312  0099 2706          	jreq	L721
 315  009b a6ff          	ld	a,#255
 317  009d ac1d001d      	jpf	L6
 318  00a1               L721:
 319                     ; 56 	return ack;
 321  00a1 7b04          	ld	a,(OFST+0,sp)
 323  00a3 ac1d001d      	jpf	L6
 324  00a7               L521:
 325                     ; 61 for(i=0;i<num;i++){
 327  00a7 5f            	clrw	x
 328  00a8 1f02          	ldw	(OFST-2,sp),x
 331  00aa 2040          	jra	L531
 332  00ac               L131:
 333                     ; 62 	mask=0b1<<7;
 335  00ac a680          	ld	a,#128
 336  00ae 6b04          	ld	(OFST+0,sp),a
 338  00b0               L141:
 339                     ; 64 	if(swi2c_writebit(data[i] & mask)){return 0xff;}
 341  00b0 1e0a          	ldw	x,(OFST+6,sp)
 342  00b2 72fb02        	addw	x,(OFST-2,sp)
 343  00b5 f6            	ld	a,(x)
 344  00b6 1404          	and	a,(OFST+0,sp)
 345  00b8 cd0000        	call	_swi2c_writebit
 347  00bb 4d            	tnz	a
 348  00bc 2706          	jreq	L741
 351  00be a6ff          	ld	a,#255
 353  00c0 ac1d001d      	jpf	L6
 354  00c4               L741:
 355                     ; 65 	mask = mask >>1;
 357  00c4 0404          	srl	(OFST+0,sp)
 359                     ; 63 	while(mask){
 361  00c6 0d04          	tnz	(OFST+0,sp)
 362  00c8 26e6          	jrne	L141
 363                     ; 67 	ack=swi2c_readbit();
 365  00ca cd0000        	call	_swi2c_readbit
 367  00cd 6b04          	ld	(OFST+0,sp),a
 369                     ; 68 	if(ack){
 371  00cf 0d04          	tnz	(OFST+0,sp)
 372  00d1 2712          	jreq	L151
 373                     ; 69 		if(swi2c_STOP()){return 0xff;}
 375  00d3 cd0000        	call	_swi2c_STOP
 377  00d6 4d            	tnz	a
 378  00d7 2706          	jreq	L351
 381  00d9 a6ff          	ld	a,#255
 383  00db ac1d001d      	jpf	L6
 384  00df               L351:
 385                     ; 70 		return ack;
 387  00df 7b04          	ld	a,(OFST+0,sp)
 389  00e1 ac1d001d      	jpf	L6
 390  00e5               L151:
 391                     ; 61 for(i=0;i<num;i++){
 393  00e5 1e02          	ldw	x,(OFST-2,sp)
 394  00e7 1c0001        	addw	x,#1
 395  00ea 1f02          	ldw	(OFST-2,sp),x
 397  00ec               L531:
 400  00ec 1e02          	ldw	x,(OFST-2,sp)
 401  00ee 130c          	cpw	x,(OFST+8,sp)
 402  00f0 25ba          	jrult	L131
 403                     ; 75 if(swi2c_STOP()){return 0xff;}
 405  00f2 cd0000        	call	_swi2c_STOP
 407  00f5 4d            	tnz	a
 408  00f6 2706          	jreq	L551
 411  00f8 a6ff          	ld	a,#255
 413  00fa ac1d001d      	jpf	L6
 414  00fe               L551:
 415                     ; 76 return 0;
 417  00fe 4f            	clr	a
 419  00ff ac1d001d      	jpf	L6
 531                     ; 86 uint8_t swi2c_read_eemem(uint8_t slv_addr, uint16_t address, uint8_t* data, uint16_t num){
 532                     .text:	section	.text,new
 533  0000               _swi2c_read_eemem:
 535  0000 88            	push	a
 536  0001 5204          	subw	sp,#4
 537       00000004      OFST:	set	4
 540                     ; 87 uint16_t i=0;	
 542                     ; 93 if(swi2c_START()){return 0xaa;} 
 544  0003 cd0000        	call	_swi2c_START
 546  0006 4d            	tnz	a
 547  0007 2704          	jreq	L532
 550  0009 a6aa          	ld	a,#170
 552  000b 2010          	jra	L21
 553  000d               L532:
 554                     ; 96 mask=0b1<<7;
 556  000d a680          	ld	a,#128
 557  000f 6b04          	ld	(OFST+0,sp),a
 559  0011               L732:
 560                     ; 98 if(swi2c_writebit(slv_addr & mask)){return 0xff;}
 562  0011 7b05          	ld	a,(OFST+1,sp)
 563  0013 1404          	and	a,(OFST+0,sp)
 564  0015 cd0000        	call	_swi2c_writebit
 566  0018 4d            	tnz	a
 567  0019 2705          	jreq	L542
 570  001b a6ff          	ld	a,#255
 572  001d               L21:
 574  001d 5b05          	addw	sp,#5
 575  001f 81            	ret
 576  0020               L542:
 577                     ; 99 mask = mask >>1;
 579  0020 0404          	srl	(OFST+0,sp)
 581                     ; 97 while(mask){
 583  0022 0d04          	tnz	(OFST+0,sp)
 584  0024 26eb          	jrne	L732
 585                     ; 101 ack=swi2c_readbit();
 587  0026 cd0000        	call	_swi2c_readbit
 589  0029 6b03          	ld	(OFST-1,sp),a
 591                     ; 102 if(ack){
 593  002b 0d03          	tnz	(OFST-1,sp)
 594  002d 270e          	jreq	L742
 595                     ; 103 	if(swi2c_STOP()){return 0xff;}
 597  002f cd0000        	call	_swi2c_STOP
 599  0032 4d            	tnz	a
 600  0033 2704          	jreq	L152
 603  0035 a6ff          	ld	a,#255
 605  0037 20e4          	jra	L21
 606  0039               L152:
 607                     ; 104 	return ack;
 609  0039 7b03          	ld	a,(OFST-1,sp)
 611  003b 20e0          	jra	L21
 612  003d               L742:
 613                     ; 108 tmp = address >> 8;
 615  003d 7b08          	ld	a,(OFST+4,sp)
 616  003f 6b03          	ld	(OFST-1,sp),a
 618                     ; 109 mask=0b1<<7;
 620  0041 a680          	ld	a,#128
 621  0043 6b04          	ld	(OFST+0,sp),a
 623  0045               L352:
 624                     ; 111 if(swi2c_writebit(tmp & mask)){return 0xff;}
 626  0045 7b03          	ld	a,(OFST-1,sp)
 627  0047 1404          	and	a,(OFST+0,sp)
 628  0049 cd0000        	call	_swi2c_writebit
 630  004c 4d            	tnz	a
 631  004d 2704          	jreq	L162
 634  004f a6ff          	ld	a,#255
 636  0051 20ca          	jra	L21
 637  0053               L162:
 638                     ; 112 mask = mask >>1;
 640  0053 0404          	srl	(OFST+0,sp)
 642                     ; 110 while(mask){
 644  0055 0d04          	tnz	(OFST+0,sp)
 645  0057 26ec          	jrne	L352
 646                     ; 114 ack=swi2c_readbit();
 648  0059 cd0000        	call	_swi2c_readbit
 650  005c 6b03          	ld	(OFST-1,sp),a
 652                     ; 115 if(ack){
 654  005e 0d03          	tnz	(OFST-1,sp)
 655  0060 270e          	jreq	L362
 656                     ; 116 	if(swi2c_STOP()){return 0xff;}
 658  0062 cd0000        	call	_swi2c_STOP
 660  0065 4d            	tnz	a
 661  0066 2704          	jreq	L562
 664  0068 a6ff          	ld	a,#255
 666  006a 20b1          	jra	L21
 667  006c               L562:
 668                     ; 117 	return ack;
 670  006c 7b03          	ld	a,(OFST-1,sp)
 672  006e 20ad          	jra	L21
 673  0070               L362:
 674                     ; 121 tmp = (uint8_t)address;
 676  0070 7b09          	ld	a,(OFST+5,sp)
 677  0072 6b03          	ld	(OFST-1,sp),a
 679                     ; 122 mask=0b1<<7;
 681  0074 a680          	ld	a,#128
 682  0076 6b04          	ld	(OFST+0,sp),a
 684  0078               L762:
 685                     ; 124 if(swi2c_writebit(tmp & mask)){return 0xff;}
 687  0078 7b03          	ld	a,(OFST-1,sp)
 688  007a 1404          	and	a,(OFST+0,sp)
 689  007c cd0000        	call	_swi2c_writebit
 691  007f 4d            	tnz	a
 692  0080 2704          	jreq	L572
 695  0082 a6ff          	ld	a,#255
 697  0084 2097          	jra	L21
 698  0086               L572:
 699                     ; 125 mask = mask >>1;
 701  0086 0404          	srl	(OFST+0,sp)
 703                     ; 123 while(mask){
 705  0088 0d04          	tnz	(OFST+0,sp)
 706  008a 26ec          	jrne	L762
 707                     ; 127 ack=swi2c_readbit();
 709  008c cd0000        	call	_swi2c_readbit
 711  008f 6b03          	ld	(OFST-1,sp),a
 713                     ; 128 if(ack){
 715  0091 0d03          	tnz	(OFST-1,sp)
 716  0093 2712          	jreq	L772
 717                     ; 129 	if(swi2c_STOP()){return 0xff;}
 719  0095 cd0000        	call	_swi2c_STOP
 721  0098 4d            	tnz	a
 722  0099 2706          	jreq	L103
 725  009b a6ff          	ld	a,#255
 727  009d ac1d001d      	jpf	L21
 728  00a1               L103:
 729                     ; 130 	return ack;
 731  00a1 7b03          	ld	a,(OFST-1,sp)
 733  00a3 ac1d001d      	jpf	L21
 734  00a7               L772:
 735                     ; 134 if(swi2c_RESTART()){return 0xff;} 
 737  00a7 cd0000        	call	_swi2c_RESTART
 739  00aa 4d            	tnz	a
 740  00ab 2706          	jreq	L303
 743  00ad a6ff          	ld	a,#255
 745  00af ac1d001d      	jpf	L21
 746  00b3               L303:
 747                     ; 137 mask=0b1<<7;
 749  00b3 a680          	ld	a,#128
 750  00b5 6b04          	ld	(OFST+0,sp),a
 752  00b7               L503:
 753                     ; 139 if(swi2c_writebit((slv_addr | 0b1) & mask)){return 0xff;}
 755  00b7 7b05          	ld	a,(OFST+1,sp)
 756  00b9 aa01          	or	a,#1
 757  00bb 1404          	and	a,(OFST+0,sp)
 758  00bd cd0000        	call	_swi2c_writebit
 760  00c0 4d            	tnz	a
 761  00c1 2706          	jreq	L313
 764  00c3 a6ff          	ld	a,#255
 766  00c5 ac1d001d      	jpf	L21
 767  00c9               L313:
 768                     ; 140 mask = mask >>1;
 770  00c9 0404          	srl	(OFST+0,sp)
 772                     ; 138 while(mask){
 774  00cb 0d04          	tnz	(OFST+0,sp)
 775  00cd 26e8          	jrne	L503
 776                     ; 142 ack=swi2c_readbit();
 778  00cf cd0000        	call	_swi2c_readbit
 780  00d2 6b03          	ld	(OFST-1,sp),a
 782                     ; 143 if(ack){
 784  00d4 0d03          	tnz	(OFST-1,sp)
 785  00d6 2712          	jreq	L513
 786                     ; 144 	if(swi2c_STOP()){return 0xff;}
 788  00d8 cd0000        	call	_swi2c_STOP
 790  00db 4d            	tnz	a
 791  00dc 2706          	jreq	L713
 794  00de a6ff          	ld	a,#255
 796  00e0 ac1d001d      	jpf	L21
 797  00e4               L713:
 798                     ; 145 	return ack;
 800  00e4 7b03          	ld	a,(OFST-1,sp)
 802  00e6 ac1d001d      	jpf	L21
 803  00ea               L513:
 804                     ; 150 for(i=0;i<num;i++){
 806  00ea 5f            	clrw	x
 807  00eb 1f01          	ldw	(OFST-3,sp),x
 810  00ed 2060          	jra	L523
 811  00ef               L123:
 812                     ; 151 	mask=0b1<<7;
 814  00ef a680          	ld	a,#128
 815  00f1 6b04          	ld	(OFST+0,sp),a
 817  00f3               L133:
 818                     ; 153 	bit = swi2c_readbit();
 820  00f3 cd0000        	call	_swi2c_readbit
 822  00f6 6b03          	ld	(OFST-1,sp),a
 824                     ; 154 	if(bit==0){data[i] &=~mask;}
 826  00f8 0d03          	tnz	(OFST-1,sp)
 827  00fa 260c          	jrne	L733
 830  00fc 1e0a          	ldw	x,(OFST+6,sp)
 831  00fe 72fb01        	addw	x,(OFST-3,sp)
 832  0101 7b04          	ld	a,(OFST+0,sp)
 833  0103 43            	cpl	a
 834  0104 f4            	and	a,(x)
 835  0105 f7            	ld	(x),a
 837  0106 200f          	jra	L143
 838  0108               L733:
 839                     ; 155 	else if(bit==1){data[i] |=mask;}
 841  0108 7b03          	ld	a,(OFST-1,sp)
 842  010a a101          	cp	a,#1
 843  010c 2624          	jrne	L343
 846  010e 1e0a          	ldw	x,(OFST+6,sp)
 847  0110 72fb01        	addw	x,(OFST-3,sp)
 848  0113 f6            	ld	a,(x)
 849  0114 1a04          	or	a,(OFST+0,sp)
 850  0116 f7            	ld	(x),a
 852  0117               L143:
 853                     ; 157 	mask = mask >>1;
 855  0117 0404          	srl	(OFST+0,sp)
 857                     ; 152 	while(mask){
 859  0119 0d04          	tnz	(OFST+0,sp)
 860  011b 26d6          	jrne	L133
 861                     ; 159 	if((i+1)==num){
 863  011d 1e01          	ldw	x,(OFST-3,sp)
 864  011f 5c            	incw	x
 865  0120 130c          	cpw	x,(OFST+8,sp)
 866  0122 2617          	jrne	L743
 867                     ; 160 		if(swi2c_writebit(1)){return 0xff;} // NACK
 869  0124 a601          	ld	a,#1
 870  0126 cd0000        	call	_swi2c_writebit
 872  0129 4d            	tnz	a
 873  012a 271c          	jreq	L353
 876  012c a6ff          	ld	a,#255
 878  012e ac1d001d      	jpf	L21
 879  0132               L343:
 880                     ; 156 	else{swi2c_STOP();return 0xff;}
 882  0132 cd0000        	call	_swi2c_STOP
 886  0135 a6ff          	ld	a,#255
 888  0137 ac1d001d      	jpf	L21
 889  013b               L743:
 890                     ; 162 		if(swi2c_writebit(0)){return 0xff;} // ACK
 892  013b 4f            	clr	a
 893  013c cd0000        	call	_swi2c_writebit
 895  013f 4d            	tnz	a
 896  0140 2706          	jreq	L353
 899  0142 a6ff          	ld	a,#255
 901  0144 ac1d001d      	jpf	L21
 902  0148               L353:
 903                     ; 150 for(i=0;i<num;i++){
 905  0148 1e01          	ldw	x,(OFST-3,sp)
 906  014a 1c0001        	addw	x,#1
 907  014d 1f01          	ldw	(OFST-3,sp),x
 909  014f               L523:
 912  014f 1e01          	ldw	x,(OFST-3,sp)
 913  0151 130c          	cpw	x,(OFST+8,sp)
 914  0153 259a          	jrult	L123
 915                     ; 167 if(swi2c_STOP()){return 0xff;}
 917  0155 cd0000        	call	_swi2c_STOP
 919  0158 4d            	tnz	a
 920  0159 2706          	jreq	L753
 923  015b a6ff          	ld	a,#255
 925  015d ac1d001d      	jpf	L21
 926  0161               L753:
 927                     ; 168 return 0;
 929  0161 4f            	clr	a
 931  0162 ac1d001d      	jpf	L21
1034                     ; 178 uint8_t swi2c_read_buf(uint8_t slv_addr, uint8_t address, uint8_t* data, uint16_t num){
1035                     .text:	section	.text,new
1036  0000               _swi2c_read_buf:
1038  0000 89            	pushw	x
1039  0001 5204          	subw	sp,#4
1040       00000004      OFST:	set	4
1043                     ; 179 uint16_t i=0;	
1045                     ; 184 if(swi2c_START()){return 0xaa;} 
1047  0003 cd0000        	call	_swi2c_START
1049  0006 4d            	tnz	a
1050  0007 2704          	jreq	L334
1053  0009 a6aa          	ld	a,#170
1055  000b 2010          	jra	L61
1056  000d               L334:
1057                     ; 187 mask=0b1<<7;
1059  000d a680          	ld	a,#128
1060  000f 6b04          	ld	(OFST+0,sp),a
1062  0011               L534:
1063                     ; 189 if(swi2c_writebit(slv_addr & mask)){return 0xff;}
1065  0011 7b05          	ld	a,(OFST+1,sp)
1066  0013 1404          	and	a,(OFST+0,sp)
1067  0015 cd0000        	call	_swi2c_writebit
1069  0018 4d            	tnz	a
1070  0019 2705          	jreq	L344
1073  001b a6ff          	ld	a,#255
1075  001d               L61:
1077  001d 5b06          	addw	sp,#6
1078  001f 81            	ret
1079  0020               L344:
1080                     ; 190 mask = mask >>1;
1082  0020 0404          	srl	(OFST+0,sp)
1084                     ; 188 while(mask){
1086  0022 0d04          	tnz	(OFST+0,sp)
1087  0024 26eb          	jrne	L534
1088                     ; 192 ack=swi2c_readbit();
1090  0026 cd0000        	call	_swi2c_readbit
1092  0029 6b03          	ld	(OFST-1,sp),a
1094                     ; 193 if(ack){
1096  002b 0d03          	tnz	(OFST-1,sp)
1097  002d 270e          	jreq	L544
1098                     ; 194 	if(swi2c_STOP()){return 0xff;}
1100  002f cd0000        	call	_swi2c_STOP
1102  0032 4d            	tnz	a
1103  0033 2704          	jreq	L744
1106  0035 a6ff          	ld	a,#255
1108  0037 20e4          	jra	L61
1109  0039               L744:
1110                     ; 195 	return ack;
1112  0039 7b03          	ld	a,(OFST-1,sp)
1114  003b 20e0          	jra	L61
1115  003d               L544:
1116                     ; 199 mask=0b1<<7;
1118  003d a680          	ld	a,#128
1119  003f 6b04          	ld	(OFST+0,sp),a
1121  0041               L154:
1122                     ; 201 if(swi2c_writebit(address & mask)){return 0xff;}
1124  0041 7b06          	ld	a,(OFST+2,sp)
1125  0043 1404          	and	a,(OFST+0,sp)
1126  0045 cd0000        	call	_swi2c_writebit
1128  0048 4d            	tnz	a
1129  0049 2704          	jreq	L754
1132  004b a6ff          	ld	a,#255
1134  004d 20ce          	jra	L61
1135  004f               L754:
1136                     ; 202 mask = mask >>1;
1138  004f 0404          	srl	(OFST+0,sp)
1140                     ; 200 while(mask){
1142  0051 0d04          	tnz	(OFST+0,sp)
1143  0053 26ec          	jrne	L154
1144                     ; 204 ack=swi2c_readbit();
1146  0055 cd0000        	call	_swi2c_readbit
1148  0058 6b03          	ld	(OFST-1,sp),a
1150                     ; 205 if(ack){
1152  005a 0d03          	tnz	(OFST-1,sp)
1153  005c 270e          	jreq	L164
1154                     ; 206 	if(swi2c_STOP()){return 0xff;}
1156  005e cd0000        	call	_swi2c_STOP
1158  0061 4d            	tnz	a
1159  0062 2704          	jreq	L364
1162  0064 a6ff          	ld	a,#255
1164  0066 20b5          	jra	L61
1165  0068               L364:
1166                     ; 207 	return ack;
1168  0068 7b03          	ld	a,(OFST-1,sp)
1170  006a 20b1          	jra	L61
1171  006c               L164:
1172                     ; 211 if(swi2c_RESTART()){return 0xff;} 
1174  006c cd0000        	call	_swi2c_RESTART
1176  006f 4d            	tnz	a
1177  0070 2704          	jreq	L564
1180  0072 a6ff          	ld	a,#255
1182  0074 20a7          	jra	L61
1183  0076               L564:
1184                     ; 214 mask=0b1<<7;
1186  0076 a680          	ld	a,#128
1187  0078 6b04          	ld	(OFST+0,sp),a
1189  007a               L764:
1190                     ; 216 if(swi2c_writebit((slv_addr | 0b1) & mask)){return 0xff;}
1192  007a 7b05          	ld	a,(OFST+1,sp)
1193  007c aa01          	or	a,#1
1194  007e 1404          	and	a,(OFST+0,sp)
1195  0080 cd0000        	call	_swi2c_writebit
1197  0083 4d            	tnz	a
1198  0084 2704          	jreq	L574
1201  0086 a6ff          	ld	a,#255
1203  0088 2093          	jra	L61
1204  008a               L574:
1205                     ; 217 mask = mask >>1;
1207  008a 0404          	srl	(OFST+0,sp)
1209                     ; 215 while(mask){
1211  008c 0d04          	tnz	(OFST+0,sp)
1212  008e 26ea          	jrne	L764
1213                     ; 219 ack=swi2c_readbit();
1215  0090 cd0000        	call	_swi2c_readbit
1217  0093 6b03          	ld	(OFST-1,sp),a
1219                     ; 220 if(ack){
1221  0095 0d03          	tnz	(OFST-1,sp)
1222  0097 2712          	jreq	L774
1223                     ; 221 	if(swi2c_STOP()){return 0xff;}
1225  0099 cd0000        	call	_swi2c_STOP
1227  009c 4d            	tnz	a
1228  009d 2706          	jreq	L105
1231  009f a6ff          	ld	a,#255
1233  00a1 ac1d001d      	jpf	L61
1234  00a5               L105:
1235                     ; 222 	return ack;
1237  00a5 7b03          	ld	a,(OFST-1,sp)
1239  00a7 ac1d001d      	jpf	L61
1240  00ab               L774:
1241                     ; 227 for(i=0;i<num;i++){
1243  00ab 5f            	clrw	x
1244  00ac 1f01          	ldw	(OFST-3,sp),x
1247  00ae 2060          	jra	L705
1248  00b0               L305:
1249                     ; 228 	mask=0b1<<7;
1251  00b0 a680          	ld	a,#128
1252  00b2 6b04          	ld	(OFST+0,sp),a
1254  00b4               L315:
1255                     ; 230 	bit = swi2c_readbit();
1257  00b4 cd0000        	call	_swi2c_readbit
1259  00b7 6b03          	ld	(OFST-1,sp),a
1261                     ; 231 	if(bit==0){data[i] &=~mask;}
1263  00b9 0d03          	tnz	(OFST-1,sp)
1264  00bb 260c          	jrne	L125
1267  00bd 1e09          	ldw	x,(OFST+5,sp)
1268  00bf 72fb01        	addw	x,(OFST-3,sp)
1269  00c2 7b04          	ld	a,(OFST+0,sp)
1270  00c4 43            	cpl	a
1271  00c5 f4            	and	a,(x)
1272  00c6 f7            	ld	(x),a
1274  00c7 200f          	jra	L325
1275  00c9               L125:
1276                     ; 232 	else if(bit==1){data[i] |=mask;}
1278  00c9 7b03          	ld	a,(OFST-1,sp)
1279  00cb a101          	cp	a,#1
1280  00cd 2624          	jrne	L525
1283  00cf 1e09          	ldw	x,(OFST+5,sp)
1284  00d1 72fb01        	addw	x,(OFST-3,sp)
1285  00d4 f6            	ld	a,(x)
1286  00d5 1a04          	or	a,(OFST+0,sp)
1287  00d7 f7            	ld	(x),a
1289  00d8               L325:
1290                     ; 234 	mask = mask >>1;
1292  00d8 0404          	srl	(OFST+0,sp)
1294                     ; 229 	while(mask){
1296  00da 0d04          	tnz	(OFST+0,sp)
1297  00dc 26d6          	jrne	L315
1298                     ; 236 	if((i+1)==num){
1300  00de 1e01          	ldw	x,(OFST-3,sp)
1301  00e0 5c            	incw	x
1302  00e1 130b          	cpw	x,(OFST+7,sp)
1303  00e3 2617          	jrne	L135
1304                     ; 237 		if(swi2c_writebit(1)){return 0xff;} // NACK
1306  00e5 a601          	ld	a,#1
1307  00e7 cd0000        	call	_swi2c_writebit
1309  00ea 4d            	tnz	a
1310  00eb 271c          	jreq	L535
1313  00ed a6ff          	ld	a,#255
1315  00ef ac1d001d      	jpf	L61
1316  00f3               L525:
1317                     ; 233 	else{swi2c_STOP();return 0xff;}
1319  00f3 cd0000        	call	_swi2c_STOP
1323  00f6 a6ff          	ld	a,#255
1325  00f8 ac1d001d      	jpf	L61
1326  00fc               L135:
1327                     ; 239 		if(swi2c_writebit(0)){return 0xff;} // ACK
1329  00fc 4f            	clr	a
1330  00fd cd0000        	call	_swi2c_writebit
1332  0100 4d            	tnz	a
1333  0101 2706          	jreq	L535
1336  0103 a6ff          	ld	a,#255
1338  0105 ac1d001d      	jpf	L61
1339  0109               L535:
1340                     ; 227 for(i=0;i<num;i++){
1342  0109 1e01          	ldw	x,(OFST-3,sp)
1343  010b 1c0001        	addw	x,#1
1344  010e 1f01          	ldw	(OFST-3,sp),x
1346  0110               L705:
1349  0110 1e01          	ldw	x,(OFST-3,sp)
1350  0112 130b          	cpw	x,(OFST+7,sp)
1351  0114 259a          	jrult	L305
1352                     ; 244 if(swi2c_STOP()){return 0xff;}
1354  0116 cd0000        	call	_swi2c_STOP
1356  0119 4d            	tnz	a
1357  011a 2706          	jreq	L145
1360  011c a6ff          	ld	a,#255
1362  011e ac1d001d      	jpf	L61
1363  0122               L145:
1364                     ; 245 return 0;
1366  0122 4f            	clr	a
1368  0123 ac1d001d      	jpf	L61
1461                     ; 256 uint8_t swi2c_write_buf(uint8_t slv_addr, uint8_t address, uint8_t* data, uint16_t num){
1462                     .text:	section	.text,new
1463  0000               _swi2c_write_buf:
1465  0000 89            	pushw	x
1466  0001 5203          	subw	sp,#3
1467       00000003      OFST:	set	3
1470                     ; 262 if(swi2c_START()){return 0xaa;} 
1472  0003 cd0000        	call	_swi2c_START
1474  0006 4d            	tnz	a
1475  0007 2704          	jreq	L116
1478  0009 a6aa          	ld	a,#170
1480  000b 2010          	jra	L22
1481  000d               L116:
1482                     ; 265 mask=0b1<<7;
1484  000d a680          	ld	a,#128
1485  000f 6b03          	ld	(OFST+0,sp),a
1487  0011               L316:
1488                     ; 267 if(swi2c_writebit(slv_addr & mask)){return 0xff;}
1490  0011 7b04          	ld	a,(OFST+1,sp)
1491  0013 1403          	and	a,(OFST+0,sp)
1492  0015 cd0000        	call	_swi2c_writebit
1494  0018 4d            	tnz	a
1495  0019 2705          	jreq	L126
1498  001b a6ff          	ld	a,#255
1500  001d               L22:
1502  001d 5b05          	addw	sp,#5
1503  001f 81            	ret
1504  0020               L126:
1505                     ; 268 mask = mask >>1;
1507  0020 0403          	srl	(OFST+0,sp)
1509                     ; 266 while(mask){
1511  0022 0d03          	tnz	(OFST+0,sp)
1512  0024 26eb          	jrne	L316
1513                     ; 270 ack=swi2c_readbit();
1515  0026 cd0000        	call	_swi2c_readbit
1517  0029 6b03          	ld	(OFST+0,sp),a
1519                     ; 271 if(ack){
1521  002b 0d03          	tnz	(OFST+0,sp)
1522  002d 270e          	jreq	L326
1523                     ; 272 	if(swi2c_STOP()){return 0xff;}
1525  002f cd0000        	call	_swi2c_STOP
1527  0032 4d            	tnz	a
1528  0033 2704          	jreq	L526
1531  0035 a6ff          	ld	a,#255
1533  0037 20e4          	jra	L22
1534  0039               L526:
1535                     ; 273 	return ack;
1537  0039 7b03          	ld	a,(OFST+0,sp)
1539  003b 20e0          	jra	L22
1540  003d               L326:
1541                     ; 277 mask=0b1<<7;
1543  003d a680          	ld	a,#128
1544  003f 6b03          	ld	(OFST+0,sp),a
1546  0041               L726:
1547                     ; 279 if(swi2c_writebit(address & mask)){return 0xff;}
1549  0041 7b05          	ld	a,(OFST+2,sp)
1550  0043 1403          	and	a,(OFST+0,sp)
1551  0045 cd0000        	call	_swi2c_writebit
1553  0048 4d            	tnz	a
1554  0049 2704          	jreq	L536
1557  004b a6ff          	ld	a,#255
1559  004d 20ce          	jra	L22
1560  004f               L536:
1561                     ; 280 mask = mask >>1;
1563  004f 0403          	srl	(OFST+0,sp)
1565                     ; 278 while(mask){
1567  0051 0d03          	tnz	(OFST+0,sp)
1568  0053 26ec          	jrne	L726
1569                     ; 282 ack=swi2c_readbit();
1571  0055 cd0000        	call	_swi2c_readbit
1573  0058 6b03          	ld	(OFST+0,sp),a
1575                     ; 283 if(ack){
1577  005a 0d03          	tnz	(OFST+0,sp)
1578  005c 270e          	jreq	L736
1579                     ; 284 	if(swi2c_STOP()){return 0xff;}
1581  005e cd0000        	call	_swi2c_STOP
1583  0061 4d            	tnz	a
1584  0062 2704          	jreq	L146
1587  0064 a6ff          	ld	a,#255
1589  0066 20b5          	jra	L22
1590  0068               L146:
1591                     ; 285 	return ack;
1593  0068 7b03          	ld	a,(OFST+0,sp)
1595  006a 20b1          	jra	L22
1596  006c               L736:
1597                     ; 289 for(i=0;i<num;i++){
1599  006c 5f            	clrw	x
1600  006d 1f01          	ldw	(OFST-2,sp),x
1603  006f 203e          	jra	L746
1604  0071               L346:
1605                     ; 290 	mask=0b1<<7;
1607  0071 a680          	ld	a,#128
1608  0073 6b03          	ld	(OFST+0,sp),a
1610  0075               L356:
1611                     ; 292 	if(swi2c_writebit(data[i] & mask)){return 0xff;}
1613  0075 1e08          	ldw	x,(OFST+5,sp)
1614  0077 72fb01        	addw	x,(OFST-2,sp)
1615  007a f6            	ld	a,(x)
1616  007b 1403          	and	a,(OFST+0,sp)
1617  007d cd0000        	call	_swi2c_writebit
1619  0080 4d            	tnz	a
1620  0081 2704          	jreq	L166
1623  0083 a6ff          	ld	a,#255
1625  0085 2096          	jra	L22
1626  0087               L166:
1627                     ; 293 	mask = mask >>1;
1629  0087 0403          	srl	(OFST+0,sp)
1631                     ; 291 	while(mask){
1633  0089 0d03          	tnz	(OFST+0,sp)
1634  008b 26e8          	jrne	L356
1635                     ; 295 	ack=swi2c_readbit();
1637  008d cd0000        	call	_swi2c_readbit
1639  0090 6b03          	ld	(OFST+0,sp),a
1641                     ; 296 	if(ack){
1643  0092 0d03          	tnz	(OFST+0,sp)
1644  0094 2712          	jreq	L366
1645                     ; 297 		if(swi2c_STOP()){return 0xff;}
1647  0096 cd0000        	call	_swi2c_STOP
1649  0099 4d            	tnz	a
1650  009a 2706          	jreq	L566
1653  009c a6ff          	ld	a,#255
1655  009e ac1d001d      	jpf	L22
1656  00a2               L566:
1657                     ; 298 		return ack;
1659  00a2 7b03          	ld	a,(OFST+0,sp)
1661  00a4 ac1d001d      	jpf	L22
1662  00a8               L366:
1663                     ; 289 for(i=0;i<num;i++){
1665  00a8 1e01          	ldw	x,(OFST-2,sp)
1666  00aa 1c0001        	addw	x,#1
1667  00ad 1f01          	ldw	(OFST-2,sp),x
1669  00af               L746:
1672  00af 1e01          	ldw	x,(OFST-2,sp)
1673  00b1 130a          	cpw	x,(OFST+7,sp)
1674  00b3 25bc          	jrult	L346
1675                     ; 303 if(swi2c_STOP()){return 0xff;}
1677  00b5 cd0000        	call	_swi2c_STOP
1679  00b8 4d            	tnz	a
1680  00b9 2706          	jreq	L766
1683  00bb a6ff          	ld	a,#255
1685  00bd ac1d001d      	jpf	L22
1686  00c1               L766:
1687                     ; 304 return 0;
1689  00c1 4f            	clr	a
1691  00c2 ac1d001d      	jpf	L22
1775                     ; 314 uint8_t swi2c_write_array(uint8_t slv_addr, uint8_t* data, uint16_t num){
1776                     .text:	section	.text,new
1777  0000               _swi2c_write_array:
1779  0000 88            	push	a
1780  0001 5203          	subw	sp,#3
1781       00000003      OFST:	set	3
1784                     ; 320 if(swi2c_START()){return 0xaa;} 
1786  0003 cd0000        	call	_swi2c_START
1788  0006 4d            	tnz	a
1789  0007 2704          	jreq	L337
1792  0009 a6aa          	ld	a,#170
1794  000b 2010          	jra	L62
1795  000d               L337:
1796                     ; 323 mask=0b1<<7;
1798  000d a680          	ld	a,#128
1799  000f 6b03          	ld	(OFST+0,sp),a
1801  0011               L537:
1802                     ; 325 if(swi2c_writebit(slv_addr & mask)){return 0xff;}
1804  0011 7b04          	ld	a,(OFST+1,sp)
1805  0013 1403          	and	a,(OFST+0,sp)
1806  0015 cd0000        	call	_swi2c_writebit
1808  0018 4d            	tnz	a
1809  0019 2705          	jreq	L347
1812  001b a6ff          	ld	a,#255
1814  001d               L62:
1816  001d 5b04          	addw	sp,#4
1817  001f 81            	ret
1818  0020               L347:
1819                     ; 326 mask = mask >>1;
1821  0020 0403          	srl	(OFST+0,sp)
1823                     ; 324 while(mask){
1825  0022 0d03          	tnz	(OFST+0,sp)
1826  0024 26eb          	jrne	L537
1827                     ; 328 ack=swi2c_readbit();
1829  0026 cd0000        	call	_swi2c_readbit
1831  0029 6b03          	ld	(OFST+0,sp),a
1833                     ; 329 if(ack){
1835  002b 0d03          	tnz	(OFST+0,sp)
1836  002d 270e          	jreq	L547
1837                     ; 330 	if(swi2c_STOP()){return 0xff;}
1839  002f cd0000        	call	_swi2c_STOP
1841  0032 4d            	tnz	a
1842  0033 2704          	jreq	L747
1845  0035 a6ff          	ld	a,#255
1847  0037 20e4          	jra	L62
1848  0039               L747:
1849                     ; 331 	return ack;
1851  0039 7b03          	ld	a,(OFST+0,sp)
1853  003b 20e0          	jra	L62
1854  003d               L547:
1855                     ; 335 for(i=0;i<num;i++){
1857  003d 5f            	clrw	x
1858  003e 1f01          	ldw	(OFST-2,sp),x
1861  0040 203a          	jra	L557
1862  0042               L157:
1863                     ; 336 	mask=0b1<<7;
1865  0042 a680          	ld	a,#128
1866  0044 6b03          	ld	(OFST+0,sp),a
1868  0046               L167:
1869                     ; 338 	if(swi2c_writebit(data[i] & mask)){return 0xff;}
1871  0046 1e07          	ldw	x,(OFST+4,sp)
1872  0048 72fb01        	addw	x,(OFST-2,sp)
1873  004b f6            	ld	a,(x)
1874  004c 1403          	and	a,(OFST+0,sp)
1875  004e cd0000        	call	_swi2c_writebit
1877  0051 4d            	tnz	a
1878  0052 2704          	jreq	L767
1881  0054 a6ff          	ld	a,#255
1883  0056 20c5          	jra	L62
1884  0058               L767:
1885                     ; 339 	mask = mask >>1;
1887  0058 0403          	srl	(OFST+0,sp)
1889                     ; 337 	while(mask){
1891  005a 0d03          	tnz	(OFST+0,sp)
1892  005c 26e8          	jrne	L167
1893                     ; 341 	ack=swi2c_readbit();
1895  005e cd0000        	call	_swi2c_readbit
1897  0061 6b03          	ld	(OFST+0,sp),a
1899                     ; 342 	if(ack){
1901  0063 0d03          	tnz	(OFST+0,sp)
1902  0065 270e          	jreq	L177
1903                     ; 343 		if(swi2c_STOP()){return 0xff;}
1905  0067 cd0000        	call	_swi2c_STOP
1907  006a 4d            	tnz	a
1908  006b 2704          	jreq	L377
1911  006d a6ff          	ld	a,#255
1913  006f 20ac          	jra	L62
1914  0071               L377:
1915                     ; 344 		return ack;
1917  0071 7b03          	ld	a,(OFST+0,sp)
1919  0073 20a8          	jra	L62
1920  0075               L177:
1921                     ; 335 for(i=0;i<num;i++){
1923  0075 1e01          	ldw	x,(OFST-2,sp)
1924  0077 1c0001        	addw	x,#1
1925  007a 1f01          	ldw	(OFST-2,sp),x
1927  007c               L557:
1930  007c 1e01          	ldw	x,(OFST-2,sp)
1931  007e 1309          	cpw	x,(OFST+6,sp)
1932  0080 25c0          	jrult	L157
1933                     ; 349 if(swi2c_STOP()){return 0xff;}
1935  0082 cd0000        	call	_swi2c_STOP
1937  0085 4d            	tnz	a
1938  0086 2704          	jreq	L577
1941  0088 a6ff          	ld	a,#255
1943  008a 2091          	jra	L62
1944  008c               L577:
1945                     ; 350 return 0;
1947  008c 4f            	clr	a
1949  008d 208e          	jra	L62
2042                     ; 355 uint8_t swi2c_read_array(uint8_t slv_addr, uint8_t* data, uint16_t num)
2042                     ; 356 {
2043                     .text:	section	.text,new
2044  0000               _swi2c_read_array:
2046  0000 88            	push	a
2047  0001 5204          	subw	sp,#4
2048       00000004      OFST:	set	4
2051                     ; 357     uint16_t i = 0;
2053                     ; 362     if (swi2c_START()) { return 0xaa; }
2055  0003 cd0000        	call	_swi2c_START
2057  0006 4d            	tnz	a
2058  0007 2704          	jreq	L5401
2061  0009 a6aa          	ld	a,#170
2063  000b 2012          	jra	L23
2064  000d               L5401:
2065                     ; 365     mask = 0b1 << 7;
2067  000d a680          	ld	a,#128
2068  000f 6b04          	ld	(OFST+0,sp),a
2070  0011               L7401:
2071                     ; 367         if (swi2c_writebit((slv_addr | 0b1) & mask)) { return 0xff; }
2073  0011 7b05          	ld	a,(OFST+1,sp)
2074  0013 aa01          	or	a,#1
2075  0015 1404          	and	a,(OFST+0,sp)
2076  0017 cd0000        	call	_swi2c_writebit
2078  001a 4d            	tnz	a
2079  001b 2705          	jreq	L5501
2082  001d a6ff          	ld	a,#255
2084  001f               L23:
2086  001f 5b05          	addw	sp,#5
2087  0021 81            	ret
2088  0022               L5501:
2089                     ; 368         mask = mask >> 1;
2091  0022 0404          	srl	(OFST+0,sp)
2093                     ; 366     while (mask) {
2095  0024 0d04          	tnz	(OFST+0,sp)
2096  0026 26e9          	jrne	L7401
2097                     ; 370     ack = swi2c_readbit();
2099  0028 cd0000        	call	_swi2c_readbit
2101  002b 6b01          	ld	(OFST-3,sp),a
2103                     ; 371     if (ack) {
2105  002d 0d01          	tnz	(OFST-3,sp)
2106  002f 270e          	jreq	L7501
2107                     ; 372         if (swi2c_STOP()) { return 0xff; }
2109  0031 cd0000        	call	_swi2c_STOP
2111  0034 4d            	tnz	a
2112  0035 2704          	jreq	L1601
2115  0037 a6ff          	ld	a,#255
2117  0039 20e4          	jra	L23
2118  003b               L1601:
2119                     ; 373         return ack;
2121  003b 7b01          	ld	a,(OFST-3,sp)
2123  003d 20e0          	jra	L23
2124  003f               L7501:
2125                     ; 377     for (i = 0; i < num; i++) {
2127  003f 5f            	clrw	x
2128  0040 1f02          	ldw	(OFST-2,sp),x
2131  0042 205a          	jra	L7601
2132  0044               L3601:
2133                     ; 378         mask = 0b1 << 7;
2135  0044 a680          	ld	a,#128
2136  0046 6b04          	ld	(OFST+0,sp),a
2138  0048               L3701:
2139                     ; 380             bit = swi2c_readbit();
2141  0048 cd0000        	call	_swi2c_readbit
2143  004b 6b01          	ld	(OFST-3,sp),a
2145                     ; 381             if (bit == 0) { data[i] &= ~mask; }
2147  004d 0d01          	tnz	(OFST-3,sp)
2148  004f 260c          	jrne	L1011
2151  0051 1e08          	ldw	x,(OFST+4,sp)
2152  0053 72fb02        	addw	x,(OFST-2,sp)
2153  0056 7b04          	ld	a,(OFST+0,sp)
2154  0058 43            	cpl	a
2155  0059 f4            	and	a,(x)
2156  005a f7            	ld	(x),a
2158  005b 200f          	jra	L3011
2159  005d               L1011:
2160                     ; 382             else if (bit == 1) { data[i] |= mask; }
2162  005d 7b01          	ld	a,(OFST-3,sp)
2163  005f a101          	cp	a,#1
2164  0061 2622          	jrne	L5011
2167  0063 1e08          	ldw	x,(OFST+4,sp)
2168  0065 72fb02        	addw	x,(OFST-2,sp)
2169  0068 f6            	ld	a,(x)
2170  0069 1a04          	or	a,(OFST+0,sp)
2171  006b f7            	ld	(x),a
2173  006c               L3011:
2174                     ; 384             mask = mask >> 1;
2176  006c 0404          	srl	(OFST+0,sp)
2178                     ; 379         while (mask) {
2180  006e 0d04          	tnz	(OFST+0,sp)
2181  0070 26d6          	jrne	L3701
2182                     ; 388         if ((i + 1) == num) {
2184  0072 1e02          	ldw	x,(OFST-2,sp)
2185  0074 5c            	incw	x
2186  0075 130a          	cpw	x,(OFST+6,sp)
2187  0077 2613          	jrne	L1111
2188                     ; 389             if (swi2c_writebit(1)) { return 0xff; } // NACK
2190  0079 a601          	ld	a,#1
2191  007b cd0000        	call	_swi2c_writebit
2193  007e 4d            	tnz	a
2194  007f 2716          	jreq	L5111
2197  0081 a6ff          	ld	a,#255
2199  0083 209a          	jra	L23
2200  0085               L5011:
2201                     ; 383             else { swi2c_STOP(); return 0xff; }
2203  0085 cd0000        	call	_swi2c_STOP
2207  0088 a6ff          	ld	a,#255
2209  008a 2093          	jra	L23
2210  008c               L1111:
2211                     ; 391             if (swi2c_writebit(0)) { return 0xff; } // ACK
2213  008c 4f            	clr	a
2214  008d cd0000        	call	_swi2c_writebit
2216  0090 4d            	tnz	a
2217  0091 2704          	jreq	L5111
2220  0093 a6ff          	ld	a,#255
2222  0095 2088          	jra	L23
2223  0097               L5111:
2224                     ; 377     for (i = 0; i < num; i++) {
2226  0097 1e02          	ldw	x,(OFST-2,sp)
2227  0099 1c0001        	addw	x,#1
2228  009c 1f02          	ldw	(OFST-2,sp),x
2230  009e               L7601:
2233  009e 1e02          	ldw	x,(OFST-2,sp)
2234  00a0 130a          	cpw	x,(OFST+6,sp)
2235  00a2 25a0          	jrult	L3601
2236                     ; 396     if (swi2c_STOP()) { return 0xff; }
2238  00a4 cd0000        	call	_swi2c_STOP
2240  00a7 4d            	tnz	a
2241  00a8 2706          	jreq	L1211
2244  00aa a6ff          	ld	a,#255
2246  00ac ac1f001f      	jpf	L23
2247  00b0               L1211:
2248                     ; 397     return 0;
2250  00b0 4f            	clr	a
2252  00b1 ac1f001f      	jpf	L23
2308                     ; 410 uint8_t swi2c_test_slave(uint8_t slvaddr){
2309                     .text:	section	.text,new
2310  0000               _swi2c_test_slave:
2312  0000 88            	push	a
2313  0001 88            	push	a
2314       00000001      OFST:	set	1
2317                     ; 412 uint8_t mask=0b1<<7;
2319  0002 a680          	ld	a,#128
2320  0004 6b01          	ld	(OFST+0,sp),a
2322                     ; 413 if(swi2c_START()){return 0xaa;}
2324  0006 cd0000        	call	_swi2c_START
2326  0009 4d            	tnz	a
2327  000a 2714          	jreq	L5511
2330  000c a6aa          	ld	a,#170
2332  000e 200c          	jra	L63
2333  0010               L3511:
2334                     ; 415 if(swi2c_writebit(slvaddr & mask)){return 0xff;}
2336  0010 7b02          	ld	a,(OFST+1,sp)
2337  0012 1401          	and	a,(OFST+0,sp)
2338  0014 cd0000        	call	_swi2c_writebit
2340  0017 4d            	tnz	a
2341  0018 2704          	jreq	L1611
2344  001a a6ff          	ld	a,#255
2346  001c               L63:
2348  001c 85            	popw	x
2349  001d 81            	ret
2350  001e               L1611:
2351                     ; 416 mask = mask >>1;
2353  001e 0401          	srl	(OFST+0,sp)
2355  0020               L5511:
2356                     ; 414 while(mask){
2358  0020 0d01          	tnz	(OFST+0,sp)
2359  0022 26ec          	jrne	L3511
2360                     ; 418 ack=swi2c_readbit();
2362  0024 cd0000        	call	_swi2c_readbit
2364  0027 6b01          	ld	(OFST+0,sp),a
2366                     ; 419 if(swi2c_STOP()){return 0xff;}
2368  0029 cd0000        	call	_swi2c_STOP
2370  002c 4d            	tnz	a
2371  002d 2704          	jreq	L3611
2374  002f a6ff          	ld	a,#255
2376  0031 20e9          	jra	L63
2377  0033               L3611:
2378                     ; 420 return ack;
2380  0033 7b01          	ld	a,(OFST+0,sp)
2382  0035 20e5          	jra	L63
2406                     ; 424 void swi2c_init(void){
2407                     .text:	section	.text,new
2408  0000               _swi2c_init:
2412                     ; 425 GPIO_Init(SCL_GPIO,SCL_PIN,GPIO_MODE_OUT_OD_HIZ_SLOW);
2414  0000 4b90          	push	#144
2415  0002 4b04          	push	#4
2416  0004 ae500f        	ldw	x,#20495
2417  0007 cd0000        	call	_GPIO_Init
2419  000a 85            	popw	x
2420                     ; 426 GPIO_Init(SDA_GPIO,SDA_PIN,GPIO_MODE_OUT_OD_HIZ_SLOW);
2422  000b 4b90          	push	#144
2423  000d 4b08          	push	#8
2424  000f ae500f        	ldw	x,#20495
2425  0012 cd0000        	call	_GPIO_Init
2427  0015 85            	popw	x
2428                     ; 427 }
2431  0016 81            	ret
2478                     ; 435 uint8_t swi2c_readbit(void){
2479                     .text:	section	.text,new
2480  0000               _swi2c_readbit:
2482  0000 5203          	subw	sp,#3
2483       00000003      OFST:	set	3
2486                     ; 436 uint16_t timeout=SWI2C_TIMEOUT;
2488  0002 aeffff        	ldw	x,#65535
2489  0005 1f02          	ldw	(OFST-1,sp),x
2491                     ; 438 SDA_HIGH; // release SDA
2493  0007 4b08          	push	#8
2494  0009 ae500f        	ldw	x,#20495
2495  000c cd0000        	call	_GPIO_WriteHigh
2497  000f 84            	pop	a
2498                     ; 439 SWI2C_SETUP_TIME;
2500  0010 ae0005        	ldw	x,#5
2501  0013 cd0000        	call	_delay_us
2503                     ; 440 SCL_HIGH;
2505  0016 4b04          	push	#4
2506  0018 ae500f        	ldw	x,#20495
2507  001b cd0000        	call	_GPIO_WriteHigh
2509  001e 84            	pop	a
2511  001f 2007          	jra	L1221
2512  0021               L7121:
2513                     ; 441 while(SCL_stat() == RESET && timeout){timeout--;}
2515  0021 1e02          	ldw	x,(OFST-1,sp)
2516  0023 1d0001        	subw	x,#1
2517  0026 1f02          	ldw	(OFST-1,sp),x
2519  0028               L1221:
2522  0028 4b04          	push	#4
2523  002a ae500f        	ldw	x,#20495
2524  002d cd0000        	call	_GPIO_ReadInputPin
2526  0030 5b01          	addw	sp,#1
2527  0032 4d            	tnz	a
2528  0033 2604          	jrne	L5221
2530  0035 1e02          	ldw	x,(OFST-1,sp)
2531  0037 26e8          	jrne	L7121
2532  0039               L5221:
2533                     ; 442 if(timeout==0){return 0xff;}
2535  0039 1e02          	ldw	x,(OFST-1,sp)
2536  003b 2604          	jrne	L7221
2539  003d a6ff          	ld	a,#255
2541  003f 202c          	jra	L44
2542  0041               L7221:
2543                     ; 443 SWI2C_SCL_HIGH_TIME;
2545  0041 ae0005        	ldw	x,#5
2546  0044 cd0000        	call	_delay_us
2548                     ; 444 if(SDA_stat() == RESET){retval = 0;}else{retval=1;}
2550  0047 4b08          	push	#8
2551  0049 ae500f        	ldw	x,#20495
2552  004c cd0000        	call	_GPIO_ReadInputPin
2554  004f 5b01          	addw	sp,#1
2555  0051 4d            	tnz	a
2556  0052 2604          	jrne	L1321
2559  0054 0f01          	clr	(OFST-2,sp)
2562  0056 2004          	jra	L3321
2563  0058               L1321:
2566  0058 a601          	ld	a,#1
2567  005a 6b01          	ld	(OFST-2,sp),a
2569  005c               L3321:
2570                     ; 445 SCL_LOW;
2572  005c 4b04          	push	#4
2573  005e ae500f        	ldw	x,#20495
2574  0061 cd0000        	call	_GPIO_WriteLow
2576  0064 84            	pop	a
2577                     ; 446 SWI2C_HOLD_TIME; // hold time
2579  0065 ae0005        	ldw	x,#5
2580  0068 cd0000        	call	_delay_us
2582                     ; 447 return retval;
2584  006b 7b01          	ld	a,(OFST-2,sp)
2586  006d               L44:
2588  006d 5b03          	addw	sp,#3
2589  006f 81            	ret
2636                     ; 453 uint8_t swi2c_writebit(uint8_t bit){
2637                     .text:	section	.text,new
2638  0000               _swi2c_writebit:
2640  0000 89            	pushw	x
2641       00000002      OFST:	set	2
2644                     ; 454 uint16_t timeout=SWI2C_TIMEOUT;
2646  0001 aeffff        	ldw	x,#65535
2647  0004 1f01          	ldw	(OFST-1,sp),x
2649                     ; 455 if(bit){SDA_HIGH;}else{SDA_LOW;} // set desired SDA value
2651  0006 4d            	tnz	a
2652  0007 270b          	jreq	L7521
2655  0009 4b08          	push	#8
2656  000b ae500f        	ldw	x,#20495
2657  000e cd0000        	call	_GPIO_WriteHigh
2659  0011 84            	pop	a
2661  0012 2009          	jra	L1621
2662  0014               L7521:
2665  0014 4b08          	push	#8
2666  0016 ae500f        	ldw	x,#20495
2667  0019 cd0000        	call	_GPIO_WriteLow
2669  001c 84            	pop	a
2670  001d               L1621:
2671                     ; 456 SWI2C_SETUP_TIME; // setup time
2673  001d ae0005        	ldw	x,#5
2674  0020 cd0000        	call	_delay_us
2676                     ; 457 SCL_HIGH;		
2678  0023 4b04          	push	#4
2679  0025 ae500f        	ldw	x,#20495
2680  0028 cd0000        	call	_GPIO_WriteHigh
2682  002b 84            	pop	a
2684  002c 2007          	jra	L5621
2685  002e               L3621:
2686                     ; 458 while(SCL_stat() == RESET && timeout){timeout--;} // wait until SCL is not high
2688  002e 1e01          	ldw	x,(OFST-1,sp)
2689  0030 1d0001        	subw	x,#1
2690  0033 1f01          	ldw	(OFST-1,sp),x
2692  0035               L5621:
2695  0035 4b04          	push	#4
2696  0037 ae500f        	ldw	x,#20495
2697  003a cd0000        	call	_GPIO_ReadInputPin
2699  003d 5b01          	addw	sp,#1
2700  003f 4d            	tnz	a
2701  0040 2604          	jrne	L1721
2703  0042 1e01          	ldw	x,(OFST-1,sp)
2704  0044 26e8          	jrne	L3621
2705  0046               L1721:
2706                     ; 459 if(timeout==0){SDA_HIGH; return 0xff;} // generate timeout error if SCL is held Low too long
2708  0046 1e01          	ldw	x,(OFST-1,sp)
2709  0048 260d          	jrne	L3721
2712  004a 4b08          	push	#8
2713  004c ae500f        	ldw	x,#20495
2714  004f cd0000        	call	_GPIO_WriteHigh
2716  0052 84            	pop	a
2719  0053 a6ff          	ld	a,#255
2721  0055 2016          	jra	L05
2722  0057               L3721:
2723                     ; 460 SWI2C_SCL_HIGH_TIME;
2725  0057 ae0005        	ldw	x,#5
2726  005a cd0000        	call	_delay_us
2728                     ; 461 SCL_LOW;
2730  005d 4b04          	push	#4
2731  005f ae500f        	ldw	x,#20495
2732  0062 cd0000        	call	_GPIO_WriteLow
2734  0065 84            	pop	a
2735                     ; 462 SWI2C_HOLD_TIME; // hold time
2737  0066 ae0005        	ldw	x,#5
2738  0069 cd0000        	call	_delay_us
2740                     ; 463 return 0;
2742  006c 4f            	clr	a
2744  006d               L05:
2746  006d 85            	popw	x
2747  006e 81            	ret
2785                     ; 469 uint8_t swi2c_RESTART(void){
2786                     .text:	section	.text,new
2787  0000               _swi2c_RESTART:
2789  0000 89            	pushw	x
2790       00000002      OFST:	set	2
2793                     ; 470 uint16_t timeout=SWI2C_TIMEOUT;
2795  0001 aeffff        	ldw	x,#65535
2796  0004 1f01          	ldw	(OFST-1,sp),x
2798                     ; 471 SCL_LOW;
2800  0006 4b04          	push	#4
2801  0008 ae500f        	ldw	x,#20495
2802  000b cd0000        	call	_GPIO_WriteLow
2804  000e 84            	pop	a
2805                     ; 472 SDA_HIGH;
2807  000f 4b08          	push	#8
2808  0011 ae500f        	ldw	x,#20495
2809  0014 cd0000        	call	_GPIO_WriteHigh
2811  0017 84            	pop	a
2813  0018 2007          	jra	L5131
2814  001a               L3131:
2815                     ; 473 while(SDA_stat() == RESET && timeout){timeout--;}
2817  001a 1e01          	ldw	x,(OFST-1,sp)
2818  001c 1d0001        	subw	x,#1
2819  001f 1f01          	ldw	(OFST-1,sp),x
2821  0021               L5131:
2824  0021 4b08          	push	#8
2825  0023 ae500f        	ldw	x,#20495
2826  0026 cd0000        	call	_GPIO_ReadInputPin
2828  0029 5b01          	addw	sp,#1
2829  002b 4d            	tnz	a
2830  002c 2604          	jrne	L1231
2832  002e 1e01          	ldw	x,(OFST-1,sp)
2833  0030 26e8          	jrne	L3131
2834  0032               L1231:
2835                     ; 474 if(timeout==0){SCL_HIGH; return 0xff;}
2837  0032 1e01          	ldw	x,(OFST-1,sp)
2838  0034 260d          	jrne	L3231
2841  0036 4b04          	push	#4
2842  0038 ae500f        	ldw	x,#20495
2843  003b cd0000        	call	_GPIO_WriteHigh
2845  003e 84            	pop	a
2848  003f a6ff          	ld	a,#255
2850  0041 202f          	jra	L45
2851  0043               L3231:
2852                     ; 475 SWI2C_SS_TIME;
2854  0043 ae0005        	ldw	x,#5
2855  0046 cd0000        	call	_delay_us
2857                     ; 476 SCL_HIGH;
2859  0049 4b04          	push	#4
2860  004b ae500f        	ldw	x,#20495
2861  004e cd0000        	call	_GPIO_WriteHigh
2863  0051 84            	pop	a
2865  0052 2007          	jra	L7231
2866  0054               L5231:
2867                     ; 477 while(SCL_stat() == RESET && timeout){timeout--;}
2869  0054 1e01          	ldw	x,(OFST-1,sp)
2870  0056 1d0001        	subw	x,#1
2871  0059 1f01          	ldw	(OFST-1,sp),x
2873  005b               L7231:
2876  005b 4b04          	push	#4
2877  005d ae500f        	ldw	x,#20495
2878  0060 cd0000        	call	_GPIO_ReadInputPin
2880  0063 5b01          	addw	sp,#1
2881  0065 4d            	tnz	a
2882  0066 2604          	jrne	L3331
2884  0068 1e01          	ldw	x,(OFST-1,sp)
2885  006a 26e8          	jrne	L5231
2886  006c               L3331:
2887                     ; 478 if(timeout==0){return 0xff;}
2889  006c 1e01          	ldw	x,(OFST-1,sp)
2890  006e 2604          	jrne	L5331
2893  0070 a6ff          	ld	a,#255
2895  0072               L45:
2897  0072 85            	popw	x
2898  0073 81            	ret
2899  0074               L5331:
2900                     ; 479 SWI2C_SS_TIME;
2902  0074 ae0005        	ldw	x,#5
2903  0077 cd0000        	call	_delay_us
2905                     ; 480 SDA_LOW;
2907  007a 4b08          	push	#8
2908  007c ae500f        	ldw	x,#20495
2909  007f cd0000        	call	_GPIO_WriteLow
2911  0082 84            	pop	a
2912                     ; 481 SWI2C_SS_TIME;
2914  0083 ae0005        	ldw	x,#5
2915  0086 cd0000        	call	_delay_us
2917                     ; 482 SCL_LOW;
2919  0089 4b04          	push	#4
2920  008b ae500f        	ldw	x,#20495
2921  008e cd0000        	call	_GPIO_WriteLow
2923  0091 84            	pop	a
2924                     ; 483 SWI2C_SS_TIME;
2926  0092 ae0005        	ldw	x,#5
2927  0095 cd0000        	call	_delay_us
2929                     ; 484 return 0;
2931  0098 4f            	clr	a
2933  0099 20d7          	jra	L45
2970                     ; 490 uint8_t swi2c_START(void){
2971                     .text:	section	.text,new
2972  0000               _swi2c_START:
2974  0000 89            	pushw	x
2975       00000002      OFST:	set	2
2978                     ; 491 uint16_t timeout=SWI2C_TIMEOUT;
2980  0001 aeffff        	ldw	x,#65535
2981  0004 1f01          	ldw	(OFST-1,sp),x
2984  0006 2007          	jra	L1631
2985  0008               L5531:
2986                     ; 492 while((SCL_stat() == RESET || SDA_stat() == RESET) && timeout){timeout--;}
2988  0008 1e01          	ldw	x,(OFST-1,sp)
2989  000a 1d0001        	subw	x,#1
2990  000d 1f01          	ldw	(OFST-1,sp),x
2992  000f               L1631:
2995  000f 4b04          	push	#4
2996  0011 ae500f        	ldw	x,#20495
2997  0014 cd0000        	call	_GPIO_ReadInputPin
2999  0017 5b01          	addw	sp,#1
3000  0019 4d            	tnz	a
3001  001a 270d          	jreq	L7631
3003  001c 4b08          	push	#8
3004  001e ae500f        	ldw	x,#20495
3005  0021 cd0000        	call	_GPIO_ReadInputPin
3007  0024 5b01          	addw	sp,#1
3008  0026 4d            	tnz	a
3009  0027 2604          	jrne	L5631
3010  0029               L7631:
3012  0029 1e01          	ldw	x,(OFST-1,sp)
3013  002b 26db          	jrne	L5531
3014  002d               L5631:
3015                     ; 493 if(timeout == 0){return 0xff;}
3017  002d 1e01          	ldw	x,(OFST-1,sp)
3018  002f 2604          	jrne	L1731
3021  0031 a6ff          	ld	a,#255
3023  0033 201f          	jra	L06
3024  0035               L1731:
3025                     ; 495 SDA_LOW;
3027  0035 4b08          	push	#8
3028  0037 ae500f        	ldw	x,#20495
3029  003a cd0000        	call	_GPIO_WriteLow
3031  003d 84            	pop	a
3032                     ; 496 SWI2C_SS_TIME;
3034  003e ae0005        	ldw	x,#5
3035  0041 cd0000        	call	_delay_us
3037                     ; 497 SCL_LOW;
3039  0044 4b04          	push	#4
3040  0046 ae500f        	ldw	x,#20495
3041  0049 cd0000        	call	_GPIO_WriteLow
3043  004c 84            	pop	a
3044                     ; 498 SWI2C_SS_TIME;
3046  004d ae0005        	ldw	x,#5
3047  0050 cd0000        	call	_delay_us
3049                     ; 499 return 0;
3051  0053 4f            	clr	a
3053  0054               L06:
3055  0054 85            	popw	x
3056  0055 81            	ret
3103                     ; 505 uint8_t swi2c_STOP(void){
3104                     .text:	section	.text,new
3105  0000               _swi2c_STOP:
3107  0000 5203          	subw	sp,#3
3108       00000003      OFST:	set	3
3111                     ; 506 uint16_t timeout=SWI2C_TIMEOUT;
3113  0002 aeffff        	ldw	x,#65535
3114  0005 1f02          	ldw	(OFST-1,sp),x
3116                     ; 507 uint8_t retval = 0;
3118  0007 0f01          	clr	(OFST-2,sp)
3120                     ; 508 SDA_LOW;
3122  0009 4b08          	push	#8
3123  000b ae500f        	ldw	x,#20495
3124  000e cd0000        	call	_GPIO_WriteLow
3126  0011 84            	pop	a
3127                     ; 509 SWI2C_SS_TIME;
3129  0012 ae0005        	ldw	x,#5
3130  0015 cd0000        	call	_delay_us
3132                     ; 510 SCL_HIGH;
3134  0018 4b04          	push	#4
3135  001a ae500f        	ldw	x,#20495
3136  001d cd0000        	call	_GPIO_WriteHigh
3138  0020 84            	pop	a
3140  0021 2007          	jra	L7141
3141  0023               L5141:
3142                     ; 511 while(SCL_stat() == RESET && timeout){timeout--;}
3144  0023 1e02          	ldw	x,(OFST-1,sp)
3145  0025 1d0001        	subw	x,#1
3146  0028 1f02          	ldw	(OFST-1,sp),x
3148  002a               L7141:
3151  002a 4b04          	push	#4
3152  002c ae500f        	ldw	x,#20495
3153  002f cd0000        	call	_GPIO_ReadInputPin
3155  0032 5b01          	addw	sp,#1
3156  0034 4d            	tnz	a
3157  0035 2604          	jrne	L3241
3159  0037 1e02          	ldw	x,(OFST-1,sp)
3160  0039 26e8          	jrne	L5141
3161  003b               L3241:
3162                     ; 512 if(timeout==0){retval = 0xff;}
3164  003b 1e02          	ldw	x,(OFST-1,sp)
3165  003d 2604          	jrne	L5241
3168  003f a6ff          	ld	a,#255
3169  0041 6b01          	ld	(OFST-2,sp),a
3171  0043               L5241:
3172                     ; 513 SWI2C_SS_TIME;
3174  0043 ae0005        	ldw	x,#5
3175  0046 cd0000        	call	_delay_us
3177                     ; 514 SDA_HIGH;
3179  0049 4b08          	push	#8
3180  004b ae500f        	ldw	x,#20495
3181  004e cd0000        	call	_GPIO_WriteHigh
3183  0051 84            	pop	a
3184                     ; 515 return retval;
3186  0052 7b01          	ld	a,(OFST-2,sp)
3189  0054 5b03          	addw	sp,#3
3190  0056 81            	ret
3238                     ; 522 uint8_t swi2c_recover(void){
3239                     .text:	section	.text,new
3240  0000               _swi2c_recover:
3242  0000 5203          	subw	sp,#3
3243       00000003      OFST:	set	3
3246                     ; 523 uint16_t timeout=SWI2C_TIMEOUT;
3248  0002 aeffff        	ldw	x,#65535
3249  0005 1f02          	ldw	(OFST-1,sp),x
3251                     ; 525 SCL_HIGH; // release both lines
3253  0007 4b04          	push	#4
3254  0009 ae500f        	ldw	x,#20495
3255  000c cd0000        	call	_GPIO_WriteHigh
3257  000f 84            	pop	a
3258                     ; 526 SDA_HIGH;
3260  0010 4b08          	push	#8
3261  0012 ae500f        	ldw	x,#20495
3262  0015 cd0000        	call	_GPIO_WriteHigh
3264  0018 84            	pop	a
3265                     ; 527 SWI2C_SETUP_TIME;
3267  0019 ae0005        	ldw	x,#5
3268  001c cd0000        	call	_delay_us
3270                     ; 529 if(SCL_stat() != RESET && SDA_stat() != RESET){return 0;}
3272  001f 4b04          	push	#4
3273  0021 ae500f        	ldw	x,#20495
3274  0024 cd0000        	call	_GPIO_ReadInputPin
3276  0027 5b01          	addw	sp,#1
3277  0029 4d            	tnz	a
3278  002a 2710          	jreq	L1541
3280  002c 4b08          	push	#8
3281  002e ae500f        	ldw	x,#20495
3282  0031 cd0000        	call	_GPIO_ReadInputPin
3284  0034 5b01          	addw	sp,#1
3285  0036 4d            	tnz	a
3286  0037 2703          	jreq	L1541
3289  0039 4f            	clr	a
3291  003a 2047          	jra	L66
3292  003c               L1541:
3293                     ; 531 if(SDA_stat() == RESET){
3295  003c 4b08          	push	#8
3296  003e ae500f        	ldw	x,#20495
3297  0041 cd0000        	call	_GPIO_ReadInputPin
3299  0044 5b01          	addw	sp,#1
3300  0046 4d            	tnz	a
3301  0047 2661          	jrne	L3541
3302                     ; 532 	for(i=0;i<9;i++){ // try nine times try to read one bit and pray for SDA release
3304  0049 0f01          	clr	(OFST-2,sp)
3306  004b               L5541:
3307                     ; 533 		SCL_LOW;
3309  004b 4b04          	push	#4
3310  004d ae500f        	ldw	x,#20495
3311  0050 cd0000        	call	_GPIO_WriteLow
3313  0053 84            	pop	a
3314                     ; 534 		SWI2C_HOLD_TIME; 
3316  0054 ae0005        	ldw	x,#5
3317  0057 cd0000        	call	_delay_us
3319                     ; 535 		SCL_HIGH; 
3321  005a 4b04          	push	#4
3322  005c ae500f        	ldw	x,#20495
3323  005f cd0000        	call	_GPIO_WriteHigh
3325  0062 84            	pop	a
3327  0063 2007          	jra	L5641
3328  0065               L3641:
3329                     ; 536 		while(SCL_stat() == RESET && timeout){timeout--;}
3331  0065 1e02          	ldw	x,(OFST-1,sp)
3332  0067 1d0001        	subw	x,#1
3333  006a 1f02          	ldw	(OFST-1,sp),x
3335  006c               L5641:
3338  006c 4b04          	push	#4
3339  006e ae500f        	ldw	x,#20495
3340  0071 cd0000        	call	_GPIO_ReadInputPin
3342  0074 5b01          	addw	sp,#1
3343  0076 4d            	tnz	a
3344  0077 2604          	jrne	L1741
3346  0079 1e02          	ldw	x,(OFST-1,sp)
3347  007b 26e8          	jrne	L3641
3348  007d               L1741:
3349                     ; 537 		if(timeout==0){return 0xff;}
3351  007d 1e02          	ldw	x,(OFST-1,sp)
3352  007f 2605          	jrne	L3741
3355  0081 a6ff          	ld	a,#255
3357  0083               L66:
3359  0083 5b03          	addw	sp,#3
3360  0085 81            	ret
3361  0086               L3741:
3362                     ; 538 		SWI2C_SCL_HIGH_TIME; 
3364  0086 ae0005        	ldw	x,#5
3365  0089 cd0000        	call	_delay_us
3367                     ; 539 		if(SDA_stat() != RESET){ // if slave released SDA line, generate STOP
3369  008c 4b08          	push	#8
3370  008e ae500f        	ldw	x,#20495
3371  0091 cd0000        	call	_GPIO_ReadInputPin
3373  0094 5b01          	addw	sp,#1
3374  0096 4d            	tnz	a
3375  0097 2705          	jreq	L5741
3376                     ; 540 			return(swi2c_STOP());
3378  0099 cd0000        	call	_swi2c_STOP
3381  009c 20e5          	jra	L66
3382  009e               L5741:
3383                     ; 532 	for(i=0;i<9;i++){ // try nine times try to read one bit and pray for SDA release
3385  009e 0c01          	inc	(OFST-2,sp)
3389  00a0 7b01          	ld	a,(OFST-2,sp)
3390  00a2 a109          	cp	a,#9
3391  00a4 25a5          	jrult	L5541
3392                     ; 543 		return 0xee;
3394  00a6 a6ee          	ld	a,#238
3396  00a8 20d9          	jra	L66
3397  00aa               L3541:
3398                     ; 545 }
3400  00aa 20d7          	jra	L66
3413                     	xdef	_swi2c_STOP
3414                     	xdef	_swi2c_RESTART
3415                     	xdef	_swi2c_START
3416                     	xdef	_swi2c_readbit
3417                     	xdef	_swi2c_writebit
3418                     	xdef	_swi2c_recover
3419                     	xdef	_swi2c_read_eemem
3420                     	xdef	_swi2c_write_eemem
3421                     	xdef	_swi2c_read_array
3422                     	xdef	_swi2c_write_array
3423                     	xdef	_swi2c_read_buf
3424                     	xdef	_swi2c_write_buf
3425                     	xdef	_swi2c_test_slave
3426                     	xdef	_swi2c_init
3427                     	xref	_GPIO_ReadInputPin
3428                     	xref	_GPIO_WriteLow
3429                     	xref	_GPIO_WriteHigh
3430                     	xref	_GPIO_Init
3431                     	xref	_delay_us
3450                     	end
