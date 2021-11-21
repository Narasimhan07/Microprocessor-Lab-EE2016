*		To find whether 32 bit number is odd or even without division
		TTL		oddOReven
		AREA	Program, CODE, READONLY
		ENTRY

Main									;the program displays result 0 if EVEN and 1 if ODD
		LDR 	R1, Value1
		AND 	R2, R1, #0x00000001		;isolating the last bit alone. last bit 1 means odd otherwise even
		CMP		R2, #1					;checking for odd case
		BNE		leap					;if not equal then even and breaks to 12th line
		LDR		R3, Odd
leap	STR 	R3, Result				;R3 contains result
		SWI		&11
		
Value1	DCD 	&A234BE11				;number which we want to check odd or even
Odd		DCD 	&00000001
Result	DCW		0
		END