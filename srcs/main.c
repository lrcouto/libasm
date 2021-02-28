/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: user42 <user42@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/02/27 23:23:07 by user42            #+#    #+#             */
/*   Updated: 2021/02/27 23:40:53 by user42           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../include/libasm.h"

int		main(void)
{
	printf("Testing ft_strlen:\n");
	printf("STRING: 'Hello, World!'\nOriginal strlen: %zu\nft_strlen: %zu\n",
	strlen("Hello, World!"), ft_strlen("Hello, World!"));
	return (0);
}