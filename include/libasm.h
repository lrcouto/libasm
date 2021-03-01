/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   libasm.h                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: lcouto <lcouto@student.42sp.org.br>        +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/02/27 22:30:18 by user42            #+#    #+#             */
/*   Updated: 2021/03/01 18:20:00 by lcouto           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef LIBASM_H
# define LIBASM_H

# include <sys/types.h>
# include <sys/stat.h>
# include <fcntl.h>
# include <stdlib.h>
# include <sys/errno.h>
# include <unistd.h>
# include <string.h>
# include <stdio.h>

#define LIPSUM  "Lorem ipsum dolor sit amet, consectetur adipiscing elit.\n\
Sed varius sed lacus quis imperdiet. Curabitur et malesuada enim. \nFusce rutrum\
arcu tincidunt metus fermentum aliquam. Suspendisse vel ornare ante.\n\
Sed consectetur ultrices turpis sed iaculis. Curabitur vel rhoncus nisl.\n\
Donec ut orci lacinia, fringilla mi vitae, volutpat libero.\n\
Ut in nulla sit amet magna feugiat cursus quis at elit.\n\
Pellentesque habitant morbi tristique senectus et netus et\n\
malesuada fames ac turpis egestas. Proin quis bibendum nisi,\
quis auctor nibh.\nVestibulum in urna dignissim, egestas dolor vitae,\
consequat justo.\nNullam in nisi congue, pellentesque lectus in,\n\
condimentum ante. Curabitur placerat libero in tellus dapibus,\n\
sed eleifend neque volutpat.\n\
Proin suscipit magna magna, et tempor dui posuere quis.\n\
Sed porta a lectus quis ultrices."

size_t	ft_strlen(const char *s);
char	*ft_strcpy(char *dest, const char *src);
int		ft_strcmp(const char *str1, const char *str2);
size_t	ft_write(int fd, void* buf, size_t cnt);
size_t	ft_read(int fd, const void* buf, size_t cnt);
char	*ft_strdup(const char *string);

#endif