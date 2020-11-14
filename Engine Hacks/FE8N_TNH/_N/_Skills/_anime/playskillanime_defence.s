@Call 08070B96 (FE8J)
@仕様は、ドキュメントを読んでください。 skl_anime_table.event
@

.thumb
	mov		r0,#0x1  @防衛側を取得
	ldr		r1, adr  @ get_skillanime_data 発動しているスキルの取得
	mov r14, r1
	.short 0xf800
	
	cmp		r0,#0x00
	beq		exit	@不明 ディフォルトアニメをそのまま利用
	
	ldr	r1,[r0,#0x0]	@フレームポインタ SkillAnimation[skill_id].frame_list
	str r1, [r4, #0x48]
	
	ldr	r1,[r0,#0x4]	@TSAポインタ SkillAnimation[skill_id].tsa_list
	str r1, [r4, #0x4c]
	str r1, [r4, #0x50]
	
	ldr	r1,[r0,#0x8]	@画像ポインタ SkillAnimation[skill_id].image_list
	str r1, [r4, #0x54]
	
	ldr	r1,[r0,#0xC]	@パレットポインタ SkillAnimation[skill_id].palette_list
	str r1, [r4, #0x58]

exit: @フック時に壊してしまう命令の再送
	ldr r3,=0x08056158	@フレームとTSA画像による魔法のアニメ 
	mov r14, r3
	.short 0xf800

	ldr r0, [r4, #0x5c] @ pointer:08603B74 -> 08071C65

	ldr r3,=0x0805b058   @GetCoreAIStruct
	mov r14, r3
	.short 0xf800

@スキル画像書き込み
	push	{r0, r1, r2}
	ldr	r0, =0x02029012
	ldrb	r0, [r0, #0]
	ldr	r1, =0x02028F82
	ldrb	r1, [r1, #0]
	sub	r0, r0, r1
	cmp	r0, #0
	beq	SkillName
	bgt	Teki
	b	Mikata

SkillName:
	ldr	r0, =0x0202900E
	ldrb	r0, [r0, #0]
	cmp	r0, #0x64
	beq	Teki
	b	Mikata

Mikata:
	ldr	r0, =0x0203AE43
	ldr	r1, =0x06004000
	bl	skillname
	ldr	r0, =0x0203AE43
	ldr	r3, =0x06004300
	bl	skillicon
	ldr	r0, =0x06006130
	ldrh	r1, =0x3200
	bl	namedisplay
	ldr	r0, =0x0600612C
	ldrh	r1, =0xD218
	bl	icondisplay
	b	skillend

Teki:
	ldr	r0, =0x0203AE45
	ldr	r1, =0x06004180
	bl	skillname
	ldr	r0, =0x0203AE45
	ldr	r3, =0x06004380
	bl	skillicon
	ldr	r0, =0x06006100
	ldrh	r1, =0x220C
	bl	namedisplay
	ldr	r0, =0x0600610C
	ldrh	r1, =0xD21C
	bl	icondisplay
skillend:
	pop	{r0, r1, r2}
	ldr		r3,=0x08070BA0+1	@元に戻す
	mov 		pc,r3

skillname:
	push	{lr}
	ldrb	r0, [r0, #0]
	lsl	r0, r0, #0x2
	ldr	r2, adr+4
	ldr	r0, [r0, r2]
	cmp	r0, #0
	beq	GazouiconEnd
	bl	CompVram
	pop	{pc}

skillicon:
	push	{lr}
	ldrb	r0, [r0, #0]
	lsl	r0, r0, #0x7
	ldr	r1, =0x08003600
	ldr	r1, [r1, #0]	@アイテムアイコン
	mov	r2, #1
	lsl	r2, r2, #15
	add	r1, r1, r2	@スキルアイコン
	add	r0, r0, r1
	mov	r2, #0
loopicon:
	ldr	r1, [r0, r2]
	str	r1, [r3, r2]
	add	r2, r2, #4
	cmp	r2, #0x80
	bne	loopicon
@スキルアイコンパレット書き込み
	ldr	r0, =0x085C1470
	ldr	r1, =0x02022A48
	mov	r2, #0
looppal:
	ldr	r3, [r0, r2]
	str	r3, [r1, r2]
	add	r2, #4
	cmp	r2, #0x20
	bne	looppal
	pop	{pc}


namedisplay:	@スキル画像表示
	push	{lr}
	mov	r2, #0
GazouLoop:
	strh	r1, [r0, r2]
	add	r1 ,#1
	add	r2, #2
	cmp	r2, #0x4C
	beq	GazouEnd
	cmp	r2, #0xC
	bne	GazouLoop
	mov	r2, #0x40
	b	GazouLoop
GazouEnd:
	pop	{pc}

icondisplay:	@スキルアイコン画像表示
	push	{lr}
	mov	r2, #0
GazouiconLoop:
	strh	r1, [r0, r2]
	add	r1 ,#1
	add	r2, #2
	cmp	r2, #0x44
	beq	GazouiconEnd
	cmp	r2, #0x4
	bne	GazouiconLoop
	mov	r2, #0x40
	b	GazouiconLoop
GazouiconEnd:
	pop	{pc}

@スキル画像書き込みジャンプ
CompVram:
	ldr	r3, =0x080d6390
	mov	pc, r3

.align
.ltorg
adr:
