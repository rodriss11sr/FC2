/*-----------------------------------------------------------------
**
**  Fichero:
**    pract2a.asm  10/6/2014
**
**    Fundamentos de Computadores
**    Dpto. de Arquitectura de Computadores y Autom�tica
**    Facultad de Inform�tica. Universidad Complutense de Madrid
**
**  Prop�sito:
**    Busca el valor m�ximo de un vector de enteros positivos
**
**  Notas de dise�o:
**
**---------------------------------------------------------------*/

.global start

.EQU 	N, 8

.data
A: 		.word 7,3,25,4,75,2,1,1

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
