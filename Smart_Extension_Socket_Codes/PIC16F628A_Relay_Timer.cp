#line 1 "C:/Users/R-B/Desktop/EmbeddedLab_Code/MikroC_PIC/PIC16F628A/Relay_Timer/RelayTimerV4/PIC16F628A_Relay_Timer.c"
#line 12 "C:/Users/R-B/Desktop/EmbeddedLab_Code/MikroC_PIC/PIC16F628A/Relay_Timer/RelayTimerV4/PIC16F628A_Relay_Timer.c"
 sbit LCD_RS at RA1_bit;
 sbit LCD_EN at RA0_bit;
 sbit LCD_D4 at RB4_bit;
 sbit LCD_D5 at RB5_bit;
 sbit LCD_D6 at RB6_bit;
 sbit LCD_D7 at RB7_bit;
 sbit LCD_RS_Direction at TRISA1_bit;
 sbit LCD_EN_Direction at TRISA0_bit;
 sbit LCD_D4_Direction at TRISB4_bit;
 sbit LCD_D5_Direction at TRISB5_bit;
 sbit LCD_D6_Direction at TRISB6_bit;
 sbit LCD_D7_Direction at TRISB7_bit;


 sbit MENU_sw at RA2_bit;
 sbit SELECT_sw at RA3_bit;
 sbit ENTER_sw at RA4_bit;
 sbit START_sw at RB0_bit;
 sbit RelaySW at RB3_bit;
 sbit Buzzer at RB2_bit;


 char MSG2[] = " t-off = ";
 char MSG3[] = " t-on  = ";
 char MSG4[] = " Y/N = ";


 unsigned short HHMM_Pos = 10;

 unsigned short ON_Time[] = {0, 0, 10, 0, 0};
 unsigned short OFF_Time[] = {0, 0, 10, 0, 0};
 unsigned short Mode_SELECT = 0 ;
 unsigned short Repeat_Cycle=0;
 unsigned short i, j, k, Timer_On, Get_Input, Cur_Pos, Cur_On;
 unsigned short temp, refresh, Num, HalfSec, Blink, ChangeMin=0;
 unsigned short OFF_HH, OFF_MM, OFF_SS, ON_HH, ON_MM, ON_SS;

 void Disp_First_Row(){
 if(!Timer_On){
 switch (Mode_Select){
 case 0: Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1,1, ">Set OFF time");
 break;
 case 1: Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1,1, ">Set ON time ");
 break;
 case 2: Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1,1, ">Timer Cycle");
 break;
 }
 }
 else{
 if (RelaySW == 0) {
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1,1, "Device: OFF!");
 }
 if (RelaySW == 1) {
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1,1, "Device: ON!");
 }
 }
 }

 void Disp_Char(unsigned short col, unsigned short chr){
 Lcd_Chr(2, col, chr+48);
 }

 void Disp_Time(){

 for(i=0; i<5; i++){
 if(Mode_SELECT == 0){
 Lcd_Out(2,1, MSG2);
 Disp_Char(HHMM_Pos+i,OFF_Time[i]);
 }
 if(Mode_SELECT == 1){
 Lcd_Out(2,1, MSG3);
 Disp_Char(HHMM_Pos+i,ON_Time[i]);
 }
 if(Mode_SELECT == 2){
 Lcd_Out(2,1, MSG4);
 Disp_Char(8,Repeat_Cycle);
 Lcd_Out(2,9, "      ");

 break;
 }
 }
 }

 void play_sound(){
 Buzzer=1;
 Delay_ms(500);
 Buzzer=0;
 }

 void Delay_X(){
 Delay_ms(300);
 }

 void cursor_left(){
 for(j=0; j<5; j++){
 Lcd_Cmd(_LCD_MOVE_CURSOR_LEFT);
 }
 }

void Store_tData(){
 EEPROM_Write(0,OFF_time[0]);
 EEPROM_Write(1,OFF_time[1]);
 EEPROM_Write(2,OFF_time[3]);
 EEPROM_Write(3,OFF_time[4]);
 EEPROM_Write(4,ON_time[0]);
 EEPROM_Write(5,ON_time[1]);
 EEPROM_Write(6,ON_time[3]);
 EEPROM_Write(7,ON_time[4]);
 EEPROM_Write(8,1);

}

void Read_tData(){
 OFF_time[0]=EEPROM_Read(0);
 OFF_time[1]=EEPROM_Read(1);
 OFF_time[3]=EEPROM_Read(2);
 OFF_time[4]=EEPROM_Read(3);
 ON_time[0]=EEPROM_Read(4);
 ON_time[1]=EEPROM_Read(5);
 ON_time[3]=EEPROM_Read(6);
 ON_time[4]=EEPROM_Read(7);
}

 void disable_timer(){
 INTCON = 0x00;
 RelaySW = 0;
 INTCON.T0IF = 0;
 Timer_On = 0;
 Blink = 0xff;
 Mode_SELECT = 0;
 Disp_First_Row();
 Read_tData();
 Disp_Time();
 play_sound();
 }


 void interrupt() {
 Num ++;
 if(Num == 9) {
 HalfSec ++;
 Num = 0;
 Blink = ~Blink;
 if (HalfSec == 120){
 HalfSec = 0;
 ChangeMin = 1;
 }
 }
 TMR0 = 39;
 INTCON.T0IF = 0;
}



void main() {
 CMCON = 7;
 TRISA = 0b00111100;
 TRISB = 0b00000001;
 PORTB=0;
 PORTA=0;
 RelaySW = 0;
 Timer_On = 0;
 Get_Input = 0;
 Cur_Pos = 0;
 Cur_On = 0;
 refresh = 0;
 Num = 0;
 HalfSec = 0;

 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Out(1,1, "PIC-based Relay");
 Lcd_Out(2,1, "Timer V1.0");

 i=0;
 while(i<1){
 Delay_X();
 i ++;
 }
 Lcd_Cmd(_LCD_CLEAR);
 Disp_First_Row();

 if(EEPROM_Read(8) == 1){
 Read_tData();
 }

 Disp_Time();

 do {

 if(!MENU_sw && !Timer_On){
 Delay_X();
 if(!Get_Input){
 Mode_SELECT = Mode_SELECT+1;
 if(Mode_SELECT > 2) Mode_SELECT=0;
 Disp_First_Row();
 Disp_Time();
 }
 if(Get_Input){
 if(Mode_SELECT==0){
 OFF_time[Cur_Pos] ++;
 temp = OFF_time[Cur_Pos];
 switch (Cur_Pos){
 case 0: if(temp > 9) OFF_time[Cur_Pos]=0;
 break;
 case 1: if(temp > 9) OFF_time[Cur_Pos]=0;
 break;
 case 3: if(temp > 5) OFF_time[Cur_Pos]=0;
 break;
 case 4: if(temp > 9) OFF_time[Cur_Pos]=0;
 break;
 case 6: if(temp > 5) OFF_time[Cur_Pos]=0;
 break;
 case 7: if(temp > 9) OFF_time[Cur_Pos]=0;
 break;
 }
 Disp_Char(HHMM_Pos+Cur_Pos, OFF_time[Cur_Pos]);

 }
 if(Mode_SELECT==1){
 ON_time[Cur_Pos] ++;
 temp = ON_time[Cur_Pos];
 switch(Cur_Pos){
 case 0: if(temp > 9) ON_time[Cur_Pos]=0;
 break;
 case 1: if(temp > 9) ON_time[Cur_Pos]=0;
 break;
 case 3: if(temp > 5) ON_time[Cur_Pos]=0;
 break;
 case 4: if(temp > 9) ON_time[Cur_Pos]=0;
 break;
 }
 Disp_Char(HHMM_Pos+Cur_Pos, ON_time[Cur_Pos]);
 }

 if(Mode_SELECT==2){
 Repeat_Cycle ++;
 if(Repeat_Cycle > 1) Repeat_Cycle=0;
 Disp_Char(8, Repeat_Cycle);
 }
 Lcd_Cmd(_LCD_MOVE_CURSOR_LEFT);
 }
 }


 if(!SELECT_sw && !Timer_On){
 Delay_X();
 Get_Input = 1;
 if(Mode_SELECT < 2) {
 if(Cur_On) {
 Cur_Pos ++;
 if (Cur_Pos == 2) {
 Lcd_Cmd(_LCD_MOVE_CURSOR_RIGHT);
 Cur_Pos ++;
 }
 if(Cur_Pos > 4) {
 Lcd_Cmd(_LCD_MOVE_CURSOR_RIGHT);
 Cur_Pos = 0;
 cursor_left();
 }
 else Lcd_Cmd(_LCD_MOVE_CURSOR_RIGHT);
 }
 if(!Cur_On) {
 Cur_On = 1;
 cursor_left();
 Lcd_Cmd(_LCD_UNDERLINE_ON);
 }
 }
 else {
 if(!Cur_On) {
 Cur_On = 1;
 for(j=0; j<7; j++){
 Lcd_Cmd(_LCD_MOVE_CURSOR_LEFT);
 }
 Lcd_Cmd(_LCD_UNDERLINE_ON);
 }
 }

 }

 if(!ENTER_sw && Get_Input){
 Delay_X();
 Get_Input = 0;
 Cur_On = 0;
 Cur_Pos = 0;
 Disp_Time();
 Lcd_Cmd(_LCD_CURSOR_OFF);
 }

 if (!START_sw && !Get_Input){
 Delay_X();

 switch(Timer_On){
 case 0: play_sound();
 Timer_On = 1;
 Disp_First_Row();
 OPTION_REG = 0x07;
 TMR0 = 39;
 INTCON = 0xA0;
 INTCON.T0IF = 0;
 Mode_SELECT = 0;
 Blink = 0;
 Disp_Time();
 Store_tData();
 break;
 case 1: disable_timer();
 break;
 }
 }

 if(Timer_On){
 OFF_HH = OFF_Time[0]*10 + OFF_Time[1];
 OFF_MM = OFF_Time[3]*10 + OFF_Time[4];
 ON_HH = ON_Time[0]*10 + ON_Time[1];
 ON_MM = ON_Time[3]*10 + ON_Time[4];
 switch(Blink){
 case 0: Lcd_Chr(2,HHMM_Pos+2,' ');
 break;
 case 255: Lcd_Chr(2,HHMM_Pos+2,':');
 break;
 }

 if(!OFF_HH && !OFF_MM &&!RelaySW){
 if(ON_HH || ON_MM){
 RelaySW = 1;
 Mode_SELECT = 1;
 Disp_First_Row();
 Disp_Time();
 play_sound();
 }

 else {
 disable_timer();
 }
 }

 if(!ON_HH && !ON_MM && RelaySW){
 if(Repeat_Cycle ==1){
 RelaySW = 0;
 Read_tData();
 Mode_SELECT = 0;
 Disp_First_Row();
 Disp_Time();
 play_sound();
 }
 else {
 disable_timer();
 play_sound();
 }

 }

 if(ChangeMin) {
 switch(Mode_SELECT){
 case 0: if(OFF_MM == 0 && OFF_HH>0){
 OFF_MM = 59;
 OFF_HH -- ;
 }
 else if (OFF_MM >>0) OFF_MM --;
 OFF_Time[0] = OFF_HH/10;
 OFF_Time[1] = OFF_HH%10;
 OFF_Time[3] = OFF_MM/10;
 OFF_Time[4] = OFF_MM%10;
 break;

 case 1: if(ON_MM == 0 && ON_HH>0){
 ON_MM = 59;
 ON_HH -- ;
 }
 else if(ON_MM >> 0) ON_MM --;
 ON_Time[0] = ON_HH/10;
 ON_Time[1] = ON_HH%10;
 ON_Time[3] = ON_MM/10;
 ON_Time[4] = ON_MM%10;
 break;
 }
 ChangeMin = 0;
 Disp_Time();
 }

 }


 }while(1);
 }
