	.intel_syntax noprefix
	.text.
	.global _start
_start:
	# zero out rax
	xor rax, rax
	mov rbx, OFFSET [CALC_DATA_BEGIN]

	mov rax,60
	mov rdi,0
	syscall
