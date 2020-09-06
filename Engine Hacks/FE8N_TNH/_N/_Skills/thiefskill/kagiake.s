@thumb
;08023e40

	push	{r2}
	bne	notkagiake
	ldr	r0, [r2, #0x0]
	ldr	r1, [r2, #0x4]
	ldr	r0, [r0, #0x28]
	ldr	r1, [r1, #0x28]
	orr	r0, r1
	mov	r1, #0x08
	and	r0, r1
	bne	kagiake
notkagiake:
	mov	r0, #0x0
	b	endkagiake
kagiake:
	mov	r0, #0x1
endkagiake:
	pop	{r2}
	ldr	r1, =0x08023e4e
	mov	pc, r1