/*-----------------------------------------------------------------
**
**  Fichero:
**    pract3.asm  10/6/2014
**
**    Fundamentos de Computadores
**    Dpto. de Arquitectura de Computadores y Automática
**    Facultad de Informática. Universidad Complutense de Madrid
**
**  Propósito:
**    Ordena de mayor a menor un vector de enteros positivos
**
**  Notas de diseño:
**    Utiliza una subrutina que devuelve la posición del valor
**    máximo de un vector de enteros positivos
**
**---------------------------------------------------------------*/

.extern _stack
.global start

.EQU 	N, 8

.data
A: 		.word 7,3,25,4,75,2,1,1

.bss
B: 		.space N*4
max:	.space 4
ind:	.space 4

.text
start:
		ldr sp,=_stack
		mov fp,#0
		@ Terminar de codificar
		mov r1,#N				@tamaño de los arrays
		mov r4,#0				@j=0
for_j:
		ldr r0,=A				@direccion A[]
		cmp r4,#N
		bge end_for_j
		bl maximo				@max(A,N)
		mov r5,r0				@ind = max(A,N)
		ldr r6,=A
		ldr r7,[r6,r5,lsl#2]	@A[ind]
		ldr r8,=B
		str r7,[r8,r4,lsl#2]	@B[j] = A[ind]
		str r0,[r6,r5,lsl#2]	@A[ind]=0
		add r4,r4,#1
		b for_j
end_for_j:
		b end
maximo:
		push {r4-r9,fp}			@prologo de la subrutina
		add fp,sp,#24			@4*7-4=24
		mov r4,r0
		mov r5,#0				@i=0
		ldr r6,=max
		mov r7,#0
		str r7,[r6]				@max=0
		ldr r8,=ind
		str r7,[r8]				@ind=0
for:
		cmp r5,r1
		bge end_for
		ldr r7,[r4,r5,lsl#2]	@A[i]
		ldr r9,[r6]
		cmp r7,r9
		ble end_if
		str r7,[r6]				@max=A[i]
		str r5,[r8]				@ind = i
		add r5,r5,#1			@i++
		b for
end_if:
		add r5,r5,#1			@i++
		b for
end_for:
		ldr r4,[r8]
		mov r0,r4
		b end_max
end_max:
		pop {r4-r9,fp}			@epilogo de la subrutina
		mov pc,lr
end:
		b .
		.end
