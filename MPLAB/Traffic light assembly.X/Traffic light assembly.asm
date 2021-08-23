

; PIC16F877A Configuration Bit Settings

; Assembly source line config statements

#include "p16f877a.inc"

; CONFIG
; __config 0xFFFF
 __CONFIG _FOSC_EXTRC & _WDTE_ON & _PWRTE_OFF & _BOREN_ON & _LVP_ON & _CPD_OFF & _WRT_OFF & _CP_OFF
STATUS  equ 03h
PORTD   equ 08h
TRISD   equ 88h
COUNTER equ 20h
counter1 equ 0x0C
counter2 equ 0x0D
        org 00h
        clrw
        BCF    STATUS,05
        BCF    STATUS,06
        CLRF   PORTD
        BSF    STATUS, 05
        MOVLW  0x00 
        MOVWF  TRISD
        BCF    STATUS, 05

START    MOVLW   0x02
         MOVWF   PORTD
	 call    long_delay
	 MOVLW   0x04
         MOVWF   PORTD
	 call    long_delay
	 MOVLW   0x08
         MOVWF   PORTD
	 call    short_delay

         GOTO    START
;delay  
long_delay MOVLW d'40'
	   MOVWF counter1
dec_2      MOVLW d'255'
	   MOVWF counter2
dec_1      DECFSZ  counter2,1
	   goto  dec_1
	   DECFSZ  counter1,1
	   goto  dec_2
	   return
short_delay MOVLW d'10'
	   MOVWF counter1
dec_4      MOVLW d'255'
	   MOVWF counter2
dec_3      DECFSZ  counter2,1
	   goto  dec_3
	   DECFSZ  counter1,1
	   goto  dec_4
	   return
         
END








