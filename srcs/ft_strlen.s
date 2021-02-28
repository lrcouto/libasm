# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strlen.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: user42 <user42@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/27 23:01:15 by user42            #+#    #+#              #
#    Updated: 2021/02/28 03:29:44 by user42           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	global ft_strlen

ft_strlen:
	xor rax, rax				; eXclusive OR operation, sets index to 0.
	jmp comparison				; jump to comparison subroutine.

increment:
	inc rax						; increment index.

comparison:
	cmp BYTE [rdi + rax], 0		; compare str[i] to 0.
	jne increment				; if it's not equal to zero, increment.
	ret							; return.