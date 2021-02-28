# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: user42 <user42@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/27 04:34:03 by user42            #+#    #+#              #
#    Updated: 2021/02/28 01:09:04 by user42           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libasm.a

TESTER = tester

SRC_DIR = srcs

SRC = $(SRC_DIR)/ft_strlen.s

INCLUDE_DIR = -I include

INCLUDE = $(INCLUDE_DIR)/libasm.h

OBJ_DIR = objs

OBJ = $(subst $(SRC_DIR),$(OBJ_DIR),$(SRC:.s=.o))

OS := $(shell uname)

ifeq ($(OS), Darwin)
ASSEMBLER = nasm -f macho64 -g
else
ASSEMBLER = nasm -f elf64 -g
endif

CC = gcc

RM = /bin/rm

CFLAGS = -Wall -Wextra -Werror -g -L -lasm

ifeq ($(SANITIZE_L), true)
	CFLAGS += -fsanitize=leak
endif

ifeq ($(SANITIZE_A), true)
	CFLAGS += -fsanitize=address
endif

$(NAME): $(OBJ)
	ar -rcs $(NAME) $(OBJ)
	ranlib $(NAME)

$(OBJ_DIR)/%.o : $(SRC_DIR)/%.s
	mkdir -p $(OBJ_DIR)
	$(ASSEMBLER) $< -o $@

all: $(NAME)

test: $(NAME)
	$(CC) $(CFLAGS) $(SRC_DIR)/main.c $(NAME) -o $(TESTER)

clean: $(RM) $(OBJ)
	$(RM) -rf $(OBJ_DIR)

fclean: clean
	$(RM) -rf $(NAME)
	$(RM) -rf $(TESTER)

re: fclean all

.PHONY: all clean fclean re
