.thumb
@org	$0802abd4
	add		r1, #98
	mov		r3, r1
	add		r0, #72
	ldrh	r0, [r0]
	bl		range
	mov		r1, #15
	and		r0, r1
	ldr		r1, =0x0203a4d0
	ldrb	r1, [r1, #2]
	cmp		r1, r0
	bgt		penalty
	
	mov		r0, #72
	ldrh	r0, [r2, r0]
	bl		range
	lsr		r0, r0, #4
	ldr		r1, =0x0203a4d0
	ldrb	r1, [r1, #2]
	cmp		r1, r0
	blt		penalty
	
	mov		r0, r2
	mov		r1, #96
	ldrh	r2, [r2, r1]
	b		end
penalty:
	ldr	r0, [r2, #4]
	ldrb	r0, [r0, #4]
	cmp	r0, #0x29	@射程増加による命中マイナスを除外するクラス
	beq	musi
	cmp	r0, #0x2A	@射程増加による命中マイナスを除外するクラス
	bne	mainasu
musi:
	mov		r0, r2
	mov		r1, #96
	ldrh	r2, [r2, r1]
	b		end

mainasu:
	mov		r0, r2
	mov		r1, #96
	ldrh	r2, [r2, r1]
	sub		r2, #30
end:
	ldrh	r1, [r3]
	ldr		r3, =0x0802abdc
	mov		pc, r3
	
range:
	ldr		r1, =0x08017448
	mov		pc, r1
	