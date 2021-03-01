# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strdup.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lcouto <lcouto@student.42sp.org.br>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/01 01:24:47 by user42            #+#    #+#              #
#    Updated: 2021/03/01 17:34:10 by lcouto           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	global	ft_strdup
	extern	malloc
	extern	ft_strlen
	extern	ft_strcpy
	extern	__errno_location

ft_strdup:
	call	ft_strlen			; Use ft_strlen to get the size of the buffer.
	add		rax, 1				; Add 1 for the null at the end of the string.
	push	rdi					; Push arg[0] to the top of the stack.
	mov		rdi, rax			; rdi now holds the size of the buffer.
	call	malloc				; Call malloc, return is in rax.
	cmp		rax, 0				; Verify if malloc failed.
	je		error				; If it did, go to error subroutine.
	pop		r9					; Get that arg on top of the stack and save on r9.
	mov		rdi, rax			; Setup newly allocated string at arg[0] for copy.
	mov		rsi, r9				; Setup string that we want to copy as arg[1].
	call	ft_strcpy			; Call ft_strcpy, return is set to rax.
	ret

error:
	neg		rax					; negate rax.
	push	rax					; put rax into the top of stack
	call	__errno_location	; call error number
	pop		rbx					; pop rbx out of the top of the stack.
	mov		[rax], rbx			; set error in rax pointer.
	mov		rax, -1				; set return to -1
	ret