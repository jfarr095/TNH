@thumb
@org	$08074ba6

	ldr	r6, [$08074bdc+4]
	ldrb	r0, [r6, #0xE]
	bl	$08034520
	ldrb	r1, [r6, #0xF]
	add	r0, #28
	lsl	r2, r1, #25
	bmi	$08074be0
	ldrh	r6, [r0, #2]
	lsl	r1, r1, #24
	bmi	$08074bbe
	ldrh	r6, [r0, #0]
	
	
@org	$08074bdc
@dcd	$0202bcec
	ldrh	r6, [r0, #4]
	nop
