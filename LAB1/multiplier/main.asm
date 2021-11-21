;
; multiplier.asm
;
; Created: 01-09-2021 16:50:28
; Author : naras
;


.CSEG ; defines memory space to hold program
LDI ZL,LOW(NUM<<1);load address of first data byte
LDI ZH,HIGH(NUM<<1);
LDI XL,0x60;
LDI XH,0x00
LPM R2,Z+
LPM R3,Z ; 
MUL R2,R3 ;

ST X+,R1 ;
ST X,R0 
NOP ; End of program, No operation
NUM: .db 0xFF,0xFF; 
