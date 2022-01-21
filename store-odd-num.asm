	LD HL , 4100H	; store starting address to HL
	LD A, 01H	; load the first odd value to register A
LOOP 	LD (HL), A	; start the loop by copying the odd value from A to memory
	INC HL		; point to the next memory address
	ADD A, 02H	; get the next odd number
	CP 80H		; copmare with 80H
	JP C, LOOP	; go back if A < 80H
	HALT		; else terminate the program