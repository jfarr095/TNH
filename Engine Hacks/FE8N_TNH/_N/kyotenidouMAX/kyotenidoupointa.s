.thumb

Flag_Move = (adr)
Map_Move1 = (adr+4)
Map_Move2 = (adr+8)

@org	0x08032D6C

ldrb	r1, [r1, #0x1D]	@�ړ��␳�l�ǂݍ���
add	r0, r0, r1	@�N���X�ړ��{�ړ��␳
bl	kyotenMap
ldr	r1, =0x0203a954
ldrb	r1, [r1, #0x10]
ldr	r3, =0x08032D74
mov	pc, r3

kyotenMap:
push	{r0, r1, r2, lr}
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
pop	{r0, r1, r2}
mov	r0, #15		@�ړ�15�����E
.short	0xE000

NoMove:
pop	{r0, r1, r2}
pop	{pc}
.ltorg
.align
adr: