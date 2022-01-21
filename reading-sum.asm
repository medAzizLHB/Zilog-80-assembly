;read incoming data from input port INPORT
;count the number of readings and add the readings.
;When the sum exceeds FF, stop reading the port, store the number of readings added in memory location OUTBUF
;display 01 at the output port OUTLED to indicate the overload

		INPOR1 	.EQU 0030H	; just some random loacations to test the code
		OUTBUF 	.EQU 0040H	; MAKE SURE TO USE THE MEMORY EDITOR TO enter the data you want
		OUTLED 	.EQU 0050H	; MAKE SURE TO USE THE I/O PORT EDITOR TO SEE the input and output stuff

		LD BC, 0000H 		; Clear B to save the sum and C to ; count the number of readings

READ: 	IN A, (INPOR1) 		; Read data ; a pop up window will appear eneter the data you want on it
		INC C 				; Add count
		ADD A, B 			; Add new data to previous sum
		LD B, A 			; Save the sum

		JP C, OVRLD 		; Check for overload

		JP READ  			; Go back to read next data

OVRLD: 	LD HL, OUTBUF 		; Set up HL as memory pointer
		LD (HL), C 			; Save the count in memory
		LD A, 01H  			; Load 01 as overload indicator
		OUT (OUTLED), A 	; Display overload indicator
		HALT  				; End of program

