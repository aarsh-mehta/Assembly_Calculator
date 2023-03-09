#initialization
	.intel_syntax noprefix
	.section .text
	.global _start
	
#setting start values for registers
_start:
	xor rax, rax
	mov rbx, OFFSET [CALC_DATA_BEGIN]

#beginning of the loop: checks for the specific operation and calls the corresponding code block
loop:
	cmp byte PTR[rbx], 0
	jz standard_out
	cmp byte PTR[rbx], '&'
	je and_f
	cmp byte PTR[rbx], '|'
	je or_f
	cmp byte PTR[rbx], 'S'
	je sum_f
	cmp byte PTR[rbx], 'U'
	je upper_f
	je loop_done
	add  rbx,8

#conditional code blocks
#conditional call for and
and_f:
	add rbx, 8
	call AND_FRAG
	jmp loop

#conditional call for or
or_f:
	add rbx, 8
	call OR_FRAG
	jmp loop

#conditional call for sum
sum_f:
	add rbx, 8
	call SUM_FRAG
	jmp loop

#conditional call for upper
upper_f:
	add rbx, 8
	call UPPER_FRAG
	jmp loop

#writes the output to standard output
standard_out:
	mov QWORD PTR [rval], rax
	mov rax, 1
	mov rdi, 1
	mov rsi, OFFSET [rval]	#writes value of rval
	mov rdx, 8
	syscall
	mov rax, 1
	mov rdi, 1
	mov rsi, OFFSET [SUM_POSITIVE]		#final value of SUM_POSITIVE
	mov rdx, 8
	syscall
	mov rax, 1
	mov rdi, 1
	mov rsi, OFFSET [SUM_NEGATIVE]		#final val of SUM_NEGATIVE
	mov rdx, 8
	syscall
	mov rax, 1
	mov rdi, 1
	mov rsi, OFFSET CALC_DATA_BEGIN		#bytes used by memory
	mov rdx, OFFSET CALC_DATA_END
	mov rcx, OFFSET CALC_DATA_BEGIN
	sub rdx, rcx
	syscall
	mov rax, 60
	mov rdi, 0
	syscall

#end of program, ends the loop returns control	
loop_done:
	int3



#initializing a variable for rval
	.section .data
rval:
	.quad 0x0
