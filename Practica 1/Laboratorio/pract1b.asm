/*-----------------------------------------------------------------
**
**  Fichero:
**    pract1b.asm  10/6/2014
**
**    Fundamentos de Computadores
**    Dpto. de Arquitectura de Computadores y Automática
**    Facultad de Informática. Universidad Complutense de Madrid
**
**  Propósito:
**    Divide 2 números mediante el algoritmo de restas parciales
**
**  Notas de diseño:
**
**---------------------------------------------------------------*/

.global start

.data
@ Terminar de codificar
A:		.word 0x0A			@A = 10
B:		.word 0x03			@B = 3
.bss
@ Terminar de codificar
C:		.space 4
.text
start:
		@ Terminar de codificar
			MOV R0,#0		@Variable C
			LDR R1,=C		@Diraccion de la variable C
			LDR R2,=A		@Diraccion de la variable A
			LDR R3,=B		@Diraccion de la variable B
			LDR R4,[R2]		@Variable A
			LDR R5,[R3]		@Variable B
while:		CMP R4,R5		@comparamos A y B
			BLT end_while	@si A<B, salimos del bucle
			SUB R4,R4,R5	@A = A - B
			ADD R0,R0,#1	@C = C + 1
			B while			@Volvemos a la comparacion
end_while:	STR R0,[R1]		@Guardamos C en su diereccion
END:		B .
			.end
