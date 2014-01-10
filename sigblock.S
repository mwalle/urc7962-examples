.global get_signature_block_address

get_signature_block_address:
	MOVE AP, #0
	MOVE A[0], sigblock
	ADD A[0]
	MOVE A[1], #0
	RET

.data
sigblock:
	; 26 byte string
	.ascii "Hello World               "
	; program begin
	.long 0
	; program end
	.long 0
	; protocol begin
	.long 0
	; protocol end
	.long 0
	; udpate begin
	.long 0
	; update end
	.long 0
