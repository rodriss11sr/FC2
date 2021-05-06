/*-----------------------------------------------------------------
**
**  Fichero:
**    pract2b.asm  10/6/2014
**
**    Fundamentos de Computadores
**    Dpto. de Arquitectura de Computadores y Automática
**    Facultad de Informática. Universidad Complutense de Madrid
**
**  Propósito:
**    Ordena de mayor a menor un vector de enteros positivos
**
**  Notas de diseño:
**
**---------------------------------------------------------------*/

.EQU 	N, 8

.global start

.data
A: 		.word 7,3,25,4,75,2,1,1

.bss
B: 		.space N*4
max: 	.space 4
ind: 	.space 4

.text
start:
		@ Terminar de codificar
MOV R0, #0 // j
MOV R1, #0 // i
LDR R2, =A
LDR R3, =B
LDR R4, =max
LDR R5, =ind
LDR R10, [R5]

for_j:	CMP R0, #N
		BGE end
		MOV R7, #300
		STR R7, [R4]
for_i:	CMP R1, #N
		BGE continue_for_i
		LDR R6, [R2, R1, LSL#2]
		CMP R6, R7
		BGE end_if
		CMP R6, #20
		BGT end_if
		#AND R8, R6, #0x1
		#CMP R8, #0
		#BEQ end_if
		MOV R7, R6
		MOV R10, R1
		STR R7, [R4]
		STR R10, [R5]
end_if:	ADD R1, R1, #1
		B for_i
continue_for_i:	STR R7, [R3, R0, LSL#2]
		MOV R1, #300
		STR R1, [R2, R10, LSL#2]
		MOV R1, #0
		ADD R0, R0, #1
		B for_j
end:	B .
		.end
