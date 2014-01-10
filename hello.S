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

main:
	; disable watchdog
	MOVE WDCN, #0

	; print "Hello World"
	MOVE A[0], _str_hello_world
	CALL puts

1:
	JUMP 1b

.data
_str_hello_world: .asciz "Hello World\r\n"
