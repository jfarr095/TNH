@thumb
;@org	$0803a954 00 48 87 46 XX XX XX XX
	
	
	ldr	r0, [r2, #4]
	ldrb	r0, [r0, #4]
	cmp	r0, r8
	beq	atari
	ldr	r0, =$03004DF0
	ldr	r0, [r0]
	add	r0, #0x38
	ldrb	r0, [r0]
	ldr	r5, [r2]
	ldrb	r5, [r5, #4]
	cmp	r0, r5
	bne	hazure
atari
	mov	r0, #0
	ldr	r5, =$0803A95C
	mov pc, r5
hazure
	ldr	r0, =$0803A96C
	mov pc, r0