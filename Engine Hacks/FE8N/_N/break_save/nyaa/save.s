
DATA_SIZE = (176)
.thumb
@080a7c28
push {r4, r5, r6, r7, lr}
mov r7, r8
push {r7}
mov r8, r0
mov r1, lr
bl main @r0に拡張セーブアドレス
mov r8, r0
sub sp, #DATA_SIZE
sub sp, #DATA_SIZE
nop
nop
nop
    ldr r0, =0x0803144c @=輸送隊のベースアドレスロード
    mov lr, r0
    .short 0xF800
mov r6, r0
add r5, sp, #100
add r5, #100
ldr r0, =0x080a7c3a
mov pc, r0

EX_SAVE_AREA = (ADDR)

main:
    push {r4, lr}
    mov r4, r1
    bl org_transport_func
    mov r0, r4
    bl getSuffix    @中断か通常セーブか判別
    ldr r1, =0x160
    mul r0, r1
    ldr r1, EX_SAVE_AREA    @0x0E領域
    add r0, r1
    pop {r4, pc}

CHAPTER_BASE_ADDR = (0x0202bcec)
getSuffix:
@
@中断なら0
@普通セーブなら1 or 2 or 3
@
        ldr r1, =0x080a9abd
        cmp r0, r1
        beq normal
        nop
        ldr r1, =0x080a99c9
        cmp r0, r1
        beq start
        
        mov r0, #0
        b merge
    start:
        ldr r0, =CHAPTER_BASE_ADDR
        ldrb r0, [r0, #12]
    @	mov r0, r9
        add r0, #1
        b merge
    normal:
        mov r0, r10
        add r0, #1
    merge:
        bx lr

org_transport_func:
        push {lr}
            ldr r0, ADDR+4   @saveLvMax.s
            mov lr, r0
            .short 0xF800
        nop
        bl save_org_transport_data_to_sram
        pop {pc}

BL_ARCHIVE_DATA_R0toR1_FUNC = (0x080d6548)
ORG_TRANSPORT_DATA_ADDR = (0x0203a818)
MEMCPY_R1toR0_FUNC = (0x080d6908)

save_org_transport_data_to_sram:
    push {lr}
    sub sp, #DATA_SIZE

    mov r0, sp
    ldr r1, =ORG_TRANSPORT_DATA_ADDR
    mov r2, #DATA_SIZE
        ldr r3, =MEMCPY_R1toR0_FUNC
        mov lr, r3
        .short 0xF800
    
    mov r0, sp
    mov r1, r8
    mov r2, #DATA_SIZE
        ldr r3, =BL_ARCHIVE_DATA_R0toR1_FUNC
        mov lr, r3
        .short 0xF800

    add sp, #DATA_SIZE
    pop {pc}

.align
.ltorg
ADDR:
