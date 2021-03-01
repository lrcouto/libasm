# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strcpy.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lcouto <lcouto@student.42sp.org.br>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/28 03:33:07 by user42            #+#    #+#              #
#    Updated: 2021/03/01 17:34:06 by lcouto           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	global	ft_strcpy

ft_strcpy:
	xor	rcx, rcx				; eXclusive OR operation, sets index to 0.
	cmp	rsi, 0					; Check if src exists.
	jz	end						; If it doesn't, return.
	jmp	copy					; Go to copy subroutine;

increment:
	inc	rcx;					; Increment index.

copy:
	mov	dl, BYTE [rsi + rcx]	; Move src[i] to dl;
	mov	BYTE [rdi + rcx], dl	; Move dl to dst[i];
	cmp	dl, 0					; Check if the string has ended i.e. you got to the \0.
	jnz	increment				; if it didn't, increment.

end:
	mov	rax, rdi				; Set dst as the return value.
	ret
