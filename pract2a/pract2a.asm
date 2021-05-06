/*-----------------------------------------------------------------
**
**  Fichero:
**    pract2a.asm  10/6/2014
**
**    Fundamentos de Computadores
**    Dpto. de Arquitectura de Computadores y Automática
**    Facultad de Informática. Universidad Complutense de Madrid
**
**  Propósito:
**    Busca el valor máximo de un vector de enteros positivos
**
**  Notas de diseño:
**
**---------------------------------------------------------------*/

.global start

.EQU 	N, 5

.data
A: 		.word 1,2,3,4,5

.bss
max: 	.space 4

.text
start:
		mov r0, #0
		ldr r1,=max		@Leo la dir. de max
		str r0,[r1]		@Escribo 0 en max
		@Terminar de codificar
		ldr r2, =A		@Guardamos la direccion de inicio del vector
		mov r3,#0		@indice del vector
for:	cmp r3,#N
		bge end_for
		ldr r4, [r2,r3,lsl #2]
		ldr r0,[r1]		@guardamos max
		add r3,r3,#1	@i++
		cmp r4,r0
		ble for
		str r4,[r1]		@actualizamos max
		b for
end_for:
end:	b .
		.end
