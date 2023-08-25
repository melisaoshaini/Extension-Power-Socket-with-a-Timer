
_Disp_First_Row:

;PIC16F628A_Relay_Timer.c,49 :: 		void Disp_First_Row(){
;PIC16F628A_Relay_Timer.c,50 :: 		if(!Timer_On){
	MOVF       _Timer_On+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_Disp_First_Row0
;PIC16F628A_Relay_Timer.c,51 :: 		switch (Mode_Select){
	GOTO       L_Disp_First_Row1
;PIC16F628A_Relay_Timer.c,52 :: 		case 0: Lcd_Cmd(_LCD_CLEAR);
L_Disp_First_Row3:
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;PIC16F628A_Relay_Timer.c,53 :: 		Lcd_Out(1,1, ">Set OFF time");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_PIC16F628A_Relay_Timer+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;PIC16F628A_Relay_Timer.c,54 :: 		break;
	GOTO       L_Disp_First_Row2
;PIC16F628A_Relay_Timer.c,55 :: 		case 1: Lcd_Cmd(_LCD_CLEAR);
L_Disp_First_Row4:
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;PIC16F628A_Relay_Timer.c,56 :: 		Lcd_Out(1,1, ">Set ON time ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_PIC16F628A_Relay_Timer+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;PIC16F628A_Relay_Timer.c,57 :: 		break;
	GOTO       L_Disp_First_Row2
;PIC16F628A_Relay_Timer.c,58 :: 		case 2: Lcd_Cmd(_LCD_CLEAR);
L_Disp_First_Row5:
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;PIC16F628A_Relay_Timer.c,59 :: 		Lcd_Out(1,1, ">Timer Cycle");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_PIC16F628A_Relay_Timer+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;PIC16F628A_Relay_Timer.c,60 :: 		break;
	GOTO       L_Disp_First_Row2
;PIC16F628A_Relay_Timer.c,61 :: 		}
L_Disp_First_Row1:
	MOVF       _Mode_SELECT+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_Disp_First_Row3
	MOVF       _Mode_SELECT+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_Disp_First_Row4
	MOVF       _Mode_SELECT+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_Disp_First_Row5
L_Disp_First_Row2:
;PIC16F628A_Relay_Timer.c,62 :: 		}
	GOTO       L_Disp_First_Row6
L_Disp_First_Row0:
;PIC16F628A_Relay_Timer.c,64 :: 		if (RelaySW == 0) {
	BTFSC      RB3_bit+0, BitPos(RB3_bit+0)
	GOTO       L_Disp_First_Row7
;PIC16F628A_Relay_Timer.c,65 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;PIC16F628A_Relay_Timer.c,66 :: 		Lcd_Out(1,1, "Device: OFF!");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_PIC16F628A_Relay_Timer+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;PIC16F628A_Relay_Timer.c,67 :: 		}
L_Disp_First_Row7:
;PIC16F628A_Relay_Timer.c,68 :: 		if (RelaySW == 1) {
	BTFSS      RB3_bit+0, BitPos(RB3_bit+0)
	GOTO       L_Disp_First_Row8
;PIC16F628A_Relay_Timer.c,69 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;PIC16F628A_Relay_Timer.c,70 :: 		Lcd_Out(1,1, "Device: ON!");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr5_PIC16F628A_Relay_Timer+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;PIC16F628A_Relay_Timer.c,71 :: 		}
L_Disp_First_Row8:
;PIC16F628A_Relay_Timer.c,72 :: 		}
L_Disp_First_Row6:
;PIC16F628A_Relay_Timer.c,73 :: 		}
L_end_Disp_First_Row:
	RETURN
; end of _Disp_First_Row

_Disp_Char:

;PIC16F628A_Relay_Timer.c,75 :: 		void Disp_Char(unsigned short col, unsigned short chr){
;PIC16F628A_Relay_Timer.c,76 :: 		Lcd_Chr(2, col, chr+48);
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVF       FARG_Disp_Char_col+0, 0
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      48
	ADDWF      FARG_Disp_Char_chr+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;PIC16F628A_Relay_Timer.c,77 :: 		}
L_end_Disp_Char:
	RETURN
; end of _Disp_Char

_Disp_Time:

;PIC16F628A_Relay_Timer.c,79 :: 		void Disp_Time(){
;PIC16F628A_Relay_Timer.c,81 :: 		for(i=0; i<5; i++){
	CLRF       _i+0
L_Disp_Time9:
	MOVLW      5
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Disp_Time10
;PIC16F628A_Relay_Timer.c,82 :: 		if(Mode_SELECT == 0){  // Mode_SELECT=0 is OFF time SELECT_sw
	MOVF       _Mode_SELECT+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_Disp_Time12
;PIC16F628A_Relay_Timer.c,83 :: 		Lcd_Out(2,1, MSG2);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _MSG2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;PIC16F628A_Relay_Timer.c,84 :: 		Disp_Char(HHMM_Pos+i,OFF_Time[i]);
	MOVF       _i+0, 0
	ADDWF      _HHMM_Pos+0, 0
	MOVWF      FARG_Disp_Char_col+0
	MOVF       _i+0, 0
	ADDLW      _OFF_Time+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_Disp_Char_chr+0
	CALL       _Disp_Char+0
;PIC16F628A_Relay_Timer.c,85 :: 		}
L_Disp_Time12:
;PIC16F628A_Relay_Timer.c,86 :: 		if(Mode_SELECT == 1){  // Mode_SELECT=0 is ON time SELECT_sw
	MOVF       _Mode_SELECT+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_Disp_Time13
;PIC16F628A_Relay_Timer.c,87 :: 		Lcd_Out(2,1, MSG3);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _MSG3+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;PIC16F628A_Relay_Timer.c,88 :: 		Disp_Char(HHMM_Pos+i,ON_Time[i]);
	MOVF       _i+0, 0
	ADDWF      _HHMM_Pos+0, 0
	MOVWF      FARG_Disp_Char_col+0
	MOVF       _i+0, 0
	ADDLW      _ON_Time+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_Disp_Char_chr+0
	CALL       _Disp_Char+0
;PIC16F628A_Relay_Timer.c,89 :: 		}
L_Disp_Time13:
;PIC16F628A_Relay_Timer.c,90 :: 		if(Mode_SELECT == 2){  // Mode_SELECT=0 is ON time SELECT_sw
	MOVF       _Mode_SELECT+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_Disp_Time14
;PIC16F628A_Relay_Timer.c,91 :: 		Lcd_Out(2,1, MSG4);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _MSG4+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;PIC16F628A_Relay_Timer.c,92 :: 		Disp_Char(8,Repeat_Cycle);
	MOVLW      8
	MOVWF      FARG_Disp_Char_col+0
	MOVF       _Repeat_Cycle+0, 0
	MOVWF      FARG_Disp_Char_chr+0
	CALL       _Disp_Char+0
;PIC16F628A_Relay_Timer.c,93 :: 		Lcd_Out(2,9, "      ");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      9
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr6_PIC16F628A_Relay_Timer+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;PIC16F628A_Relay_Timer.c,95 :: 		break;
	GOTO       L_Disp_Time10
;PIC16F628A_Relay_Timer.c,96 :: 		}
L_Disp_Time14:
;PIC16F628A_Relay_Timer.c,81 :: 		for(i=0; i<5; i++){
	INCF       _i+0, 1
;PIC16F628A_Relay_Timer.c,97 :: 		}
	GOTO       L_Disp_Time9
L_Disp_Time10:
;PIC16F628A_Relay_Timer.c,98 :: 		}
L_end_Disp_Time:
	RETURN
; end of _Disp_Time

_play_sound:

;PIC16F628A_Relay_Timer.c,100 :: 		void play_sound(){
;PIC16F628A_Relay_Timer.c,101 :: 		Buzzer=1;
	BSF        RB2_bit+0, BitPos(RB2_bit+0)
;PIC16F628A_Relay_Timer.c,102 :: 		Delay_ms(500);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_play_sound15:
	DECFSZ     R13+0, 1
	GOTO       L_play_sound15
	DECFSZ     R12+0, 1
	GOTO       L_play_sound15
	DECFSZ     R11+0, 1
	GOTO       L_play_sound15
	NOP
	NOP
;PIC16F628A_Relay_Timer.c,103 :: 		Buzzer=0;
	BCF        RB2_bit+0, BitPos(RB2_bit+0)
;PIC16F628A_Relay_Timer.c,104 :: 		}
L_end_play_sound:
	RETURN
; end of _play_sound

_Delay_X:

;PIC16F628A_Relay_Timer.c,106 :: 		void Delay_X(){
;PIC16F628A_Relay_Timer.c,107 :: 		Delay_ms(300);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      134
	MOVWF      R12+0
	MOVLW      153
	MOVWF      R13+0
L_Delay_X16:
	DECFSZ     R13+0, 1
	GOTO       L_Delay_X16
	DECFSZ     R12+0, 1
	GOTO       L_Delay_X16
	DECFSZ     R11+0, 1
	GOTO       L_Delay_X16
;PIC16F628A_Relay_Timer.c,108 :: 		}
L_end_Delay_X:
	RETURN
; end of _Delay_X

_cursor_left:

;PIC16F628A_Relay_Timer.c,110 :: 		void cursor_left(){
;PIC16F628A_Relay_Timer.c,111 :: 		for(j=0; j<5; j++){
	CLRF       _j+0
L_cursor_left17:
	MOVLW      5
	SUBWF      _j+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_cursor_left18
;PIC16F628A_Relay_Timer.c,112 :: 		Lcd_Cmd(_LCD_MOVE_CURSOR_LEFT);
	MOVLW      16
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;PIC16F628A_Relay_Timer.c,111 :: 		for(j=0; j<5; j++){
	INCF       _j+0, 1
;PIC16F628A_Relay_Timer.c,113 :: 		}
	GOTO       L_cursor_left17
L_cursor_left18:
;PIC16F628A_Relay_Timer.c,114 :: 		}
L_end_cursor_left:
	RETURN
; end of _cursor_left

_Store_tData:

;PIC16F628A_Relay_Timer.c,116 :: 		void Store_tData(){
;PIC16F628A_Relay_Timer.c,117 :: 		EEPROM_Write(0,OFF_time[0]);
	CLRF       FARG_EEPROM_Write_Address+0
	MOVF       _OFF_Time+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;PIC16F628A_Relay_Timer.c,118 :: 		EEPROM_Write(1,OFF_time[1]);
	MOVLW      1
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVF       _OFF_Time+1, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;PIC16F628A_Relay_Timer.c,119 :: 		EEPROM_Write(2,OFF_time[3]);
	MOVLW      2
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVF       _OFF_Time+3, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;PIC16F628A_Relay_Timer.c,120 :: 		EEPROM_Write(3,OFF_time[4]);
	MOVLW      3
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVF       _OFF_Time+4, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;PIC16F628A_Relay_Timer.c,121 :: 		EEPROM_Write(4,ON_time[0]);
	MOVLW      4
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVF       _ON_Time+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;PIC16F628A_Relay_Timer.c,122 :: 		EEPROM_Write(5,ON_time[1]);
	MOVLW      5
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVF       _ON_Time+1, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;PIC16F628A_Relay_Timer.c,123 :: 		EEPROM_Write(6,ON_time[3]);
	MOVLW      6
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVF       _ON_Time+3, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;PIC16F628A_Relay_Timer.c,124 :: 		EEPROM_Write(7,ON_time[4]);
	MOVLW      7
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVF       _ON_Time+4, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;PIC16F628A_Relay_Timer.c,125 :: 		EEPROM_Write(8,1);     // Address 8 stores EEPROM Write flag
	MOVLW      8
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVLW      1
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;PIC16F628A_Relay_Timer.c,127 :: 		}
L_end_Store_tData:
	RETURN
; end of _Store_tData

_Read_tData:

;PIC16F628A_Relay_Timer.c,129 :: 		void Read_tData(){
;PIC16F628A_Relay_Timer.c,130 :: 		OFF_time[0]=EEPROM_Read(0);
	CLRF       FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _OFF_Time+0
;PIC16F628A_Relay_Timer.c,131 :: 		OFF_time[1]=EEPROM_Read(1);
	MOVLW      1
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _OFF_Time+1
;PIC16F628A_Relay_Timer.c,132 :: 		OFF_time[3]=EEPROM_Read(2);
	MOVLW      2
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _OFF_Time+3
;PIC16F628A_Relay_Timer.c,133 :: 		OFF_time[4]=EEPROM_Read(3);
	MOVLW      3
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _OFF_Time+4
;PIC16F628A_Relay_Timer.c,134 :: 		ON_time[0]=EEPROM_Read(4);
	MOVLW      4
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _ON_Time+0
;PIC16F628A_Relay_Timer.c,135 :: 		ON_time[1]=EEPROM_Read(5);
	MOVLW      5
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _ON_Time+1
;PIC16F628A_Relay_Timer.c,136 :: 		ON_time[3]=EEPROM_Read(6);
	MOVLW      6
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _ON_Time+3
;PIC16F628A_Relay_Timer.c,137 :: 		ON_time[4]=EEPROM_Read(7);
	MOVLW      7
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _ON_Time+4
;PIC16F628A_Relay_Timer.c,138 :: 		}
L_end_Read_tData:
	RETURN
; end of _Read_tData

_disable_timer:

;PIC16F628A_Relay_Timer.c,140 :: 		void disable_timer(){
;PIC16F628A_Relay_Timer.c,141 :: 		INTCON = 0x00;
	CLRF       INTCON+0
;PIC16F628A_Relay_Timer.c,142 :: 		RelaySW = 0;
	BCF        RB3_bit+0, BitPos(RB3_bit+0)
;PIC16F628A_Relay_Timer.c,143 :: 		INTCON.T0IF = 0;
	BCF        INTCON+0, 2
;PIC16F628A_Relay_Timer.c,144 :: 		Timer_On = 0;
	CLRF       _Timer_On+0
;PIC16F628A_Relay_Timer.c,145 :: 		Blink = 0xff;
	MOVLW      255
	MOVWF      _Blink+0
;PIC16F628A_Relay_Timer.c,146 :: 		Mode_SELECT = 0;
	CLRF       _Mode_SELECT+0
;PIC16F628A_Relay_Timer.c,147 :: 		Disp_First_Row();
	CALL       _Disp_First_Row+0
;PIC16F628A_Relay_Timer.c,148 :: 		Read_tData();
	CALL       _Read_tData+0
;PIC16F628A_Relay_Timer.c,149 :: 		Disp_Time();
	CALL       _Disp_Time+0
;PIC16F628A_Relay_Timer.c,150 :: 		play_sound();
	CALL       _play_sound+0
;PIC16F628A_Relay_Timer.c,151 :: 		}
L_end_disable_timer:
	RETURN
; end of _disable_timer

_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;PIC16F628A_Relay_Timer.c,154 :: 		void interrupt() {
;PIC16F628A_Relay_Timer.c,155 :: 		Num ++;           // Interrupt causes Num to be incremented by 1
	INCF       _Num+0, 1
;PIC16F628A_Relay_Timer.c,156 :: 		if(Num == 9) {
	MOVF       _Num+0, 0
	XORLW      9
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt20
;PIC16F628A_Relay_Timer.c,157 :: 		HalfSec ++;      // Increase sec
	INCF       _HalfSec+0, 1
;PIC16F628A_Relay_Timer.c,158 :: 		Num = 0;
	CLRF       _Num+0
;PIC16F628A_Relay_Timer.c,159 :: 		Blink = ~Blink;
	COMF       _Blink+0, 1
;PIC16F628A_Relay_Timer.c,160 :: 		if (HalfSec == 120){
	MOVF       _HalfSec+0, 0
	XORLW      120
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt21
;PIC16F628A_Relay_Timer.c,161 :: 		HalfSec = 0;
	CLRF       _HalfSec+0
;PIC16F628A_Relay_Timer.c,162 :: 		ChangeMin = 1;
	MOVLW      1
	MOVWF      _ChangeMin+0
;PIC16F628A_Relay_Timer.c,163 :: 		}
L_interrupt21:
;PIC16F628A_Relay_Timer.c,164 :: 		}
L_interrupt20:
;PIC16F628A_Relay_Timer.c,165 :: 		TMR0 = 39;        // TMR0 returns to its initial value
	MOVLW      39
	MOVWF      TMR0+0
;PIC16F628A_Relay_Timer.c,166 :: 		INTCON.T0IF = 0;  // Bit T0IF is cleared so that the interrupt could reoccur
	BCF        INTCON+0, 2
;PIC16F628A_Relay_Timer.c,167 :: 		}
L_end_interrupt:
L__interrupt137:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;PIC16F628A_Relay_Timer.c,171 :: 		void main() {
;PIC16F628A_Relay_Timer.c,172 :: 		CMCON = 7;           // Disable Comparators
	MOVLW      7
	MOVWF      CMCON+0
;PIC16F628A_Relay_Timer.c,173 :: 		TRISA = 0b00111100;
	MOVLW      60
	MOVWF      TRISA+0
;PIC16F628A_Relay_Timer.c,174 :: 		TRISB = 0b00000001;
	MOVLW      1
	MOVWF      TRISB+0
;PIC16F628A_Relay_Timer.c,175 :: 		PORTB=0;
	CLRF       PORTB+0
;PIC16F628A_Relay_Timer.c,176 :: 		PORTA=0;
	CLRF       PORTA+0
;PIC16F628A_Relay_Timer.c,177 :: 		RelaySW = 0;
	BCF        RB3_bit+0, BitPos(RB3_bit+0)
;PIC16F628A_Relay_Timer.c,178 :: 		Timer_On = 0;
	CLRF       _Timer_On+0
;PIC16F628A_Relay_Timer.c,179 :: 		Get_Input = 0;
	CLRF       _Get_Input+0
;PIC16F628A_Relay_Timer.c,180 :: 		Cur_Pos = 0;
	CLRF       _Cur_Pos+0
;PIC16F628A_Relay_Timer.c,181 :: 		Cur_On = 0;
	CLRF       _Cur_On+0
;PIC16F628A_Relay_Timer.c,182 :: 		refresh = 0;
	CLRF       _refresh+0
;PIC16F628A_Relay_Timer.c,183 :: 		Num = 0;
	CLRF       _Num+0
;PIC16F628A_Relay_Timer.c,184 :: 		HalfSec = 0;
	CLRF       _HalfSec+0
;PIC16F628A_Relay_Timer.c,186 :: 		Lcd_Init();                // Initialize LCD
	CALL       _Lcd_Init+0
;PIC16F628A_Relay_Timer.c,187 :: 		Lcd_Cmd(_LCD_CLEAR);       // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;PIC16F628A_Relay_Timer.c,188 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);  // Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;PIC16F628A_Relay_Timer.c,189 :: 		Lcd_Out(1,1, "PIC-based Relay");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr7_PIC16F628A_Relay_Timer+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;PIC16F628A_Relay_Timer.c,190 :: 		Lcd_Out(2,1, "Timer V1.0");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr8_PIC16F628A_Relay_Timer+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;PIC16F628A_Relay_Timer.c,192 :: 		i=0;
	CLRF       _i+0
;PIC16F628A_Relay_Timer.c,193 :: 		while(i<1){
L_main22:
	MOVLW      1
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main23
;PIC16F628A_Relay_Timer.c,194 :: 		Delay_X();
	CALL       _Delay_X+0
;PIC16F628A_Relay_Timer.c,195 :: 		i ++;
	INCF       _i+0, 1
;PIC16F628A_Relay_Timer.c,196 :: 		}
	GOTO       L_main22
L_main23:
;PIC16F628A_Relay_Timer.c,197 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;PIC16F628A_Relay_Timer.c,198 :: 		Disp_First_Row();
	CALL       _Disp_First_Row+0
;PIC16F628A_Relay_Timer.c,200 :: 		if(EEPROM_Read(8) == 1){
	MOVLW      8
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main24
;PIC16F628A_Relay_Timer.c,201 :: 		Read_tData();
	CALL       _Read_tData+0
;PIC16F628A_Relay_Timer.c,202 :: 		}
L_main24:
;PIC16F628A_Relay_Timer.c,204 :: 		Disp_Time();
	CALL       _Disp_Time+0
;PIC16F628A_Relay_Timer.c,206 :: 		do {
L_main25:
;PIC16F628A_Relay_Timer.c,208 :: 		if(!MENU_sw && !Timer_On){
	BTFSC      RA2_bit+0, BitPos(RA2_bit+0)
	GOTO       L_main30
	MOVF       _Timer_On+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main30
L__main126:
;PIC16F628A_Relay_Timer.c,209 :: 		Delay_X();
	CALL       _Delay_X+0
;PIC16F628A_Relay_Timer.c,210 :: 		if(!Get_Input){
	MOVF       _Get_Input+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main31
;PIC16F628A_Relay_Timer.c,211 :: 		Mode_SELECT = Mode_SELECT+1;
	INCF       _Mode_SELECT+0, 1
;PIC16F628A_Relay_Timer.c,212 :: 		if(Mode_SELECT > 2) Mode_SELECT=0;
	MOVF       _Mode_SELECT+0, 0
	SUBLW      2
	BTFSC      STATUS+0, 0
	GOTO       L_main32
	CLRF       _Mode_SELECT+0
L_main32:
;PIC16F628A_Relay_Timer.c,213 :: 		Disp_First_Row();
	CALL       _Disp_First_Row+0
;PIC16F628A_Relay_Timer.c,214 :: 		Disp_Time();
	CALL       _Disp_Time+0
;PIC16F628A_Relay_Timer.c,215 :: 		}
L_main31:
;PIC16F628A_Relay_Timer.c,216 :: 		if(Get_Input){
	MOVF       _Get_Input+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main33
;PIC16F628A_Relay_Timer.c,217 :: 		if(Mode_SELECT==0){  // Set OFF time
	MOVF       _Mode_SELECT+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main34
;PIC16F628A_Relay_Timer.c,218 :: 		OFF_time[Cur_Pos] ++;
	MOVF       _Cur_Pos+0, 0
	ADDLW      _OFF_Time+0
	MOVWF      R1+0
	MOVF       R1+0, 0
	MOVWF      FSR
	INCF       INDF+0, 0
	MOVWF      R0+0
	MOVF       R1+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;PIC16F628A_Relay_Timer.c,219 :: 		temp = OFF_time[Cur_Pos];
	MOVF       _Cur_Pos+0, 0
	ADDLW      _OFF_Time+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      _temp+0
;PIC16F628A_Relay_Timer.c,220 :: 		switch (Cur_Pos){
	GOTO       L_main35
;PIC16F628A_Relay_Timer.c,221 :: 		case 0: if(temp > 9) OFF_time[Cur_Pos]=0;
L_main37:
	MOVF       _temp+0, 0
	SUBLW      9
	BTFSC      STATUS+0, 0
	GOTO       L_main38
	MOVF       _Cur_Pos+0, 0
	ADDLW      _OFF_Time+0
	MOVWF      FSR
	CLRF       INDF+0
L_main38:
;PIC16F628A_Relay_Timer.c,222 :: 		break;
	GOTO       L_main36
;PIC16F628A_Relay_Timer.c,223 :: 		case 1: if(temp > 9) OFF_time[Cur_Pos]=0;
L_main39:
	MOVF       _temp+0, 0
	SUBLW      9
	BTFSC      STATUS+0, 0
	GOTO       L_main40
	MOVF       _Cur_Pos+0, 0
	ADDLW      _OFF_Time+0
	MOVWF      FSR
	CLRF       INDF+0
L_main40:
;PIC16F628A_Relay_Timer.c,224 :: 		break;
	GOTO       L_main36
;PIC16F628A_Relay_Timer.c,225 :: 		case 3: if(temp > 5) OFF_time[Cur_Pos]=0;
L_main41:
	MOVF       _temp+0, 0
	SUBLW      5
	BTFSC      STATUS+0, 0
	GOTO       L_main42
	MOVF       _Cur_Pos+0, 0
	ADDLW      _OFF_Time+0
	MOVWF      FSR
	CLRF       INDF+0
L_main42:
;PIC16F628A_Relay_Timer.c,226 :: 		break;
	GOTO       L_main36
;PIC16F628A_Relay_Timer.c,227 :: 		case 4: if(temp > 9) OFF_time[Cur_Pos]=0;
L_main43:
	MOVF       _temp+0, 0
	SUBLW      9
	BTFSC      STATUS+0, 0
	GOTO       L_main44
	MOVF       _Cur_Pos+0, 0
	ADDLW      _OFF_Time+0
	MOVWF      FSR
	CLRF       INDF+0
L_main44:
;PIC16F628A_Relay_Timer.c,228 :: 		break;
	GOTO       L_main36
;PIC16F628A_Relay_Timer.c,229 :: 		case 6: if(temp > 5) OFF_time[Cur_Pos]=0;
L_main45:
	MOVF       _temp+0, 0
	SUBLW      5
	BTFSC      STATUS+0, 0
	GOTO       L_main46
	MOVF       _Cur_Pos+0, 0
	ADDLW      _OFF_Time+0
	MOVWF      FSR
	CLRF       INDF+0
L_main46:
;PIC16F628A_Relay_Timer.c,230 :: 		break;
	GOTO       L_main36
;PIC16F628A_Relay_Timer.c,231 :: 		case 7: if(temp > 9) OFF_time[Cur_Pos]=0;
L_main47:
	MOVF       _temp+0, 0
	SUBLW      9
	BTFSC      STATUS+0, 0
	GOTO       L_main48
	MOVF       _Cur_Pos+0, 0
	ADDLW      _OFF_Time+0
	MOVWF      FSR
	CLRF       INDF+0
L_main48:
;PIC16F628A_Relay_Timer.c,232 :: 		break;
	GOTO       L_main36
;PIC16F628A_Relay_Timer.c,233 :: 		}
L_main35:
	MOVF       _Cur_Pos+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_main37
	MOVF       _Cur_Pos+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_main39
	MOVF       _Cur_Pos+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_main41
	MOVF       _Cur_Pos+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_main43
	MOVF       _Cur_Pos+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_main45
	MOVF       _Cur_Pos+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L_main47
L_main36:
;PIC16F628A_Relay_Timer.c,234 :: 		Disp_Char(HHMM_Pos+Cur_Pos, OFF_time[Cur_Pos]);
	MOVF       _Cur_Pos+0, 0
	ADDWF      _HHMM_Pos+0, 0
	MOVWF      FARG_Disp_Char_col+0
	MOVF       _Cur_Pos+0, 0
	ADDLW      _OFF_Time+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_Disp_Char_chr+0
	CALL       _Disp_Char+0
;PIC16F628A_Relay_Timer.c,236 :: 		}
L_main34:
;PIC16F628A_Relay_Timer.c,237 :: 		if(Mode_SELECT==1){    // Set ON time
	MOVF       _Mode_SELECT+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main49
;PIC16F628A_Relay_Timer.c,238 :: 		ON_time[Cur_Pos] ++;
	MOVF       _Cur_Pos+0, 0
	ADDLW      _ON_Time+0
	MOVWF      R1+0
	MOVF       R1+0, 0
	MOVWF      FSR
	INCF       INDF+0, 0
	MOVWF      R0+0
	MOVF       R1+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;PIC16F628A_Relay_Timer.c,239 :: 		temp = ON_time[Cur_Pos];
	MOVF       _Cur_Pos+0, 0
	ADDLW      _ON_Time+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      _temp+0
;PIC16F628A_Relay_Timer.c,240 :: 		switch(Cur_Pos){
	GOTO       L_main50
;PIC16F628A_Relay_Timer.c,241 :: 		case 0: if(temp > 9) ON_time[Cur_Pos]=0;
L_main52:
	MOVF       _temp+0, 0
	SUBLW      9
	BTFSC      STATUS+0, 0
	GOTO       L_main53
	MOVF       _Cur_Pos+0, 0
	ADDLW      _ON_Time+0
	MOVWF      FSR
	CLRF       INDF+0
L_main53:
;PIC16F628A_Relay_Timer.c,242 :: 		break;
	GOTO       L_main51
;PIC16F628A_Relay_Timer.c,243 :: 		case 1: if(temp > 9) ON_time[Cur_Pos]=0;
L_main54:
	MOVF       _temp+0, 0
	SUBLW      9
	BTFSC      STATUS+0, 0
	GOTO       L_main55
	MOVF       _Cur_Pos+0, 0
	ADDLW      _ON_Time+0
	MOVWF      FSR
	CLRF       INDF+0
L_main55:
;PIC16F628A_Relay_Timer.c,244 :: 		break;
	GOTO       L_main51
;PIC16F628A_Relay_Timer.c,245 :: 		case 3: if(temp > 5) ON_time[Cur_Pos]=0;
L_main56:
	MOVF       _temp+0, 0
	SUBLW      5
	BTFSC      STATUS+0, 0
	GOTO       L_main57
	MOVF       _Cur_Pos+0, 0
	ADDLW      _ON_Time+0
	MOVWF      FSR
	CLRF       INDF+0
L_main57:
;PIC16F628A_Relay_Timer.c,246 :: 		break;
	GOTO       L_main51
;PIC16F628A_Relay_Timer.c,247 :: 		case 4: if(temp > 9) ON_time[Cur_Pos]=0;
L_main58:
	MOVF       _temp+0, 0
	SUBLW      9
	BTFSC      STATUS+0, 0
	GOTO       L_main59
	MOVF       _Cur_Pos+0, 0
	ADDLW      _ON_Time+0
	MOVWF      FSR
	CLRF       INDF+0
L_main59:
;PIC16F628A_Relay_Timer.c,248 :: 		break;
	GOTO       L_main51
;PIC16F628A_Relay_Timer.c,249 :: 		}
L_main50:
	MOVF       _Cur_Pos+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_main52
	MOVF       _Cur_Pos+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_main54
	MOVF       _Cur_Pos+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_main56
	MOVF       _Cur_Pos+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_main58
L_main51:
;PIC16F628A_Relay_Timer.c,250 :: 		Disp_Char(HHMM_Pos+Cur_Pos, ON_time[Cur_Pos]);
	MOVF       _Cur_Pos+0, 0
	ADDWF      _HHMM_Pos+0, 0
	MOVWF      FARG_Disp_Char_col+0
	MOVF       _Cur_Pos+0, 0
	ADDLW      _ON_Time+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_Disp_Char_chr+0
	CALL       _Disp_Char+0
;PIC16F628A_Relay_Timer.c,251 :: 		}
L_main49:
;PIC16F628A_Relay_Timer.c,253 :: 		if(Mode_SELECT==2){   // Set cyclic option
	MOVF       _Mode_SELECT+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_main60
;PIC16F628A_Relay_Timer.c,254 :: 		Repeat_Cycle ++;
	INCF       _Repeat_Cycle+0, 1
;PIC16F628A_Relay_Timer.c,255 :: 		if(Repeat_Cycle > 1) Repeat_Cycle=0;
	MOVF       _Repeat_Cycle+0, 0
	SUBLW      1
	BTFSC      STATUS+0, 0
	GOTO       L_main61
	CLRF       _Repeat_Cycle+0
L_main61:
;PIC16F628A_Relay_Timer.c,256 :: 		Disp_Char(8, Repeat_Cycle);
	MOVLW      8
	MOVWF      FARG_Disp_Char_col+0
	MOVF       _Repeat_Cycle+0, 0
	MOVWF      FARG_Disp_Char_chr+0
	CALL       _Disp_Char+0
;PIC16F628A_Relay_Timer.c,257 :: 		}
L_main60:
;PIC16F628A_Relay_Timer.c,258 :: 		Lcd_Cmd(_LCD_MOVE_CURSOR_LEFT);
	MOVLW      16
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;PIC16F628A_Relay_Timer.c,259 :: 		}
L_main33:
;PIC16F628A_Relay_Timer.c,260 :: 		}   // END if(!Menu_sw)
L_main30:
;PIC16F628A_Relay_Timer.c,263 :: 		if(!SELECT_sw && !Timer_On){
	BTFSC      RA3_bit+0, BitPos(RA3_bit+0)
	GOTO       L_main64
	MOVF       _Timer_On+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main64
L__main125:
;PIC16F628A_Relay_Timer.c,264 :: 		Delay_X();
	CALL       _Delay_X+0
;PIC16F628A_Relay_Timer.c,265 :: 		Get_Input = 1;
	MOVLW      1
	MOVWF      _Get_Input+0
;PIC16F628A_Relay_Timer.c,266 :: 		if(Mode_SELECT < 2) {
	MOVLW      2
	SUBWF      _Mode_SELECT+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main65
;PIC16F628A_Relay_Timer.c,267 :: 		if(Cur_On) {
	MOVF       _Cur_On+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main66
;PIC16F628A_Relay_Timer.c,268 :: 		Cur_Pos ++;
	INCF       _Cur_Pos+0, 1
;PIC16F628A_Relay_Timer.c,269 :: 		if (Cur_Pos == 2) {
	MOVF       _Cur_Pos+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_main67
;PIC16F628A_Relay_Timer.c,270 :: 		Lcd_Cmd(_LCD_MOVE_CURSOR_RIGHT);
	MOVLW      20
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;PIC16F628A_Relay_Timer.c,271 :: 		Cur_Pos ++;
	INCF       _Cur_Pos+0, 1
;PIC16F628A_Relay_Timer.c,272 :: 		}
L_main67:
;PIC16F628A_Relay_Timer.c,273 :: 		if(Cur_Pos > 4) {
	MOVF       _Cur_Pos+0, 0
	SUBLW      4
	BTFSC      STATUS+0, 0
	GOTO       L_main68
;PIC16F628A_Relay_Timer.c,274 :: 		Lcd_Cmd(_LCD_MOVE_CURSOR_RIGHT);
	MOVLW      20
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;PIC16F628A_Relay_Timer.c,275 :: 		Cur_Pos = 0;
	CLRF       _Cur_Pos+0
;PIC16F628A_Relay_Timer.c,276 :: 		cursor_left();
	CALL       _cursor_left+0
;PIC16F628A_Relay_Timer.c,277 :: 		}
	GOTO       L_main69
L_main68:
;PIC16F628A_Relay_Timer.c,278 :: 		else Lcd_Cmd(_LCD_MOVE_CURSOR_RIGHT);
	MOVLW      20
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
L_main69:
;PIC16F628A_Relay_Timer.c,279 :: 		}
L_main66:
;PIC16F628A_Relay_Timer.c,280 :: 		if(!Cur_On) {
	MOVF       _Cur_On+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main70
;PIC16F628A_Relay_Timer.c,281 :: 		Cur_On = 1;
	MOVLW      1
	MOVWF      _Cur_On+0
;PIC16F628A_Relay_Timer.c,282 :: 		cursor_left();
	CALL       _cursor_left+0
;PIC16F628A_Relay_Timer.c,283 :: 		Lcd_Cmd(_LCD_UNDERLINE_ON);
	MOVLW      14
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;PIC16F628A_Relay_Timer.c,284 :: 		}
L_main70:
;PIC16F628A_Relay_Timer.c,285 :: 		}
	GOTO       L_main71
L_main65:
;PIC16F628A_Relay_Timer.c,287 :: 		if(!Cur_On) {
	MOVF       _Cur_On+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main72
;PIC16F628A_Relay_Timer.c,288 :: 		Cur_On = 1;
	MOVLW      1
	MOVWF      _Cur_On+0
;PIC16F628A_Relay_Timer.c,289 :: 		for(j=0; j<7; j++){
	CLRF       _j+0
L_main73:
	MOVLW      7
	SUBWF      _j+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main74
;PIC16F628A_Relay_Timer.c,290 :: 		Lcd_Cmd(_LCD_MOVE_CURSOR_LEFT);
	MOVLW      16
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;PIC16F628A_Relay_Timer.c,289 :: 		for(j=0; j<7; j++){
	INCF       _j+0, 1
;PIC16F628A_Relay_Timer.c,291 :: 		}
	GOTO       L_main73
L_main74:
;PIC16F628A_Relay_Timer.c,292 :: 		Lcd_Cmd(_LCD_UNDERLINE_ON);
	MOVLW      14
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;PIC16F628A_Relay_Timer.c,293 :: 		}
L_main72:
;PIC16F628A_Relay_Timer.c,294 :: 		}
L_main71:
;PIC16F628A_Relay_Timer.c,296 :: 		}   //   if(!SELECT_sw && !Timer_On) ends here
L_main64:
;PIC16F628A_Relay_Timer.c,298 :: 		if(!ENTER_sw && Get_Input){
	BTFSC      RA4_bit+0, BitPos(RA4_bit+0)
	GOTO       L_main78
	MOVF       _Get_Input+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main78
L__main124:
;PIC16F628A_Relay_Timer.c,299 :: 		Delay_X();
	CALL       _Delay_X+0
;PIC16F628A_Relay_Timer.c,300 :: 		Get_Input = 0;
	CLRF       _Get_Input+0
;PIC16F628A_Relay_Timer.c,301 :: 		Cur_On = 0;
	CLRF       _Cur_On+0
;PIC16F628A_Relay_Timer.c,302 :: 		Cur_Pos = 0;
	CLRF       _Cur_Pos+0
;PIC16F628A_Relay_Timer.c,303 :: 		Disp_Time();
	CALL       _Disp_Time+0
;PIC16F628A_Relay_Timer.c,304 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);  // Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;PIC16F628A_Relay_Timer.c,305 :: 		}
L_main78:
;PIC16F628A_Relay_Timer.c,307 :: 		if (!START_sw && !Get_Input){
	BTFSC      RB0_bit+0, BitPos(RB0_bit+0)
	GOTO       L_main81
	MOVF       _Get_Input+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main81
L__main123:
;PIC16F628A_Relay_Timer.c,308 :: 		Delay_X();
	CALL       _Delay_X+0
;PIC16F628A_Relay_Timer.c,310 :: 		switch(Timer_On){
	GOTO       L_main82
;PIC16F628A_Relay_Timer.c,311 :: 		case 0: play_sound();
L_main84:
	CALL       _play_sound+0
;PIC16F628A_Relay_Timer.c,312 :: 		Timer_On = 1;
	MOVLW      1
	MOVWF      _Timer_On+0
;PIC16F628A_Relay_Timer.c,313 :: 		Disp_First_Row();
	CALL       _Disp_First_Row+0
;PIC16F628A_Relay_Timer.c,314 :: 		OPTION_REG = 0x07; // Prescaler (1:256) is assigned to the timer TMR0
	MOVLW      7
	MOVWF      OPTION_REG+0
;PIC16F628A_Relay_Timer.c,315 :: 		TMR0 = 39;          // Timer T0 counts from 39 to 255
	MOVLW      39
	MOVWF      TMR0+0
;PIC16F628A_Relay_Timer.c,316 :: 		INTCON = 0xA0;     // Enable interrupt TMR0 and Global Interrupts
	MOVLW      160
	MOVWF      INTCON+0
;PIC16F628A_Relay_Timer.c,317 :: 		INTCON.T0IF = 0;
	BCF        INTCON+0, 2
;PIC16F628A_Relay_Timer.c,318 :: 		Mode_SELECT = 0;
	CLRF       _Mode_SELECT+0
;PIC16F628A_Relay_Timer.c,319 :: 		Blink = 0;
	CLRF       _Blink+0
;PIC16F628A_Relay_Timer.c,320 :: 		Disp_Time();
	CALL       _Disp_Time+0
;PIC16F628A_Relay_Timer.c,321 :: 		Store_tData();
	CALL       _Store_tData+0
;PIC16F628A_Relay_Timer.c,322 :: 		break;
	GOTO       L_main83
;PIC16F628A_Relay_Timer.c,323 :: 		case 1: disable_timer();
L_main85:
	CALL       _disable_timer+0
;PIC16F628A_Relay_Timer.c,324 :: 		break;
	GOTO       L_main83
;PIC16F628A_Relay_Timer.c,325 :: 		}
L_main82:
	MOVF       _Timer_On+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_main84
	MOVF       _Timer_On+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_main85
L_main83:
;PIC16F628A_Relay_Timer.c,326 :: 		}
L_main81:
;PIC16F628A_Relay_Timer.c,328 :: 		if(Timer_On){
	MOVF       _Timer_On+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main86
;PIC16F628A_Relay_Timer.c,329 :: 		OFF_HH = OFF_Time[0]*10 + OFF_Time[1];
	MOVF       _OFF_Time+0, 0
	MOVWF      R0+0
	MOVLW      10
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVF       _OFF_Time+1, 0
	ADDWF      R0+0, 0
	MOVWF      _OFF_HH+0
;PIC16F628A_Relay_Timer.c,330 :: 		OFF_MM = OFF_Time[3]*10 + OFF_Time[4];
	MOVF       _OFF_Time+3, 0
	MOVWF      R0+0
	MOVLW      10
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVF       _OFF_Time+4, 0
	ADDWF      R0+0, 0
	MOVWF      _OFF_MM+0
;PIC16F628A_Relay_Timer.c,331 :: 		ON_HH = ON_Time[0]*10 + ON_Time[1];
	MOVF       _ON_Time+0, 0
	MOVWF      R0+0
	MOVLW      10
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVF       _ON_Time+1, 0
	ADDWF      R0+0, 0
	MOVWF      _ON_HH+0
;PIC16F628A_Relay_Timer.c,332 :: 		ON_MM = ON_Time[3]*10 + ON_Time[4];
	MOVF       _ON_Time+3, 0
	MOVWF      R0+0
	MOVLW      10
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVF       _ON_Time+4, 0
	ADDWF      R0+0, 0
	MOVWF      _ON_MM+0
;PIC16F628A_Relay_Timer.c,333 :: 		switch(Blink){
	GOTO       L_main87
;PIC16F628A_Relay_Timer.c,334 :: 		case 0: Lcd_Chr(2,HHMM_Pos+2,' ');
L_main89:
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      2
	ADDWF      _HHMM_Pos+0, 0
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      32
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;PIC16F628A_Relay_Timer.c,335 :: 		break;
	GOTO       L_main88
;PIC16F628A_Relay_Timer.c,336 :: 		case 255: Lcd_Chr(2,HHMM_Pos+2,':');
L_main90:
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      2
	ADDWF      _HHMM_Pos+0, 0
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      58
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;PIC16F628A_Relay_Timer.c,337 :: 		break;
	GOTO       L_main88
;PIC16F628A_Relay_Timer.c,338 :: 		}
L_main87:
	MOVF       _Blink+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_main89
	MOVF       _Blink+0, 0
	XORLW      255
	BTFSC      STATUS+0, 2
	GOTO       L_main90
L_main88:
;PIC16F628A_Relay_Timer.c,340 :: 		if(!OFF_HH && !OFF_MM &&!RelaySW){
	MOVF       _OFF_HH+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main93
	MOVF       _OFF_MM+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main93
	BTFSC      RB3_bit+0, BitPos(RB3_bit+0)
	GOTO       L_main93
L__main122:
;PIC16F628A_Relay_Timer.c,341 :: 		if(ON_HH || ON_MM){
	MOVF       _ON_HH+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main121
	MOVF       _ON_MM+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main121
	GOTO       L_main96
L__main121:
;PIC16F628A_Relay_Timer.c,342 :: 		RelaySW = 1;
	BSF        RB3_bit+0, BitPos(RB3_bit+0)
;PIC16F628A_Relay_Timer.c,343 :: 		Mode_SELECT = 1;
	MOVLW      1
	MOVWF      _Mode_SELECT+0
;PIC16F628A_Relay_Timer.c,344 :: 		Disp_First_Row();
	CALL       _Disp_First_Row+0
;PIC16F628A_Relay_Timer.c,345 :: 		Disp_Time();
	CALL       _Disp_Time+0
;PIC16F628A_Relay_Timer.c,346 :: 		play_sound();
	CALL       _play_sound+0
;PIC16F628A_Relay_Timer.c,347 :: 		}
	GOTO       L_main97
L_main96:
;PIC16F628A_Relay_Timer.c,350 :: 		disable_timer();
	CALL       _disable_timer+0
;PIC16F628A_Relay_Timer.c,351 :: 		}
L_main97:
;PIC16F628A_Relay_Timer.c,352 :: 		}
L_main93:
;PIC16F628A_Relay_Timer.c,354 :: 		if(!ON_HH && !ON_MM && RelaySW){
	MOVF       _ON_HH+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main100
	MOVF       _ON_MM+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main100
	BTFSS      RB3_bit+0, BitPos(RB3_bit+0)
	GOTO       L_main100
L__main120:
;PIC16F628A_Relay_Timer.c,355 :: 		if(Repeat_Cycle ==1){
	MOVF       _Repeat_Cycle+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main101
;PIC16F628A_Relay_Timer.c,356 :: 		RelaySW = 0;
	BCF        RB3_bit+0, BitPos(RB3_bit+0)
;PIC16F628A_Relay_Timer.c,357 :: 		Read_tData();
	CALL       _Read_tData+0
;PIC16F628A_Relay_Timer.c,358 :: 		Mode_SELECT = 0;
	CLRF       _Mode_SELECT+0
;PIC16F628A_Relay_Timer.c,359 :: 		Disp_First_Row();
	CALL       _Disp_First_Row+0
;PIC16F628A_Relay_Timer.c,360 :: 		Disp_Time();
	CALL       _Disp_Time+0
;PIC16F628A_Relay_Timer.c,361 :: 		play_sound();
	CALL       _play_sound+0
;PIC16F628A_Relay_Timer.c,362 :: 		}
	GOTO       L_main102
L_main101:
;PIC16F628A_Relay_Timer.c,364 :: 		disable_timer();
	CALL       _disable_timer+0
;PIC16F628A_Relay_Timer.c,365 :: 		play_sound();
	CALL       _play_sound+0
;PIC16F628A_Relay_Timer.c,366 :: 		}
L_main102:
;PIC16F628A_Relay_Timer.c,368 :: 		}
L_main100:
;PIC16F628A_Relay_Timer.c,370 :: 		if(ChangeMin) {
	MOVF       _ChangeMin+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main103
;PIC16F628A_Relay_Timer.c,371 :: 		switch(Mode_SELECT){
	GOTO       L_main104
;PIC16F628A_Relay_Timer.c,372 :: 		case 0: if(OFF_MM == 0 && OFF_HH>0){
L_main106:
	MOVF       _OFF_MM+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main109
	MOVF       _OFF_HH+0, 0
	SUBLW      0
	BTFSC      STATUS+0, 0
	GOTO       L_main109
L__main119:
;PIC16F628A_Relay_Timer.c,373 :: 		OFF_MM = 59;
	MOVLW      59
	MOVWF      _OFF_MM+0
;PIC16F628A_Relay_Timer.c,374 :: 		OFF_HH -- ;
	DECF       _OFF_HH+0, 1
;PIC16F628A_Relay_Timer.c,375 :: 		}
	GOTO       L_main110
L_main109:
;PIC16F628A_Relay_Timer.c,376 :: 		else if (OFF_MM >>0) OFF_MM --;
	MOVF       _OFF_MM+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main111
	DECF       _OFF_MM+0, 1
L_main111:
L_main110:
;PIC16F628A_Relay_Timer.c,377 :: 		OFF_Time[0] = OFF_HH/10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _OFF_HH+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R0+0, 0
	MOVWF      _OFF_Time+0
;PIC16F628A_Relay_Timer.c,378 :: 		OFF_Time[1] = OFF_HH%10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _OFF_HH+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      _OFF_Time+1
;PIC16F628A_Relay_Timer.c,379 :: 		OFF_Time[3] = OFF_MM/10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _OFF_MM+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R0+0, 0
	MOVWF      _OFF_Time+3
;PIC16F628A_Relay_Timer.c,380 :: 		OFF_Time[4] = OFF_MM%10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _OFF_MM+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      _OFF_Time+4
;PIC16F628A_Relay_Timer.c,381 :: 		break;
	GOTO       L_main105
;PIC16F628A_Relay_Timer.c,383 :: 		case 1: if(ON_MM == 0 && ON_HH>0){
L_main112:
	MOVF       _ON_MM+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main115
	MOVF       _ON_HH+0, 0
	SUBLW      0
	BTFSC      STATUS+0, 0
	GOTO       L_main115
L__main118:
;PIC16F628A_Relay_Timer.c,384 :: 		ON_MM = 59;
	MOVLW      59
	MOVWF      _ON_MM+0
;PIC16F628A_Relay_Timer.c,385 :: 		ON_HH -- ;
	DECF       _ON_HH+0, 1
;PIC16F628A_Relay_Timer.c,386 :: 		}
	GOTO       L_main116
L_main115:
;PIC16F628A_Relay_Timer.c,387 :: 		else if(ON_MM >> 0) ON_MM --;
	MOVF       _ON_MM+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main117
	DECF       _ON_MM+0, 1
L_main117:
L_main116:
;PIC16F628A_Relay_Timer.c,388 :: 		ON_Time[0] = ON_HH/10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _ON_HH+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R0+0, 0
	MOVWF      _ON_Time+0
;PIC16F628A_Relay_Timer.c,389 :: 		ON_Time[1] = ON_HH%10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _ON_HH+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      _ON_Time+1
;PIC16F628A_Relay_Timer.c,390 :: 		ON_Time[3] = ON_MM/10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _ON_MM+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R0+0, 0
	MOVWF      _ON_Time+3
;PIC16F628A_Relay_Timer.c,391 :: 		ON_Time[4] = ON_MM%10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _ON_MM+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      _ON_Time+4
;PIC16F628A_Relay_Timer.c,392 :: 		break;
	GOTO       L_main105
;PIC16F628A_Relay_Timer.c,393 :: 		}
L_main104:
	MOVF       _Mode_SELECT+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_main106
	MOVF       _Mode_SELECT+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_main112
L_main105:
;PIC16F628A_Relay_Timer.c,394 :: 		ChangeMin = 0;
	CLRF       _ChangeMin+0
;PIC16F628A_Relay_Timer.c,395 :: 		Disp_Time();
	CALL       _Disp_Time+0
;PIC16F628A_Relay_Timer.c,396 :: 		}
L_main103:
;PIC16F628A_Relay_Timer.c,398 :: 		}
L_main86:
;PIC16F628A_Relay_Timer.c,401 :: 		}while(1);
	GOTO       L_main25
;PIC16F628A_Relay_Timer.c,402 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
