

.EQU INPUT = 0x9A
.EQU OUTPUT_100 = 0x41
.EQU OUTPUT_10 = 0x42
.EQU OUTPUT_1 = 0x43
.EQU DIVISOR_100 = 0x64
.EQU DIVISOR_10 = 0x0A

.CSEG
.ORG 0x01

IN R0, INPUT
MOV R1, 0x00
MOV R2, 0x00
MOV R3, 0x00
MOV R4, 0x00
MOV R5, 0x00
BRN MAIN

DIVIDE_100: 

CMP R0, DIVISOR_100
BRCS UNDERFLOW
SUB R0, DIVISOR_100
ADD R1, 0x01
CMP R0, DIVISOR_100
BRCC DIVIDE_100
RET

DIVIDE_10: 

CMP R0, DIVISOR_10
BRCS UNDERFLOW
SUB R0, DIVISOR_10
ADD R2, 0x01
CMP R0, DIVISOR_10
BRCC DIVIDE_10
RET

UNDERFLOW: 

RET

MAIN:

CALL DIVIDE_100 
MOV R3, R1
CALL DIVIDE_10
MOV R4, R2
MOV R5, R0
BRN OUTPUT

OUTPUT:

OUT R3, OUTPUT_100
OUT R4, OUTPUT_10
OUT R5, OUTPUT_1







