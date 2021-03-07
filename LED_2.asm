
_delay_ms:

;LED_2.c,14 :: 		unsigned int delay_ms(unsigned long ms) {
;LED_2.c,16 :: 		for(a=0; a<65000; a++)
	CLRF       R4+0
	CLRF       R4+1
	CLRF       R4+2
	CLRF       R4+3
L_delay_ms0:
	MOVLW      128
	XORWF      R4+3, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__delay_ms11
	MOVLW      0
	SUBWF      R4+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__delay_ms11
	MOVLW      253
	SUBWF      R4+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__delay_ms11
	MOVLW      232
	SUBWF      R4+0, 0
L__delay_ms11:
	BTFSC      STATUS+0, 0
	GOTO       L_delay_ms1
;LED_2.c,17 :: 		for(b=0; b<ms; b++)
	CLRF       R8+0
	CLRF       R8+1
	CLRF       R8+2
	CLRF       R8+3
L_delay_ms3:
	MOVF       FARG_delay_ms_ms+3, 0
	SUBWF      R8+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L__delay_ms12
	MOVF       FARG_delay_ms_ms+2, 0
	SUBWF      R8+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__delay_ms12
	MOVF       FARG_delay_ms_ms+1, 0
	SUBWF      R8+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__delay_ms12
	MOVF       FARG_delay_ms_ms+0, 0
	SUBWF      R8+0, 0
L__delay_ms12:
	BTFSC      STATUS+0, 0
	GOTO       L_delay_ms4
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R8+2, 0
	MOVWF      R0+2
	MOVF       R8+3, 0
	MOVWF      R0+3
	INCF       R0+0, 1
	BTFSC      STATUS+0, 2
	INCF       R0+1, 1
	BTFSC      STATUS+0, 2
	INCF       R0+2, 1
	BTFSC      STATUS+0, 2
	INCF       R0+3, 1
	MOVF       R0+0, 0
	MOVWF      R8+0
	MOVF       R0+1, 0
	MOVWF      R8+1
	MOVF       R0+2, 0
	MOVWF      R8+2
	MOVF       R0+3, 0
	MOVWF      R8+3
;LED_2.c,18 :: 		;
	GOTO       L_delay_ms3
L_delay_ms4:
;LED_2.c,16 :: 		for(a=0; a<65000; a++)
	MOVF       R4+0, 0
	MOVWF      R0+0
	MOVF       R4+1, 0
	MOVWF      R0+1
	MOVF       R4+2, 0
	MOVWF      R0+2
	MOVF       R4+3, 0
	MOVWF      R0+3
	INCF       R0+0, 1
	BTFSC      STATUS+0, 2
	INCF       R0+1, 1
	BTFSC      STATUS+0, 2
	INCF       R0+2, 1
	BTFSC      STATUS+0, 2
	INCF       R0+3, 1
	MOVF       R0+0, 0
	MOVWF      R4+0
	MOVF       R0+1, 0
	MOVWF      R4+1
	MOVF       R0+2, 0
	MOVWF      R4+2
	MOVF       R0+3, 0
	MOVWF      R4+3
;LED_2.c,18 :: 		;
	GOTO       L_delay_ms0
L_delay_ms1:
;LED_2.c,19 :: 		return (unsigned int)ms;
	MOVF       FARG_delay_ms_ms+0, 0
	MOVWF      R0+0
	MOVF       FARG_delay_ms_ms+1, 0
	MOVWF      R0+1
;LED_2.c,20 :: 		}
L_end_delay_ms:
	RETURN
; end of _delay_ms

_main:

;LED_2.c,22 :: 		void main() {
;LED_2.c,23 :: 		ANSEL_  = 0;
	CLRF       392
;LED_2.c,24 :: 		TRIS    = 0;
	CLRF       134
;LED_2.c,26 :: 		while(1) {
L_main6:
;LED_2.c,27 :: 		PORT  = 0x01;
	MOVLW      1
	MOVWF      6
;LED_2.c,28 :: 		Delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main8:
	DECFSZ     R13+0, 1
	GOTO       L_main8
	DECFSZ     R12+0, 1
	GOTO       L_main8
	DECFSZ     R11+0, 1
	GOTO       L_main8
	NOP
	NOP
;LED_2.c,29 :: 		PORT  = 0x00;
	CLRF       6
;LED_2.c,30 :: 		Delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main9:
	DECFSZ     R13+0, 1
	GOTO       L_main9
	DECFSZ     R12+0, 1
	GOTO       L_main9
	DECFSZ     R11+0, 1
	GOTO       L_main9
	NOP
	NOP
;LED_2.c,31 :: 		}
	GOTO       L_main6
;LED_2.c,32 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
