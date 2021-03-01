# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strcmp.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lcouto <lcouto@student.42sp.org.br>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/28 06:57:53 by user42            #+#    #+#              #
#    Updated: 2021/03/01 17:34:04 by lcouto           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	global ft_strcmp

ft_strcmp:
	xor rax, rax		; eXclusive OR operation, sets return value to 0.
	mov al, BYTE [rdi]	; pointer to current char of first string parameter to al.
	mov bl, BYTE [rsi]	; pointer to current char of second string parameter to bl.
	cmp al, 0x0			; verify if first parameter == 0;
	je exit				; if it is, exit.
	cmp bl, 0x0			; verify if second parameter == 0;
	je exit				; if it is, exit.
	cmp al, bl			; compare the two parameters.
	jne exit			; if they're not equal, exit.
	inc rdi				; increment first parameter.
	inc rsi				; increment second parameter.
	jmp ft_strcmp		; run it again.

exit:
	movzx rax, al		; set rax to first parameter;
	movzx rbx, bl		; set rbx to second parameter;
	sub rax, rbx		; get difference between the two parameters.
	ret					; return.