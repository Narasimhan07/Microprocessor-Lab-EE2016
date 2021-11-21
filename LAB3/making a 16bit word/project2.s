*		Combine the low four bits of each of the four consecutive bytes beginning at LIST into 16bit halfword
		TTL		16bithalfword
		AREA	Program, CODE, READONLY
		ENTRY
Main
		LDR 	R1, Value1				;value entered by user
		AND		R2, R1, #0x0000000F		;ANDing to find the last 4 bits
		AND 	R3, R1, #0x00000F00		;ANDing to find the 3rd last set of 4 bits
		MOV 	R3, R3, LSR #4
		ADD		R2, R2, R3
		AND 	R3, R1, #0x000F0000		;ANDing to find the 5th last set of 4 bits
		MOV 	R3, R3, LSR #8
		ADD		R2, R2, R3
		AND 	R3, R1, #0x0F000000		;ANDing to find the 7th last set of 4 bits
		MOV 	R3, R3, LSR #12
		ADD		R2, R2, R3
		STR		R2, Result				;Result available in R2 also
		SWI &11
		
Value1	DCD 	&0C020B0A
Result 	DCW 	0
		END
		