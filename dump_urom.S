.global main

.text
main:
	; disable watchdog
	MOVE WDCN, #0

	MOVE DPC, #0004h
	MOVE DP[0], #8000h

	MOVE LC[1], #1000h
1:
	MOVE DPC, #0004h
	MOVE A[0], @DP[0]++
	CALL puthex
	MOVE A[0], _str_nl
	CALL puts
	DJNZ LC[1], 1b

1:
	JUMP 1b

.data
.align 2
_str_nl: .asciz "\r\n"
