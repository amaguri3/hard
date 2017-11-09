#define EXTIO_SCAN_ASCII (*(volatile unsigned int *)0x0310)
#define EXTIO_SCAN_REQ (*(volatile unsigned int *)0x030c)
#define EXTIO_SCAN_STROKE (*(volatile unsigned int *)0x0308)

#define SCAN_STRORING (unsigned int)0xffffffff

#define EXTIO_PRINT_STROKE (*(volatile unsigned int *) 0x0300)
#define EXTIO_PRINT_ASCII  (*(volatile unsigned int *) 0x0304)

#define TRUE    0x1
#define FALSE   0x0

#define GPIO0 (*(volatile unsigned int *) 0x0320)

void my_motor();
void ext_out(); 
void my_scan();
void my_print();
unsigned int my_a2i();

int key;

main() {
  unsigned int str1[16];
  unsigned int str2[16];

  //開始の文字を表示
  str1[0]='I';
  str1[1]='N';
  str1[2]='P';
  str1[3]='U';
  str1[4]='T';
  str1[5]='N';
  str1[6]='U';
  str1[7]='M';
  str1[8]='\n';
  str1[9]='\0';

  while(1){
    my_motor();
  } 
} 
 
void my_motor() {
  ext_out(8); 
  ext_out(4); 
  ext_out(2); 
  ext_out(1); 
} 
 
void ext_out(unsigned int num) {
  unsigned int i;

  GPIO0 = num; 
}
