# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_read.s                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lcouto <lcouto@student.42sp.org.br>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/01 01:24:39 by user42            #+#    #+#              #
#    Updated: 2021/03/01 17:34:02 by lcouto           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	global ft_read
	extern __errno_location

ft_read:
	mov		rax, 0			; Set register to 0 = syscall read.
	syscall					; call read.
	cmp		rax, 0			; compare call return to zero.
	jl		error			; if the return < 0, there was an error.
	ret						; else, return.

error:
	neg rax					; negate rax.
	push rax				; put rax into the top of stack
	call __errno_location	; call error number
	pop rbx					; pop rbx out of the top of the stack.
	mov [rax], rbx			; set error in rax pointer.
	mov rax, -1				; set return to -1
	ret