PIERCE_FLG = (0x01)
SHIELD_FLG =  (0x02)
SURESTRIKE_FLG = (0x04)

@ORG	0x70b72
.thumb
	ldr	r0, =0x08603B18
	mov	r1, r8
	lsl	r1, r1, #20
	lsr	r1, r1, #29
	mov r2, #(PIERCE_FLG | SHIELD_FLG)
	and r1, r2
	cmp	r1, r2
	bne	nonbreak	@��|�Ɗђʂ������������ĂȂ���Βʏ폈�� �� �K�I�̃G�t�F�N�g���폜�����̂ŕύX
	mov r0, pc
	add r0, #(ADR - calc_adr)	@���������Ȃ獷���ւ�
calc_adr:
nonbreak:
	mov	r1, #3
	ldr	r2, =0x08070b74
	mov	pc, r2
.align
.ltorg
ADR:



