TMR0		EQU	1
STATUS		EQU	3
PORTA		EQU	5
PORTB		EQU	6
TRISA		EQU	85H
TRISB		EQU	86H
OPTION_R	EQU	81H
ZEROBIT 	EQU 	2
CARRYBIT 	EQU 	0
COUNT 		EQU 	0CH

LIST P=16f84a
ORG 0
GOTO START



;**************************************************************
__CONFIG H'3FF0'

;**************************************************************
; SUBROUTINE

DELAY5		CLRF	TMR0
LOOPA		MOVF	TMR0,W
		SUBLW	.160
		BTFSS	STATUS,ZEROBIT
		GOTO	LOOPA
		RETLW	0

;***************************************************************

START		BSF	STATUS,5
		MOVLW	B'00011111'
		MOVWF	TRISA
		
		MOVLW	B'00000000'
		MOVWF	TRISB
		
		MOVLW	B'00000111'
		MOVWF	OPTION_R

		BCF	STATUS,5
		CLRF	PORTA
		CLRF	PORTB

;***************************************************************

BEGIN		MOVLW	B'00100100'
		MOVWF	PORTB
		

SW1		BTFSC	PORTA,0
		GOTO	SW2
		CALL	DELAY5
		GOTO	DISPLAY
		

SW2		BTFSC	PORTA,1
		GOTO	SW1
		CALL 	DELAY5
		GOTO	DISPLAY
		

DISPLAY		MOVLW	B'00010010'
		MOVWF	PORTB
		CALL 	DELAY5


		MOVLW	B'11001001'
		MOVWF	PORTB
		CALL 	DELAY5
		CALL 	DELAY5

		MOVLW	B'11010010'
		MOVWF	PORTB
		CALL 	DELAY5
		

		MOVLW	B'00100100'
		MOVWF	PORTB
		CALL 	DELAY5
		
END	 