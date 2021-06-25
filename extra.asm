/*-----------------------------------------------------------------
**
**  Fichero:
**    Extra.asm  27/4/2021
**
**    Fundamentos de Computadores
**    Dpto. de Arquitectura de Computadores y Automática
**    Facultad de Informática. Universidad Complutense de Madrid
**
**
**  Notas de diseño:
**    Codificar el prólogo y epílogo de las subrutinas
**
**---------------------------------------------------------------*/

.global start

.EQU 	N, 8
.EQU 	K1, 2
.EQU	K2, 1

.data
A: 		.word 0,2,4,6,8,10,12,14

.bss
Aux: 		.space N*4
B:	 	.space N*4
Sum: 		.space 4

.text
start:		ldr r0, =A
		mov r1, #N
		mov r2, #K1
		mov r3, #K2
		ldr r8, =Aux
		push {r8}
		bl FillAux
		add sp, sp, #4
		ldr r0, =A
		ldr r1, =Aux
		mov r2, #N
		ldr r3, =B
		bl FillB
		ldr r1, =Sum
		str r0, [r1]
		b .

FillAux:		push {r4-r6}
		ldr r4, [sp, #12]
		mov r5, #0
bucle1:		cmp r5, r1
		bge finAux
		ldr r6, [r0, r5, lsl #2]
		add r6, r6, r2
		lsr r6, r6, r3
		str r6, [r4, r5, lsl #2]
		add r5, r5, #1
		b bucle1
finAux:		pop {r4-r6}
		mov pc, lr

FillB:		push {r4-r6, lr}
		mov r4,#0
		mov r6,#0
bucle3: 		cmp r4, r2
		bge finB
		push {r0-r3}
		ldr r0, [r0, r4, lsl #2]
		ldr r1, [r1, r4, lsl #2]
		bl absresta
		mov r5, r0
		pop {r0-r3}
		str r5, [r3, r4, lsl #2]
		add r6, r6, r5
		add r4, r4, #1
		b bucle3
finB:		mov r0,r6
		pop {r4-r6, lr}
		mov pc, lr

absresta:		sub r2, r0, r1
		cmp r2,#0
		bge fin_sub
		mov r3,r2
		rsb r2,r3,#0
fin_sub:		mov r0, r2
		mov pc, lr
		.end