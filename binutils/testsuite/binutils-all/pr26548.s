	.section .debug_abbrev
1:
	.uleb128 1
# DW_TAG_variable
	.uleb128 0x34
# no children
	.byte 0
# DW_AT_const_value
	.uleb128 0x1c
# DW_FORM_sdata
	.uleb128 0x0d
	.byte 0,0
	.byte 0

	.section .debug_info
	.4byte 9f-0f
0:
	.2byte 4
	.4byte 1b
	.byte 8
 .ifndef ERROR
	.uleb128 1
	.sleb128  0x7fffffffffffffff
	.uleb128 1
	.sleb128 -0x8000000000000000
	.uleb128 1
# silly excess byte encoding of -1, no warning
	.byte 0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0x7f
	.uleb128 1
# silly excess byte encoding of 1, no warning
	.byte 0x81,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0
 .else
	.uleb128 1
# encode +0x8000000000000000, readelf warning
	.byte 0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x01
	.uleb128 1
# encode -0x8000000000000001, readelf warning
	.byte 0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0x3e
 .endif
9: