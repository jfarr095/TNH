.thumb

Flag_Move = (adr)
Map_Move1 = (adr+4)
Map_Move2 = (adr+8)

@org	0x08089878

mov	r3, lr
ldrb	r2, [r0, #0x1D]	@�ړ��␳�l�ǂݍ���
add	r1, r1, r2	@�N���X�ړ��{�ړ��␳
bl	kyotenMap
mov	lr, r3
ldrb	r2, [r0, #0xB]	@�����\ID
lsl	r2, r2, #0x18
lsr	r2, r2, #0x1E
beq	MovEnd		@�����Ȃ�I��
ldr	r3, =0x08089884
mov	pc, r3

MovEnd:
ldr	r2, =0x080898A0
mov	pc, r2

kyotenMap:
push	{r0, r1, r2, r3, lr}
ldr	r2, =0x0202BCEC
ldrb	r2, [r2, #0xE]	@���݃}�b�vID
ldrb	r0, Map_Move1	@�w��}�b�vID1
ldrb	r0, [r0, #0]
cmp	r0, r2
beq	kyotenFlag
ldrb	r0, Map_Move2	@�w��}�b�vID2
ldrb	r0, [r0, #0]
cmp	r0, r2
bne	NoMove

kyotenFlag:
ldr	r2, =0x080860D0	@�t���O�������Ă邩
mov	lr, r2
ldrh	r0, Flag_Move	@�w��t���OID
ldrh	r0, [r0, #0]
.short	0xF800
cmp	r0, #0
bne	NoMove		@�t���O�������Ă�Ȃ�I��
pop	{r0, r1, r2, r3}
mov	r1, #15		@�ړ�15�����E
.short	0xE000

NoMove:
pop	{r0, r1, r2, r3}
pop	{pc}
.ltorg
.align
adr: