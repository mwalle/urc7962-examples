.global main

.text

putc:
	; wait until previous transfer has finished
1:
	MOVE C, SCON0.1     ; TI bit
	JUMP NC, 1b
	MOVE SCON0.1, #0
	MOVE SBUF0, A[0]
	RET

puts:
	MOVE AP, #0
	ADD A[0]
	MOVE DPC, #0        ; byte access
	MOVE CP, A[0]
1:
	MOVE A[0], @CP++
	CALL putc
	JUMP NZ, 1b
	RET

puthex:
	MOVE A[1], A[0]
	MOVE LC[0], #4
1:
	MOVE A[2], A[1]
	MOVE AP, #2
	SRA4
	SRA4
	SRA4
	AND #0Fh
	ADD _ascii_chars
	ADD _ascii_chars
	MOVE DPC, #0
	MOVE CP, A[2]
	MOVE A[0], @CP
	CALL putc
	MOVE AP, #1
	SLA4
	DJNZ LC[0], 1b
	RET

main:
	; disable watchdog
	MOVE WDCN, #0

	; print "Hello World"
	MOVE A[0], _str_hello_world
	CALL puts

	MOVE A[0], #1234h
	CALL puthex

	MOVE A[0], _str_nl
	CALL puts

	MOVE A[0], _str_end
	CALL puts
1:
	JUMP 1b

.data
_ascii_chars: .ascii "0123456789abcdef"

.align 2
_str_hello_world: .asciz "Hello World\r\n"
.align 2
_str_nl: .asciz "\r\n"
.align 2
_str_end: .asciz "The End\r\n"
