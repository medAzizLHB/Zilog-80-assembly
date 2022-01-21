;Add the following ten bytes stored in memory starting from INBUF. 
;Store the sum in two memory location; 
;the low-order to OUTBUF, and the high-order to OUTBUF+1

		INBUF 	.EQU 0030H ; Just some random loacation to test the code
		OUTBUF 	.EQU 0050H ; MAKE SURE TO USE THE MEMORY EDITOR TO enter the data you want

		ORG 0000H		; Start storin the flllowing program from address 2000H
		LD A,00H 		; Clear accumulator for addition
		LD C, A 		; Clear register C to save carry
		LD HL, INBUF 	; Set up HL as input buffer memory pointer
		LD B, 0AH 		; Set up register B as a counter from 10 to 0

NXTBYT:	ADD A, (HL) 	; Add data byte
		JP NC, SKIPCY 	; If no carry jump to SKipcy and do not increment CY register
		INC C 			; Save carry bit (only happens when a carry exists)

SKIPCY:	INC HL 			; Point to next memory location
		DEC B 			; One addition complete, decrement counter
		JP NZ,NXTBYT 	; If all bytes are not added. go back to go next byte
		LD HL, OUTBUF 	; Set up HL as output butFFer memory pointer
		LD (HL), A 		; Sore low-order byte of the sum
		INC HL 			; Piont to memory OUTBUF
		LD (HL), C 		; Store high order byte in OUTBUF + 1
		HALT 			; End of program

		ORG INBUF      ; start storing the data program from address of INBUF
        DB 0D1H, 0D9H, 0D0H, 031H, 000H, 05EH, 011H, 012H, 05FH, 001H, 055H, 023H ; some random data


