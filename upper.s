	.intel_syntax noprefix
	.section .text
	.global UPPER_FRAG
#starting function with value of rbp register set to 0 and storing the address of the intial part of stirng in r8
UPPER_FRAG:
	xor rbp, rbp
	xor r8, r8
	mov r8, QWORD PTR [rbx]
#storing the current ascii character in the lower 8 bit part register dl
#exit status set
#set condition such as if the charcater is already upper case then don't change it
#moving to next character
#subtracting 20 hex decimal value to change lower case to upper case
#decrease the memeory location to store the changed characther in correct position
#changing location of modified character to  original memory	
loop:
	mov dl, byte PTR [r8 + rbp]
	cmp dl, 0
	je done
	inc rbp
	cmp dl, 0x61
	jl loop
	cmp dl, 0x7a
	jg loop
	sub dl, 0x20
	dec rbp
	mov byte PTR [r8 + rbp], dl
	jmp loop
#adding length of string to rax
done:
	add rbx, 8
	add rax, rbp 
	ret
