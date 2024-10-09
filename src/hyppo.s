.text

.global hyppo_getversion
hyppo_getversion:
    lda #$00
    sta $d640
    clv
    lda #$2a
    rts