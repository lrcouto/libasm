/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: lcouto <lcouto@student.42sp.org.br>        +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/02/27 23:23:07 by user42            #+#    #+#             */
/*   Updated: 2021/03/01 20:37:04 by lcouto           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../include/libasm.h"

static void	test_strdup(void)
{
	char	*ret1;
	char	*ret2;

	printf("===================\nTesting FT_STRDUP\n===================\n\n");
	printf("*****\nBasic test:\n*****\n");
	ret1 = strdup("Hello, World!");
	ret2 = ft_strdup("Hello, World!");
	printf("\nSTRING: 'Hello, World!'\n\n");
	printf("Original strdup: %s\n", ret1);
	printf("errno: %d - %s\n\n", errno, strerror(errno));
	printf("ft_strdup: %s\n", ret2);
	printf("errno: %d - %s\n\n", errno, strerror(errno));
	printf("\n\n");
	free(ret1);
	free(ret2);
	printf("*****\nEmpty string test:\n*****\n");
	ret1 = strdup("");
	ret2 = ft_strdup("");
	printf("\nSTRING: ''\n\n");
	printf("Original strdup: %s\n", ret1);
	printf("errno: %d - %s\n\n", errno, strerror(errno));
	printf("ft_strdup: %s\n", ret2);
	printf("errno: %d - %s\n\n", errno, strerror(errno));
	printf("\n\n");
	free(ret1);
	free(ret2);
	printf("*****\nVery long string test:\n*****\n");
	ret1 = strdup(LIPSUM);
	ret2 = ft_strdup(LIPSUM);
	printf("\nSTRING: %s\n\n", LIPSUM);
	printf("Original strdup: %s\n", ret1);
	printf("errno: %d - %s\n\n", errno, strerror(errno));
	printf("ft_strdup: %s\n", ret2);
	printf("errno: %d - %s\n\n", errno, strerror(errno));
	printf("\n\n");
	free(ret1);
	free(ret2);
}

static void	test_read(void)
{
	int		fd1;
	int		fd2;
	size_t	ret;
	char	buffer[1024];

	fd1 = open("readtext.txt", O_RDONLY);
	fd2 = open("readtext.txt", O_RDONLY);
	memset(buffer, 0, 1024);
	printf("===================\nTesting FT_READ\n===================\n\n");
	printf("*****\nReading from STDIN:\n*****\n");
	printf("Original read:\n");
	ret = read(1, buffer, 1024);
	printf("You wrote: %sReturn value: %zu\n", buffer, ret);
	printf("errno: %d - %s\n\n", errno, strerror(errno));
	printf("ft_read:\n");
	ret = ft_read(1, buffer, 1024);
	printf("You wrote: %sReturn value: %zu\n", buffer, ret);
	printf("errno: %d - %s\n\n", errno, strerror(errno));
	printf("\n\n");
	printf("*****\nReading from a file:\n*****\n");
	printf("Original read:\n");
	ret = read(fd1, buffer, 1024);
	printf("%s\nReturn value: %zu\n", buffer, ret);
	printf("errno: %d - %s\n\n", errno, strerror(errno));
	printf("ft_read:\n");
	ret = ft_read(fd2, buffer, 1024);
	printf("%s\nReturn value: %zu\n", buffer, ret);
	printf("errno: %d - %s\n\n", errno, strerror(errno));
	close(fd1);
	close(fd2);
	printf("\n\n");
}

static void	test_write(void)
{
	int		fd1;
	int		fd2;
	size_t	ret;
	
	fd1 = open("write.txt", O_CREAT | O_WRONLY | O_TRUNC, 0666);
	fd2 = open("ft_write.txt", O_CREAT | O_WRONLY | O_TRUNC, 0666);
	printf("===================\nTesting FT_WRITE\n===================\n\n");
	printf("*****\nWriting on STDOUT:\n*****\n");
	printf("\nTEXT: 'Lorem ipsum dolor sit amet'\n\n");
	printf("Original write:\n");
	ret = write(1,"Lorem ipsum dolor sit amet", 26);
	printf(" | return value: %zu\n", ret);
	printf("errno: %d - %s\n\n", errno, strerror(errno));
	printf("ft_write:\n");
	ret = ft_write(1,"Lorem ipsum dolor sit amet", 26);
	printf(" | return value: %zu\n", ret);
	printf("errno: %d - %s\n\n", errno, strerror(errno));
	printf("\n\n");
	printf("*****\nWriting to an external file:\n*****\n");
	printf("\nTEXT: 'Lorem ipsum dolor sit amet'\n\n");
	printf("Check your files for write.txt");
	ret = write(fd1,"Lorem ipsum dolor sit amet", 26);
	printf(" | return value: %zu\n", ret);
	printf("errno: %d - %s\n\n", errno, strerror(errno));
	printf("Check your files for ft_write.txt");
	ret = ft_write(fd2,"Lorem ipsum dolor sit amet", 26);
	printf(" | return value: %zu\n", ret);
	printf("errno: %d - %s\n\n", errno, strerror(errno));
	close(fd1);
	close(fd2);
	printf("\n\n");
}

static void	test_strcmp(void)
{
	const char a[] = "Lorem";
	const char b[] = "Lorem ipsum dolor sit amet";

	printf("===================\nTesting FT_STRCMP\n===================\n\n");
	printf("*****\nBasic test 1:\n*****\n");
	printf("\nSTRING 1: 'Lorem' | STRING 2 : 'Lorem ipsum dolor sit amet'\n\n");
	printf("Original strcmp: %d\nft_strcmp: %d\n", strcmp(a, b), ft_strcmp(a, b));
	printf("\n\n");
	printf("*****\nBasic test 2:\n*****\n");
	printf("\nSTRING 1: 'Lorem ipsum dolor sit amet' | STRING 2 : 'Lorem'\n\n");
	printf("Original strcmp: %d\nft_strcmp: %d\n", strcmp(b, a), ft_strcmp(b, a));
	printf("\n\n");
	printf("*****\nStrings are the same:\n*****\n");
	printf("\nSTRING 1: 'Lorem' | STRING 2 : 'Lorem'\n\n");
	printf("Original strcmp: %d\nft_strcmp: %d\n", strcmp(a, a), ft_strcmp(a, a));
	printf("\n\n");
	printf("*****\nFirst string is empty:\n*****\n");
	printf("\nSTRING 1: '' | STRING 2 : 'Lorem'\n\n");
	printf("Original strcmp: %d\nft_strcmp: %d\n", strcmp("", a), ft_strcmp("", a));
	printf("\n\n");
	printf("*****\nSecond string is empty:\n*****\n");
	printf("\nSTRING 1: 'Lorem' | STRING 2 : ''\n\n");
	printf("Original strcmp: %d\nft_strcmp: %d\n", strcmp(a, ""), ft_strcmp(a, ""));
	printf("\n\n");
	printf("*****\nBoth strings are empty:\n*****\n");
	printf("\nSTRING 1: '' | STRING 2 : ''\n\n");
	printf("Original strcmp: %d\nft_strcmp: %d\n", strcmp("", ""), ft_strcmp("", ""));
	printf("\n\n");
}

static void	test_strcpy(void)
{
	char oa[14];
	char ma[14];
	char ob[1];
	char mb[1];
	char oc[827];
	char mc[827];

	printf("===================\nTesting FT_STRCPY\n===================\n\n");
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

static void	test_strlen(void)
{
	printf("\n===================\nTesting FT_STRLEN\n===================\n\n");
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
}

int			main(void)
{
	test_strlen();
	test_strcpy();
	test_strcmp();
	test_write();
	test_read();
	test_strdup();
	return (0);
}