
		include	"testcase.i"

        section code,code

        XDEF    test_strlen_with_empty_string_passed_and_failed_macros
test_strlen_with_empty_string_return_passed_and_failed_macros
        lea     empty_string,a0
        bsr     strlen
        cmp.l   #0,d0
        bne.s   .wrong_length
		TESTCASE_PASSED
.wrong_length
		TESTCASE_FAILED

        XDEF    test_strlen_with_nonempty_string_passed_and_failed_macros
test_strlen_with_nonempty_string_passed_and_failed_macros
        lea     hello_string,a0
        bsr     strlen
        cmp.l   #hello_string_end-hello_string-1,d0
        bne.s   .wrong_length
		TESTCASE_PASSED
.wrong_length
		TESTCASE_FAILED

; Test runner does not yet support relocation - all code and data must be in the same section
;        section data,data

empty_string
        dc.b    0

hello_string
        dc.b    "hello",0
hello_string_end
