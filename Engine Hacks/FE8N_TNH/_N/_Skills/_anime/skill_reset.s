.thumb

push	{r0, r1, r2}
@味方
	ldr	r0, =0x0600612C
	ldrh	r1, =0x3080
	mov	r2, #0
GazouLoop:
	strh	r1, [r0, r2]
	add	r2, #2
	cmp	r2, #0x50
	beq	GazouEnd
	cmp	r2, #0x10
	bne	GazouLoop
	mov	r2, #0x40
	b	GazouLoop
GazouEnd:
@敵
	ldr	r0, =0x06006100
	ldrh	r1, =0x3080
	mov	r2, #0
GazouLoopteki:
	strh	r1, [r0, r2]
	add	r2, #2
	cmp	r2, #0x50
	beq	GazouEndteki
	cmp	r2, #0x10
	bne	GazouLoopteki
	mov	r2, #0x40
	b	GazouLoopteki
GazouEndteki:
pop	{r0, r1, r2}

mov	r0, #0x80
lsl	r0, r0, #0x6
and	r0, r4
cmp	r0, #0x0
beq	jump

ldr	r0, =0x080562E2
mov	pc, r0

jump:
ldr	r0, =0x080562F4
mov	pc, r0

.align
.ltorg
record_skillanime_id:
