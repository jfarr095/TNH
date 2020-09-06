.thumb

@org	0x0802c138

mov	r5, r1
bl	tikutiku
ldrb	r0, [r5, #0x8]
strb	r0, [r4, #0x8]
ldrb	r0, [r5, #0x9]
strb	r0, [r4, #0x9]
ldr	r0, =0x0802c142
mov	pc, r0

tikutiku:
push	{r1, lr}
ldrb	r0, [r5, #0xB]
lsl	r0, r0, #24
bpl	end		@敵以外なら終了
mov	r1, #0x37 	@支援値6人目
add	r1, r1, r4
ldrb	r0, [r1, #0]
cmp	r0, #99		@チクチク値限界:99
beq	end
add	r0, #1
strb	r0, [r1, #0]	@チクチク値代入

end:
pop	{r1}
pop	{pc}

.ltorg
.align