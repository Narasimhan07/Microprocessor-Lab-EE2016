;
; Lab1_16bitadder.asm
;
; Created: 21-11-2021 15:52:58
; Author : naras
;

; This programs adds two 16 bit numbers by making each number into 2 bytes and summing the lower and upper bytes separatelys
.CSEG;
	LDI ZL, LOW(NUM<<1);
	LDI ZH, HIGH(NUM<<1);
	LDI XL,0x60;
	LDI XH,0x00;
	LDI R16,0x00;
	LDI R17,0x00;
	LPM R0,Z+;
	LPM R1,Z;
	LDI ZL, LOW(NUM1<<1);
	LDI ZH, HIGH(NUM1<<1);
	LPM R2,Z+;
	LPM R3,Z;
	ADD R1,R3;
	BRCC abc
	LDI R16, 0x01;
abc: ADD R0,R16;
	BRCC def
	LDI R17, 0x01;
def: ADD R0,R2;
	BRCC ghi
	LDI R17, 0x01;
ghi: ST X+,R0;
	ST X+,R1;
	ST X,R17
NOP 
NUM: .DB 0xD3,0x5F;
NUM1: .DB 0x12,0x13;
