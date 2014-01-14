.global main

.text

main:
	; disable watchdog
	MOVE WDCN, #0

	; copy code to ram
	MOVE DPC, #5Ch
	MOVE LC[0], #16
	MOVE DP[0], #FFFFh
	MOVE A[0], _code
	MOVE CP, A[0]

1:
	MOVE A[0], @CP++
	MOVE @++DP[0], A[0]
	DJNZ LC[0], 1b

	MOVE A[7], #0A00h
	MOVE LC[1], #0100h
1:
	MOVE A[0], A[7]
	CALL #A000h
	CALL puthex

	MOVE A[0], _str_nl
	CALL puts

	MOVE AP, #7
	ADD #1
	MOVE AP, #0
	DJNZ LC[1], 1b


1:
	JUMP 1b

.data
.align 2
_str_nl: .asciz "\r\n"

.align 2
_code:
	MOVE FCNTL, #1
	MOVE FDATA, A[0]
	NOP
	NOP
	MOVE A[0], FDATA
	MOVE FCNTL, #0
	RET

	;MOVE A[0], #1234h
	;RET
