.global main

.text

main:
	; disable watchdog
	MOVE WDCN, #0

	; print "Hello World"
	MOVE A[0], _str_hello_world
	CALL puts

1:
	JUMP 1b

.data
.align 2
_str_hello_world: .asciz "Hello World\r\n"
