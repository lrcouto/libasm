/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   strlentest.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: user42 <user42@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/02/20 21:19:55 by user42            #+#    #+#             */
/*   Updated: 2021/02/20 21:43:17 by user42           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>

int		strlen_test(char *string)
{
	int		i;
	int		len;

	i = 0;
	len = 0;
	while(string[i++] != '\0')
		len++;
	return (len);
}

int		main(int argc, char **argv)
{
	int	len;

	if (argc != 2)
		printf("One string-shaped argument please. =)\n");
	len = strlen_test(argv[1]);
	printf("String: %s\nLength: %d\n", argv[1], len);
	return (0);
}