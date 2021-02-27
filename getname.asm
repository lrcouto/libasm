section .data
	question db `What is your name?\n`
	answer db "Hello, "

section .bss		; section .bss is for reserving data.
	name resb 16	; resb = reserved bytes. We will reserve 16 bytes under the "name" label

section .text
	global _start

_start:
	call _printQuestion
	call _getName
	call _printAnswer
	call _printName

	mov rax, 60
	mov rdi, 0
	syscall

_getName:S
	mov rax, 0
	mov rdi, 0
	mov rsi, name
	mov rdx, 16
	syscall
	ret

_printQuestion:
	mov rax, 1
	mov rdi, 1
	mov rsi, question
	mov rdx, 19
	syscall
	ret

_printAnswer:
	mov rax, 1
	mov rdi, 1
	mov rsi, answer
	mov rdx, 7
	syscall
	ret

_printName:
	mov rax, 1
	mov rdi, 1
	mov rsi, name
	mov rdx, 16
	syscall
	ret