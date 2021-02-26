section .data					; This section is where the data is defined before compiling.
	text db `Hello, World!\n`	; text defines this memory address. db = define bytes. The string is the bytes. Newline only works between ``s.

section .text					; This section is where the actual code goes.
	global _start				; Global is used when you want the linker to know the address of a label.

_start:							; Label part of the code. Assembly code needs a _start label or it gets a linker error.
	mov rax, 1					; syscall ID 1 = sys_write
	mov rdi, 1					; sys_write argument 1 - file descriptor - fd 1 = stdout.
	mov rsi, text				; Source index/buffer - The address of the string we're writing.
	mov rdx, 14					; Length of the string in bytes.
	syscall						; Do the system call.

	mov rax, 60					; syscall 60 = sys_exit
	mov rdi, 0					; error code 0 = no error.
	syscall