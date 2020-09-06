.thumb

@org	0x0802b8a4

@右側経験値
bl	exp
bl	tikutiku
mov	r6, r5
add	r6, #0x6E
strb	r0, [r6, #0]

@左側経験値
mov	r0, r4
mov	r1, r5
bl	exp
bl	tikutiku
mov	r1, r4
add	r1, #0x6E
strb	r0, [r1, #0]

ldr	r1, =0x0802b8bc
mov	pc, r1

exp:
ldr	r3, =0x0802c46c
mov	pc, r3

tikutiku:
push	{r1, r2, lr}
cmp	r0, #0
beq	end		@獲得経験値0なら終了
ldrb	r1, [r5, #0xB]	@戦闘時右側
sub	r1, #0x41
bmi	migi		@自軍なら分岐
ldrb	r1, [r4, #0xB]	@戦闘時左側
sub	r1, #0x41
bpl	end		@敵軍なら終了

@味方が戦闘時左側なら
ldrb	r1, [r5, #0x13]
mov	r3, #0x37
add	r3, r3, r5
.short	0xE002

migi:	@味方が戦闘時右側なら
ldrb	r1, [r4, #0x13]
mov	r3, #0x37
add	r3, r3, r4

cmp	r1, #0
beq	end		@敵の現在ＨＰ0=撃破するなら終了
ldr	r1, =0x0202bcec
ldrb	r1, [r1, #0x14]
mov	r2, #0x40
and	r1, r2
cmp	r1, #0
beq	end		@ハードモードでないなら終了
ldrb	r1, [r3, #0]	@敵のチクチク値
sub	r1, #4		@経験値減算を開始するチクチク値
bmi	saiteiti	@チクチク値が4未満なら分岐
add	r1, #1
sub	r0, r0, r1	@獲得経験値

saiteiti:
cmp	r0, #1
bpl	end		@獲得経験値が1以上なら終了
mov	r0, #1		@最低経験値1
ldrb	r1, [r3, #0]	@敵のチクチク値
cmp	r1, #10
bmi	end
mov	r0, #0		@10戦目以降は最低経験値0

end:
pop	{r1, r2}
pop	{pc}
.ltorg
.align