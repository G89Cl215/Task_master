# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tgouedar <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/11/05 22:11:12 by tgouedar          #+#    #+#              #
#    Updated: 2019/11/04 20:24:57 by tgouedar         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRCFILE			=	

SRC_DIR			=	sources

HDR_DIR			=	includes \
					../libft/includes \

OBJ_DIR			=	obj
OBJ				=	$(addprefix $(OBJ_DIR)/,$(SRCFILE:.c=.o))

NAME			=	task_master

CC				=	gcc
CFLAGS			=	-Wall -Werror -Wextra -g3
HFLAGS			=	$(addprefix -I ,$(HDR_DIR))
CFLAGS			+=	$(HFLAGS)
.PHONY: all re clean fclean ls

all				: $(NAME)

$(NAME)			: $(OBJ) Makefile
	@ar rc $(NAME) $(OBJ)
	@ranlib $(NAME)
	gcc $(SRC_DIR)/main_test.c maths_module.a ../libft/libft.a $(HFLAGS)
	@echo "Your LIBFT is ready for use."

$(OBJ)			: $(OBJ_DIR)/%.o : $(SRC_DIR)/%.c | $(OBJ_DIR)
	$(CC) $(CFLAGS) -o $(OBJ_DIR)/$*.o -c $<
	@echo "\t\t\t\t\t\t\t\t[OK]\r\t$*"

$(OBJ_DIR)		:
	@/bin/mkdir -p $(OBJ_DIR)


clean			:
	@/bin/rm -Rf $(OBJ_DIR) 2>/dev/null || true

fclean			: clean
	@/bin/rm -f $(NAME)

re				: fclean all
