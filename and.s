	.intel_syntax noprefix
	.section .text
	# AND_FRAG Fragement
	# INPUTS: rax -> x
	# rbx -> &y address of where in memory y is
	# OUTPUTS: x = x bitwise and y : update rax with bit wise and of the
	# 8 byte quantity at the location of &y
	# rbx should be updated to equal &y + 8
	.global AND_FRAG
AND_FRAG:
	AND rax, QWORD PTR [rbx]
	add rbx, 8
	ret
