# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strlen.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lcouto <lcouto@student.42sp.org.br>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/27 23:01:15 by user42            #+#    #+#              #
#    Updated: 2021/03/01 17:34:13 by lcouto           ###   ########.fr        #
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