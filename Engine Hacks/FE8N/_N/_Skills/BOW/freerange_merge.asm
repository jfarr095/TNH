@thumb
@org	$08016938

	push	{r0}
	bl		$0801742C	;�˒��̉�1��(���)��ǂ�
	pop		{r1}
	push	{r0}
	mov		r0, r1
	bl		$08017414	;�˒��̏�1��(����)��ǂ�
	mov		r1, r0
	pop		{r2}
	nop
	