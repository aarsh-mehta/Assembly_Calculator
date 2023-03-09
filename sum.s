	.intel_syntax noprefix
	.section .text          #textsection
	.global SUM_FRAG
	# INPUTS:
	#rax -> x
	        #rbx -> &y address of where in memory y is
SUM_FRAG:	                       #operations and required movements
	mov rdx, QWORD PTR [rbx]
	add rax, rdx
	add rbx, 8
	cmp rdx, 0
	jge SUM_POS
	cmp rdx, 0
	jl SUM_NEG
	ret
# OUTPUTS: x = x + y :
#ifd y is positive then add y into an 8 byte value
#at stored at a location marked by a symbol
#named SUM_POSTIVE
#elsed add y into an 8 byte value stored at a
#location makred by a symbol named SUM_NEGATIVE
#final rbx should be updated to equal &y + 8

SUM_POS:
	add QWORD PTR[SUM_POSITIVE], rdx        #conditional processes
	ret
SUM_NEG:
	add QWORD PTR[SUM_NEGATIVE], rdx
	ret

	.section .data                          #data sectiom
	.global SUM_POSITIVE
	.global SUM_NEGATIVE
SUM_POSITIVE:
	.quad 0x0
SUM_NEGATIVE:
	.quad 0x0
