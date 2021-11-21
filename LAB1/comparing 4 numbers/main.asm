;
; COMPARE_3NUM.asm
;
; Created: 01-09-2021 16:59:42
; Author : naras
;

; comparing 4 numbers and storing maximum
LDI ZL,LOW(NUM<<1);load address of first data byte
LDI ZH,HIGH(NUM<<1);
LDI XL,0x60;load SRAM address in X-register
LDI XH,0x00
LPM R0,Z+; getting numbers into R1 and R0
LPM R1,Z ;
LDI ZL,LOW(NUM1<<1);
LDI ZH,HIGH(NUM1<<1);
LPM R2,Z+;
LPM R3,Z ;   getting numbers into R2 and R3
MOV R4,R0; storing R0 in a temporary variable and comparing with other 3 numbers
CP R1,R4
BRSH abc
abc: MOV R4,R1
CP R2,R4
BRSH def
def: MOV R4,R2
CP R3,R4
BRSH ghi
ghi: MOV R4,R3
ST X+,R4;     maximum of the 3 will be stored in the R4 register finally. That is stored in X.
NOP;
NUM: .DB 0x00,0x01;
NUM1: .DB 0x02,0x03;
