.thumb
@
@r0 = unit_data (利用しない)
@r1 = skill_id
@
    push {lr}

@ここから新ルーチン
	push	{r1}
	mov	r1, #0xB
	ldrb	r0, [r0, r1]	@部隊表
	pop	{r1}
	cmp	r0, #0x81	@敵
	bge	teki		@敵なら分岐
	ldr	r2, =0x0203AE43
	strb	r1, [r2, #0]	@味方と同盟
	b	endskill
teki:
	ldr	r2, =0x0203AE45
	strb	r1, [r2, #0]	@敵
endskill:
@ここまで

    mov r0, #0x1 @防衛スキル
        ldr r2, record_skillanime_id
        mov lr, r2
        .short 0xF800
    ldr	r3, =0x0203a604
    ldr	r3, [r3]
    ldr	r2, [r3]
    lsl	r1, r2, #13
    lsr	r1, r1, #13
    mov	r0, #128
    lsl	r0, r0, #8
    orr	r1, r0
    ldr	r0, =0xFFF80000
    and	r0, r2
    orr	r0, r1
    str	r0, [r3]
    pop {pc}
.align
.ltorg
record_skillanime_id:
