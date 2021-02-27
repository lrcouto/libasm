# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: user42 <user42@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/27 04:34:03 by user42            #+#    #+#              #
#    Updated: 2021/02/27 21:38:03 by user42           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libasm.a

TESTER = tester

SRC_DIR = srcs

SRC = $(SRC_DIR)/ft_strlen.s

INCLUDE_DIR = -I include

INCLUDE = $(INCLUDE_DIR)/libasm.h

OBJ_DIR = objs

OBJ = $(patsubst %.s, ${OBJ_DIR}/%.o, ${SRC})

OS := $(shell uname)

ifeq ($(OS), Darwin)
ASM_COMPILER = nasm -f macho64 -g
else
ASM_COMPILER = nasm -f elf64 -g
endif

CC = gcc

CFLAGS = -Wall - Wextra -Werror -lasm -L . -g3

ifeq ($(SANITIZE_L), true)
	CFLAGS += -fsanitize=leak
endif

ifeq ($(SANITIZE_A), true)
	CFLAGS += -fsanitize=address
endif

RM = rm -rf

all: $(NAME)

$(OBJ_DIR)/%.o :	$(SRC_DIR)/%.s
					@mkdir -p $(OBJ_DIR)
					@$(ASM_COMPILER) $< -o $@

$(NAME):	$(OBJ)
			@ar -rcs $(NAME) $(OBJ)

test:		$(NAME) ${SRC_DIR}/main.c
			$(CC) $(CFLAGS) $(INCLUDE) -o $(TESTER)

clean:		@$(RM) $(OBJ)
			@$(RM) $(OBJ_DIR)

fclean:		clean
			@$(RM) $(NAME)
			@$(RM) $(TESTER)

re:			fclean all

.PHONY:		all clean fclean re
