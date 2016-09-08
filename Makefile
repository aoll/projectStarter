#******************************************************************************#
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: aollivie <aollivie@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2014/11/14 17:07:06 by aollivie          #+#    #+#              #
#    Updated: 2016/02/03 12:47:52 by aollivie         ###   ########.fr        #
#                                                                              #
#******************************************************************************#


DEBUG=no
CC=gcc

ifeq ($(DEBUG), yes)
				CFLAGS= -Wall -Wextra -g -ansi -pedantic
else
		CFLAGS= -Wall -Wextra -Werror
endif


NAME =project.exe

LIBFT =libft/libft.a

LIB=

I_DIR= -I inc/ -I./libft/inc

O_DIR= obj

MKDIR = mkdir

C_SRC = main.c

VPATH= src
# VPATH= src/str:src/put:src/int:src/mem:src/char:src/file:src/lst


OBJS= $(C_SRC:%.c=$(O_DIR)/%.o)



.PHONY : all clean fclean re

all :
	make -C libft
	make -j $(NAME)

ifeq ($(DEBUG),yes)
				@echo "Generation mode debug"
else
				@echo "Generation mode release"
endif

$(NAME):$(OBJS) $(LIBFT)
				$(CC) $(CFLAGS) $(I_DIR) $^ -o $@ $(LIB)


$(O_DIR)/%.o: %.c
				$(CC) $(CFLAGS) $(I_DIR) -c $< -o $@

$(OBJS): | $(O_DIR)

$(O_DIR):
				$(MKDIR) $(O_DIR)
clean :
		rm -rf $(O_DIR)

fclean : clean
		@rm -rf $(NAME)

re : fclean all
