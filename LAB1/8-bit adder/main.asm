;
; Lab1_8bitadder.asm
;
; Created: 01-09-2021 16:29:02
; Author : naras
;

; The following program adds two 8 bit numbers and stores their sum in a register and carry in another register.
.CSEG
LDI ZL,LOW(NUM<<1);
LDI ZH,HIGH(NUM<<1);
LDI XL,0x60;
LDI XH,0x00
LDI R16,00 ; 
LPM R0,Z+
LPM R1,Z ; 
ADD R0,R1 ; 
BRCC abc; 
LDI R16,0x01 ; 
abc: ST X+,R0 ;
ST X,R16 ; 
NOP ; 
NUM: .db 0xD3,0x5F; 