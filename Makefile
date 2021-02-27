# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: user42 <user42@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/27 04:34:03 by user42            #+#    #+#              #
#    Updated: 2021/02/27 05:34:23 by user42           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libasm.a

SRC_DIR = srcs

SRC = $(SRC_DIR)/ft_strlen.s

INCLUDE_DIR = include

INCLUDE = $(INCLUDE_DIR)/libasm.h

OBJ_DIR = objs

OBJ = $(subst $(SRC_DIR), $(OBJ_DIR), $(SRC:.s=.o))

OS := $(shell uname)

ifeq ($(OS), Darwin)
ASM_COMPILER = nasm -f macho64 -g
else
ASM_COMPILER = nasm -f elf64 -g
endif

CC = gcc

CFLAGS = -Wall - Wextra -Werror

all: 