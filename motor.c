#define EXTIO_SCAN_ASCII (*(volatile unsigned int *)0x0310)
#define EXTIO_SCAN_REQ (*(volatile unsigned int *)0x030c)
#define EXTIO_SCAN_STROKE (*(volatile unsigned int *)0x0308)

#define SCAN_STRORING (unsigned int)0xffffffff

#define EXTIO_PRINT_STROKE (*(volatile unsigned int *) 0x0300)
#define EXTIO_PRINT_ASCII  (*(volatile unsigned int *) 0x0304)

#define TRUE    0x1
#define FALSE   0x0

#define GPIO0 (*(volatile unsigned int *) 0x0320)

#define T 1.0E4

void my_motor();
void ext_out(); 
void my_scan();
void my_print();

int key;

main() {
  unsigned int str1[32];
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
  my_print(str1);

  while(1){
    my_motor(key);    
  }
} 
  
void my_motor(int k) {

  if(k==0){
    ext_out(0);
  }else if(k==1){//1相励磁
    ext_out(8); 
    ext_out(4); 
    ext_out(2); 
    ext_out(1);
  }else if(k==2){//１逆
    ext_out(1); 
    ext_out(2); 
    ext_out(4); 
    ext_out(8);
  } else if(k==3){//２相励磁
    ext_out(9); 
    ext_out(12); 
    ext_out(6); 
    ext_out(3);
  } else if(k==4){//2逆
    ext_out(3); 
    ext_out(6); 
    ext_out(12); 
    ext_out(9);
  } else if(k==5){//12相励磁
    ext_out(9); 
    ext_out(8); 
    ext_out(12); 
    ext_out(4);  
    ext_out(6); 
    ext_out(2); 
    ext_out(3); 
    ext_out(1);
  } else if(k==6){//12逆
    ext_out(1); 
    ext_out(3); 
    ext_out(2); 
    ext_out(6);
    ext_out(4); 
    ext_out(12); 
    ext_out(8); 
    ext_out(9);
  }  
} 
 
void ext_out(unsigned int num) {
  unsigned int i;

  GPIO0 = num; 

  //ここどうしよう
}

void my_print(stru){
  unsigned int *str;
  while(*str!='\0'){
    EXTIO_PRINT_STROKE=(unsigned int)0x00000000;

    if ((*str >= 'A') && (*str <= 'Z')) {
      EXTIO_PRINT_ASCII = *str - 'A' + 1;
    } else if ((*str >= 'a') && (*str <= 'z')) {
      EXTIO_PRINT_ASCII = *str - 'a' + 1;
    } else if ((*str >= '0') && (*str <= '9')) {
      EXTIO_PRINT_ASCII = *str - '0' + 48;
    } else {
      if (*str == '@') {
	EXTIO_PRINT_ASCII = (unsigned int)0;
      } else if (*str == '[') {
	  EXTIO_PRINT_ASCII = (unsigned int)27;
	} else if (*str == ']') {
	EXTIO_PRINT_ASCII = (unsigned int)29;
      } else if ((*str >= ' ') && (*str <= '/')) {
	EXTIO_PRINT_ASCII = *str - ' ' + 32;
      } else if (*str == '?') {
	EXTIO_PRINT_ASCII = (unsigned int)58;
      } else if (*str == '=') {
	EXTIO_PRINT_ASCII = (unsigned int)59;
      } else if (*str == ';') {
	EXTIO_PRINT_ASCII = (unsigned int)60;
      } else if (*str == ':') {
	EXTIO_PRINT_ASCII = (unsigned int)61;
      } else if (*str == '\n') {
	EXTIO_PRINT_ASCII = (unsigned int)62;
      } else {
	EXTIO_PRINT_ASCII = (unsigned int)0x00000000;
      }
    }
    EXTIO_PRINT_STROKE = (unsigned int)0x00000001;
    str++;
  }
}

//キーボードから入力された文字列を str[] に記憶する関数 
void my_scan(strd){
  unsigned int *str;
  
  EXTIO_SCAN_STROKE = (unsigned int)0x00000000;
  EXTIO_SCAN_REQ = (unsigned int)0x00000001;
  EXTIO_SCAN_STROKE = (unsigned int)0x00000001;
  EXTIO_SCAN_STROKE = (unsigned int)0x00000000;
  EXTIO_SCAN_STROKE = (unsigned int)0x00000001;
  
  while (EXTIO_SCAN_ASCII == SCAN_STRORING) {
    EXTIO_SCAN_STROKE = (unsigned int)0x00000000;
    EXTIO_SCAN_STROKE = (unsigned int)0x00000001;
  }
  while ((*str = EXTIO_SCAN_ASCII) != (unsigned int)0x3e) {
    if ((*str >= 1) && (*str <= 26)) {
      *str = 'A' + *str - 1;
    } else if ((*str >= 48) && (*str <= 57)) {
      *str = '0' + *str - 48;
    } else {
      if (*str == 0) {
	*str = '@';
      } else if (*str == 27) {
	*str = '[';
		  } else if (*str == 29) {
	  *str = ']';
      } else if ((*str >= 32) && (*str <= 47)) {
	*str = ' ' + *str - 32;
      } else if (*str == 58) {
	*str = '?';
      } else if (*str == 59) {
	*str = '=';
      } else if (*str == 60) {
	*str = ';';
      } else if (*str == 61) {
	*str = ':';
      } else if (*str == 62) {
	*str = '\n';
      } else {
	*str = '@';
      }
    }
    EXTIO_SCAN_STROKE = (unsigned int)0x00000000;
    EXTIO_SCAN_STROKE = (unsigned int)0x00000001;
    str++;
  }
  *str = '\0';
  EXTIO_SCAN_STROKE = (unsigned int)0x00000000;
  EXTIO_SCAN_REQ = (unsigned int)0x00000000;
  EXTIO_SCAN_STROKE = (unsigned int)0x00000001;
  EXTIO_SCAN_STROKE = (unsigned int)0x00000000;
}


/*

void my_motor();
void spin1();
void spin2();
void spin3();
void spin_R();
void ext_out();
void my_print();
void my_scan();

main() {
while(1){
my_motor();
}
}
void my_motor() {
unsigned int str1[32];
unsigned int str2[16];

while(1) {
str1[0] = ’E’;
str1[1] = ’X’;
str1[2] = ’C’;
str1[3] = ’I’;
str1[4] = ’T’;
str1[5] = ’A’;
str1[6] = ’T’;
str1[7] = ’I’;
str1[8] = ’O’;
str1[9] = ’N’;
str1[10] = ’-’;
str1[11] = ’M’;
str1[12] = ’O’;
str1[13] = ’D’;
str1[14] = ’E’;
str1[15] = ’=’;
my_print(str1);
my_scan(str2);
if(str2[0] == ’1’){
spin1();
}else if(str2[0] == ’2’){
spin2();
}else if(str2[0] == ’3’){
spin3();
}else{
spin_R();
}
}
}
33
//1 相励磁方式
void spin1() {
unsigned int i=0;
while(i < 500){
ext_out(8);
ext_out(4);
ext_out(2);
ext_out(1);
i++;
}
}
//2 相励磁方式
void spin2() {
unsigned int i=0;
while(i < 500){
ext_out(9);
ext_out(12);
ext_out(6);
ext_out(3);
i++;
}
}
//1-2 相励磁方式
void spin3() {
unsigned int i=0;
while(i < 500){
ext_out(9);
ext_out(8);
34
ext_out(12);
ext_out(4);
ext_out(6);
ext_out(2);
ext_out(3);
ext_out(1);
i++;
}
}
//1 相励磁逆回転
void spin_R() {
unsigned int i=0;
while(i < 100){
ext_out(1);
ext_out(2);
ext_out(4);
ext_out(8);
i++;
}
}



*/
