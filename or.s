	.intel_syntax noprefix
	.section .text
	.global OR_FRAG
#Input: rax -> x
OR_FRAG:
	OR rax, QWORD PTR [rbx]
	add rbx, 8
	ret
	#rax -> x
	#rbx -> &y address of where in memory y is
#rbx should be updated to equal &y + 8
