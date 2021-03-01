# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_write.s                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lcouto <lcouto@student.42sp.org.br>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/28 21:22:36 by user42            #+#    #+#              #
#    Updated: 2021/03/01 17:34:14 by lcouto           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	global ft_write
	extern __errno_location

ft_write:
	mov		rax, 1			; Set register to 1 = syscall write.
	syscall					; call write.
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