.thumb

@org	0x0802b8a4

@�E���o���l
bl	exp
bl	tikutiku
mov	r6, r5
add	r6, #0x6E
strb	r0, [r6, #0]

@�����o���l
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
beq	end		@�l���o���l0�Ȃ�I��
ldrb	r1, [r5, #0xB]	@�퓬���E��
sub	r1, #0x41
bmi	migi		@���R�Ȃ番��
ldrb	r1, [r4, #0xB]	@�퓬������
sub	r1, #0x41
bpl	end		@�G�R�Ȃ�I��

@�������퓬�������Ȃ�
ldrb	r1, [r5, #0x13]
mov	r3, #0x37
add	r3, r3, r5
.short	0xE002

migi:	@�������퓬���E���Ȃ�
ldrb	r1, [r4, #0x13]
mov	r3, #0x37
add	r3, r3, r4

cmp	r1, #0
beq	end		@�G�̌��݂g�o0=���j����Ȃ�I��
ldr	r1, =0x0202bcec
ldrb	r1, [r1, #0x14]
mov	r2, #0x40
and	r1, r2
cmp	r1, #0
beq	end		@�n�[�h���[�h�łȂ��Ȃ�I��
ldrb	r1, [r3, #0]	@�G�̃`�N�`�N�l
sub	r1, #4		@�o���l���Z���J�n����`�N�`�N�l
bmi	saiteiti	@�`�N�`�N�l��4�����Ȃ番��
add	r1, #1
sub	r0, r0, r1	@�l���o���l

saiteiti:
cmp	r0, #1
bpl	end		@�l���o���l��1�ȏ�Ȃ�I��
mov	r0, #1		@�Œ�o���l1
ldrb	r1, [r3, #0]	@�G�̃`�N�`�N�l
cmp	r1, #10
bmi	end
mov	r0, #0		@10��ڈȍ~�͍Œ�o���l0

end:
pop	{r1, r2}
pop	{pc}
.ltorg
.align