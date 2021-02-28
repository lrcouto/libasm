/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   libasm.h                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: user42 <user42@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/02/27 22:30:18 by user42            #+#    #+#             */
/*   Updated: 2021/02/28 05:09:56 by user42           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef LIBASM_H
# define LIBASM_H

# include <sys/types.h>
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

#endif