*		to calculate factorial of a number

		TTL		factorial
		AREA	Program, CODE, READONLY
		ENTRY
		
Main
		LDR		R1, Value1		;store 1 in registers R1, R3 and number to find factorial in R2
		LDR		R3, Value1
		LDR		R2, Value2
Loop
		MUL		R4, R1, R2		;Multiply number and store in R1
		MOV		R1, R4
    	SUB		R2, R3
		CMP 	R2, R3			;decrement number till it becomes 1. Then break from the loop
		BNE 	Loop
		STR		R1, Result		;store answer in Result and also answer is present in R1.
		SWI		&11
		
Value1	DCW		&0001
		ALIGN
Value2	DCW		&0005			;enter number to find factorial here in hexadecimal
		ALIGN		
Result	DCW		0
		END