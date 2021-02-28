/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: user42 <user42@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/02/27 23:23:07 by user42            #+#    #+#             */
/*   Updated: 2021/02/28 05:12:43 by user42           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../include/libasm.h"

void	test_strcpy(void)
{
	char oa[14];
	char ma[14];
	char ob[1];
	char mb[1];
	char oc[827];
	char mc[827];

	printf("============\nTesting FT_STRCPY\n============\n\n");
	printf("*****\nBasic test:\n*****\n");
	printf("\nSTRING: 'Hello, World!'\n\nOriginal strcpy: %s\nft_strcpy: %s\n",
	strcpy(oa, "Hello, World!"), ft_strcpy(ma,"Hello, World!"));
	printf("\n\n");
	printf("*****\nEmpty string test:\n*****\n");
	printf("\nSTRING: ''\n\nOriginal strcpy: %s\nft_strcpy: %s\n",
	strcpy(ob, ""), ft_strcpy(mb, ""));
	printf("\n\n");
	printf("*****\nVery long string test:\n*****\n");
	printf("\nSTRING: '%s'\n\nOriginal strcpy: %s\n\nft_strcpy: %s\n",
	LIPSUM, strcpy(oc, LIPSUM), ft_strcpy(mc, LIPSUM));
	printf("\n\n");
}

int		main(void)
{

	printf("============\nTesting FT_STRLEN\n============\n\n");
	printf("*****\nBasic test:\n*****\n");
	printf("\nSTRING: 'Hello, World!'\n\nOriginal strlen: %zu\nft_strlen: %zu\n",
	strlen("Hello, World!"), ft_strlen("Hello, World!"));
	printf("\n\n");
	printf("*****\nEmpty string test:\n*****\n");
	printf("\nSTRING: ''\n\nOriginal strlen: %zu\nft_strlen: %zu\n",
	strlen(""), ft_strlen(""));
	printf("\n\n");
	printf("*****\nVery long string test:\n*****\n");
	printf("\nSTRING: '%s'\n\nOriginal strlen: %zu\nft_strlen: %zu\n",
	LIPSUM, strlen(LIPSUM), ft_strlen(LIPSUM));
	printf("\n\n");
	test_strcpy();
	return (0);
}