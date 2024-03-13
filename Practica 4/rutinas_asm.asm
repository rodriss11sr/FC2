	.global rgb2gray

	.equ COEF1, 3483
	.equ COEF2, 11718
	.equ COEF3, 1183

	.text

/*rgb2gray:
  		ldr r3, =COEF1
  		mul r0, r3, r0
  		ldr r3, =COEF2
  		mla r0, r3, r1, r0
  		ldr r3, =COEF3
  		mla r0, r3, r2, r0
  		mov r0, r0, lsr #14

  		mov pc, lr
*/
	.global RGB2GrayMatrix

	.equ i, -12
	.equ j, -16
	.equ origen, -20
	.equ destino, -24
	.equ N, 128
	.equ M, 128
B:	.space N*M

RGB2GrayMatrix:
	PUSH {r4-r7,fp,lr}
	ADD fp, sp, #20
	SUB sp, sp, #16

	STR r0, [fp, #-24]
	STR r1, [fp, #-28]
	MOV r3, #0
	STR r3, [fp, #-32]
	STR r3, [fp, #-36]

	MOV r4, r0 // Guardar la direccion del array en r4
	MOV r5, r1 // Guardar el array en r5
	MOV r6, #0 // i = 0

for1:
	CMP r6, #N	//i<n
	BEQ end_for1
	MOV r7, #0 //j=0

for2:
	CMP r7, #M  //j<m
	BEQ end_for2

	LDRB r0, [r4] //rojo
	ADD r4,r4,#1
	LDRB r1,[r4]  //verde
	ADD r4,r4,#1
	LDRB r2,[r4]  //azul
	BL rgb2gray
	STRB r0,[r5]
	ADD r4,r4,#1
	ADD r5,r5,#1

	ADD r7, r7, #1
	B for2

end_for2:
	ADD r6, r6, #1
	B for1

end_for1:
	ADD sp, sp, #16
	POP {r4-r7,fp,lr}
	MOV pc, lr
FIN:
	b .
	.end

