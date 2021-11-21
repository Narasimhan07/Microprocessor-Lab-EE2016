#include "LPC23xx.h"
void delay(void)
{ int i,j;
for(i=0; i<0xff;i++)
for(j=0; j<0XFF;j++);
}
int main(void)
{ 
	IODIR0 = 0XFFFFFFFF;        
	// to rotate the loop by a specific angle we control this while statement. 
	/* In the demo code, the values written to the IOPIN was in the order 0x280, 0x180, 0x140 and 0x240. 
	This rotated the stepper motor in clockwise direction.
	Hence to rotate it opposite, we write the values to IOPIN in the reverse order.
	The speed of rotation is controlled by the values in delay function*/
	//each time the while loop executes it corresponds to 8 degrees of rotation in the motor.
	// to rotate by 80 degrees, the while loop has to run 10 times.
	int k = 10;
	while(k>0)
	{ 
		IOPIN0=0X00000240;
		delay();
		IOPIN0=0X00000140;
		delay();
		IOPIN0=0X00000180;
		delay();
		IOPIN0=0X00000280;
		delay();
		k--;
	}
	return 0;
}