@thumb
;0802add6

	cmp r2, #0x2
	beq sleepstone
	cmp r2, #0xB
	beq stone
	cmp r2, #0xD
	bne endstone

stone:
	MOV r1, #0x5C
	MOV r0, #0x0
;	STRH r0, [r1, r6]

	MOV r1, r4
	ADD r1, #0x6A
	LDRH r0, [r1, #0x0]
	ADD r0, #0x1E
	STRH r0, [r1, #0x0]

sleepstone:
	MOV r0, #0x64
	MOV r2, #0x64
	STRH r2, [r0, r4]

	mov r8, r8
	mov r8, r8	

endstone:
	POP {r4,r5,r6}
