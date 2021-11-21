#include "LPC23xx.h"
void delay(void)
{ 
  int i,j;
  for(i=0; i<0xff;i++)
  for(j=0; j<0XFF;j++);
}
int main(void)
{ 
	IODIR0 = 0XFFFFFFFF;        
	/* Demo code: the values written to the IOPIN are in the order 0x280, 0x180, 0x140 and 0x240. 
	This rotates the stepper motor in clockwise direction.
	Hence to rotate it opposite, we write the values to IOPIN in the reverse order.
	The speed of rotation is controlled by the values in delay function*/
	while(1)
	{ 
		IOPIN0=0X00000280;
		delay();
		IOPIN0=0X00000180;
		delay();
		IOPIN0=0X00000140;
		delay();
		IOPIN0=0X00000240;
		delay();
	}
	return 0;
}
