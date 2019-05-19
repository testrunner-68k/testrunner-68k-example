
        section code,code

        XDEF    test_strlen_with_empty_string
test_strlen_with_empty_string
        lea     empty_string,a0
        bsr     strlen
        cmp.l   #0,d0
        bne.s   .wrong_length
        moveq   #1,d0
        rts
.wrong_length
        moveq   #0,d0
        rts

        XDEF    test_strlen_with_nonempty_string
test_strlen_with_nonempty_string
        lea     hello_string,a0
        bsr     strlen
        cmp.l   #hello_string_end-hello_string-1,d0
        bne.s   .wrong_length
        moveq   #1,d0
        rts
.wrong_length
        moveq   #0,d0
        rts

; Test runner does not yet support relocation - all code must be in the same section
;        section data,data

empty_string
        dc.b    0

hello_string
        dc.b    "hello",0
hello_string_end
