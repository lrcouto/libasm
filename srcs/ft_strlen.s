# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strlen.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: user42 <user42@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/27 23:01:15 by user42            #+#    #+#              #
#    Updated: 2021/02/27 23:13:46 by user42           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	global ft_strlen

ft_strlen:
	xor rax, rax
	jmp comparison

increment:
	inc rax

comparison:
	cmp BYTE [rdi + rax], 0
	jne increment
	ret