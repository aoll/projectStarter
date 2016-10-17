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


DEBUG=yes
CC=gcc

ifeq ($(DEBUG), yes)
				CFLAGS= -Wall -Wextra # -g -ansi -pedantic
else
		CFLAGS= -Wall -Wextra -Werror
endif


NAME =project.exe

LIBFT =libft/libft.a

LIB_TEST_PROJECT= test_project/test_file/lib_test_project.a

LIB_UNIT_TEST=test_project/unit_test/lib_unit_test.a


LIB=

I_DIR= -I inc/ -I./libft/inc -I./test_project/unit_test/inc -I./test_project/test_file/inc

O_DIR= obj

MKDIR = mkdir

C_SRC = main.c

ST_SRC= ft_start.c

UC_SRC = main_test.c

ifeq ($(DEBUG), yes)
	MC_SRC = $(UC_SRC)
else
	MC_SRC = $(C_SRC)
endif

# VPATH= src
VPATH= src:test_project/test_file/src
# VPATH= src/str:src/put:src/int:src/mem:src/char:src/file:src/lst


OBJS= $(MC_SRC:%.c=$(O_DIR)/%.o) $(ST_SRC:%.c=$(O_DIR)/%.o)



.PHONY : all clean fclean re

all :
	make -C libft
	make -C test_project/test_file
	make -j $(NAME)

ifeq ($(DEBUG),yes)
				@echo "Generation mode debug"
else
				@echo "Generation mode release"
endif

$(NAME):$(OBJS)
				$(CC)  $(CFLAGS) $(I_DIR) $^ $(LIB_TEST_PROJECT) $(LIB_UNIT_TEST) $(LIBFT) -o $@ $(LIB)


$(O_DIR)/%.o: %.c
				$(CC) $(CFLAGS) $(I_DIR) -c $< -o $@

$(OBJS): | $(O_DIR)

$(O_DIR):
				$(MKDIR) $(O_DIR)
clean :
		rm -rf $(O_DIR)
		make clean -C libft
		make clean -C test_project/test_file
		make clean -C test_project/unit_test

fclean : clean
		@rm -rf $(NAME)
		make fclean -C libft
		make fclean -C test_project/test_file
		make fclean -C test_project/unit_test

re : fclean all
