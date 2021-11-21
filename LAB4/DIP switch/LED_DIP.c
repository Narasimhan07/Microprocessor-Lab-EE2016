#include "LPC23XX.h"
int a = 0x0F;
int b = 0xF0;
int main(void)
{
	while(1)
	{
		FIO3DIR = 0xFF;    	//LED is output - pins 0 to 7 
		FIO4DIR = 0x00;			//DIP switches are set as input - pins 0 to 7
		int leftNibble = (FIO4PIN&b)>>4;			//left nibble is FIO4PIN&0xF0 followed by right shift of 4 bits
		int rightNibble = (FIO4PIN&a);				//right nibble is FIO4PIN&0x0F
		FIO3PIN = rightNibble*leftNibble;			//multiplies the two nibbles to get the product and store it in LED
		for(int i = 0;i<0xFF;i++);						//delay
	}
	return 0;
}		