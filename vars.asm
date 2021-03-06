
//***************************************************************************
//	Zero Page
//***************************************************************************


//***************************************************************************
//	Addresses
//***************************************************************************
.var SCR_BUFFER	= $0400
.var KBACT = $DC02
.var JS1 = $DC00
.var P2X = $D41A

// Screen locations.
.var u_loc = $0501
.var d_loc = $0551
.var l_loc = $0528
.var r_loc = $052a
.var f_loc = $0529
.var f2_loc = $052c

//***************************************************************************
//	Keyboard Codes
//***************************************************************************
.var u_code = $15
.var d_code = $04
.var l_code = $0c
.var r_code = $12
.var f_code = $2a
.var spc_code = $20

//***************************************************************************
//	Joystick Switch Masks
//***************************************************************************
.var u_mask = $01
.var d_mask = $02
.var l_mask = $04
.var r_mask = $08
.var f_mask = $10


