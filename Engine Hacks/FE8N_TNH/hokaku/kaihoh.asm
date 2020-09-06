@thumb
;@org	$080180cc > 00 49 8F 46 XX XX XX XX
	ldr	r1, =$08032189
	mov	r2, r14
	cmp	r1, r2
	bne	end	;;「降ろす」処理（r14で判断）以外は終了
	ldrb	r1, [r4, #11]
	mov	r2, #0x80
	and	r1, r2
	beq	end
	ldr	r5, =$80869F8
	ldr	r5, [r5]
	ldr	r6, =$0202BCEC
	ldr	r2, =$FFFF
loop
	ldrh	r1, [r5]
	cmp	r1, r2
	beq	non
	ldr	r0, [r4]
	ldrb	r0, [r0, #4]
	cmp	r0, r1
	bne	next
;編
	ldrb	r0, [r5, #2]
	cmp	r0, #0xFF
	beq	nonscenario
	ldrb	r1, [r6, #0x1B]
	cmp	r0, r1
	bne	next
nonscenario
;章
	ldrb	r0, [r5, #3]	
	cmp	r0, #0xFF
	beq	flagon
	ldrb	r1, [r6, #0xE]
	cmp	r0, r1
	beq	flagon
next
	add	r5, #12
	b	loop
flagon
;解放セリフ処理
		ldrh	r0, [r5, #10]
		cmp	r0, #0
		bne	goword
		ldrh	r0, [r5, #6]
		cmp	r0, #0
		beq	flagcheck
goword
		ldr	r1, =$0800D548
		mov	r14, r1
		@dcw	$F800
flagcheck
;解放フラグオン処理
		ldrh	r0, [r5, #8]
		cmp	r0, #0
		bne	goflag
		ldrh	r0, [r5, #4]
		cmp	r0, #0
		beq	non
goflag
		ldr	r1, =$080860A8
		mov	r14, r1
		@dcw	$F800
non
;消滅処理
	mov	r0, #0
	str	r0, [r4]
	strb	r0, [r4, #19]
	mov	r0, #1
	strb	r0, [r4, #12]

	
end
	pop	{r4-r7, pc}
