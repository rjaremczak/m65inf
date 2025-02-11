.text

.global hyppo_geterrorcode
.global hyppo_getversion

hyppo_geterrorcode:
    clc
hyppo_geterrorcode_raw:
    lda #$38
    sta $d640
    clv
    rts

hyppo_getversion:
    phz
    lda #$00
    sta $d640
    clv
    bcs ok
    jmp hyppo_geterrorcode_raw
ok:
    stq [__rc2]
    plz
    lda #0
    rts


