;
; int0_assembly.asm
;
; Created: 22-09-2021 15:37:33
; Author : naras
;


; Replace with your application code
rjmp reset

.org 0x0001
rjmp int0_ISR

.org 0x0100

reset:
	  ;Loading stack pointer address
      LDI R16,0x70
	  OUT SPL,R16
	  LDI R16,0x00
	  OUT SPH,R16
	  ;Interface port B pin0 to be output
	  ;so to view LED blinking
	  LDI R16,0x00
	  OUT DDRD,R16
	  OUT MCUCR,R16 ;Set MCUCR register to enable low level interrupt

	  ;Set GICR register to enable interrupt 1
	  LDI R16,0B01000000
	  OUT GICR,R16
	  LDI R16,0x00
	  OUT PORTB,R16

	  SEI
ind_loop:rjmp ind_loop

int0_ISR:IN R16,SREG
		 PUSH R16

		 LDI R16,0x0A
		 MOV R0,R16
	c2:	 LDI R21,30
		 ;Modify below loops to make LED blink for 1 sec
	     LDI R16,0x01
		 OUT PORTB,R16

		 
	c1:	 LDI R17,110
    a1:  LDI R20,100
	a2:  DEC R20
		 BRNE a2
		 DEC R17
		 BRNE a1
		 DEC R21
		 BRNE c1
		 LDI R16,0x00
		 OUT PORTB,R16
		 DEC R0
		 BRNE c2
		 POP R10
		 OUT SREG,R10
		 RETI