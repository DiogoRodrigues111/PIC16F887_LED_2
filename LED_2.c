#define BIS      0
#define BL       (*(volatileunsigned short *)BIS)
#define BB       BL
#define PORTB06  0x0006      //port
#define TRISB86  0x0086      //port
#define TRIS86go (*(volatile unsigned short *)TRISB86)
#define TRIS     TRIS86go
#define PORTBgo  (*(volatile unsigned short *)PORTB06)
#define PORT     PORTBgo
#define ANSEL188 0x0188
#define ANSEL188go (*(volatile unsigned short *)ANSEL188)
#define ANSEL_   ANSEL188go

unsigned int delay_ms(unsigned long ms) {
  long a,b;
  for(a=0; a<65000; a++)
    for(b=0; b<ms; b++)
      ;
  return (unsigned int)ms;
}

void main() {
    ANSEL_  = 0;
    TRIS    = 0;
    
    while(1) {
       PORT  = 0x01;
       Delay_ms(500);
       PORT  = 0x00;
       Delay_ms(500);
    }
}