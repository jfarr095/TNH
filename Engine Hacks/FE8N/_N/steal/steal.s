
STAFF = (4)
ITEM = (9)

.thumb
	ldr r0, [r1, #8]
	lsl r0, r0, #27
	bmi false	@���p�s�A�C�e���͓��߂Ȃ�
	
	ldrb r0, [r1, #7]
	cmp r0, #ITEM
	beq true
	cmp r0, #STAFF
	beq true
	cmp r0, #ITEM
	bgt false	@���΂Ȃǂ͓��߂Ȃ�
	cmp r6, #0
	beq false	@��ԏ�̃A�C�e���͓��߂Ȃ�
	cmp r6, #6
	blt true	@��ԏ�̃A�C�e���͓��߂Ȃ�
	mov r0, r8
	cmp r0, #0
	beq end	@��ԏ�̃A�C�e���͓��߂Ȃ�2
true:
	mov r0, #1
	b end
false:
	mov r0, #0
end:
	pop {r1}
	bx r1
	
	