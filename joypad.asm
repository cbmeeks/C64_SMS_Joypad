
// Code borrowed and inspired from
// http://paper-programmer.blogspot.com/2013/05/read-joystick-commodore-64-6510-assembly.html

.import source "vars.asm"
.import source "engine/screen.asm"


.pc = $0801 "Basic Upstart"
:BasicUpstart(start)

.pc = $C000 "Joypad"

start:

	:ClearScreen(SCR_BUFFER, 32)
	// :SetBorderColor(BLACK)
	:SetBackgroundColor(BLACK)

loop:
	jsr $ffe1	// check for Run/Stop key
	bne up
	jmp exit

up:	
	lda JS1
	and #u_mask
	bne delete_u
	ldx #u_code
	stx u_loc
	ldx #spc_code
	stx d_loc
	jmp left

delete_u:
	ldx #spc_code
	stx u_loc

down:
	lda JS1
	and #d_mask
	bne delete_d
	ldx #d_code
	stx d_loc
	ldx #spc_code
	stx u_loc
	jmp left

delete_d:
	ldx #spc_code
	stx d_loc

left:
	lda JS1
	and #l_mask
	bne delete_l
	ldx #l_code
	stx l_loc
	jmp fire

delete_l:
	ldx #spc_code
	stx l_loc

right:
	lda JS1
	and #r_mask
	bne delete_r
	ldx #r_code
	stx r_loc
	jmp fire

delete_r:
	ldx #spc_code
	stx r_loc

fire:
	lda JS1
	and #f_mask
	bne delete_f
	ldx #f_code
	stx f_loc
	jmp loop

delete_f:
	ldx #spc_code
	stx f_loc

fire2:
	lda #224
	sta KBACT

	lda P2X	// load paddle Y (pin 9 of SMS)
	bne delete_f2
	ldx #f_code
	sta f2_loc

	lda #$FF
	sta KBACT

delete_f2:
	ldx #spc_code
	stx f2_loc

	lda #$FF
	sta KBACT

	jmp loop
exit:
	rts

