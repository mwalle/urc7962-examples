.text

; start marker
.byte 0x12
.byte 0x34

; length
.byte 0x00
.byte 0x00
.byte 0x00
.byte 0x80

; payload description, exactly 14 bytes long
.ascii "Hello World   "

intPowerFail:
	LJUMP intPowerFail

intMemoryFault:
	LJUMP intMemoryFault

intExternal7_0:
	LJUMP intExternal7_0

.fill 32, 1, 0

intIRTimer:
	LJUMP intIRTimer

intSerialPort:
	LJUMP intSerialPort

intSPI0_External15_8:
	LJUMP intSPI0_External15_8

intTimer:
	LJUMP intTimer

intWakeupWatchdogTimer:
	LJUMP intWakeupWatchdogTimer

vecMain:
	LJUMP main

vecGetSignatureBlockAddress:
	LJUMP get_signature_block_address

intUSB:
	LJUMP intUSB

intI2C:
	LJUMP intI2C

intSPI1:
	LJUMP intSPI1

intReserved0:
	LJUMP intReserved0

intReserved1:
	LJUMP intReserved1

intReserved2:
	LJUMP intReserved2

intReserved3:
	LJUMP intReserved3

intReserved4:
	LJUMP intReserved4

; dummy
.word 0x00

.byte 0x12
.byte 0x34
