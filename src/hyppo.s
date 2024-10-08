.globl hyppo_getversion

hyppo_getversion:
    lda #$00
    sta $d640
    clv
    rts