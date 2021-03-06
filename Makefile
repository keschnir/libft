# ************************************************************************** #
#                                                          LE - /            #
#                                                              /             #
#   Makefile                                         .::    .:/ .      .::   #
#                                                 +:+:+   +:    +:  +:+:+    #
#   By: fablin <fablin@student.42.fr>              +:+   +:    +:    +:+     #
#                                                 #+#   #+    #+    #+#      #
#   Created: 2017/11/28 17:35:55 by fablin       #+#   ##    ##    #+#       #
#   Updated: 2018/10/03 18:53:33 by fablin      ###    #+. /#+    ###.fr     #
#                                                         /                  #
#                                                        /                   #
# ************************************************************************** #

SRC_DIR =	./src/

PRINTF_DIR = ./src/ft_printf/

OBJ_DIR =	./obj/

INC_DIR =	./inc/

NAME =		libft.a

FT_PRINTF =	ft_constuctors.c	ft_destructors.c	ft_parse.c	ft_printf.c	\
			ft_format_setters.c	ft_itoa_type.c		ft_preci_tostring.c		\
			ft_ptoa.c			ft_strgen.c			ft_puttostring.c		\
			ft_unicode.c		ft_type_tostring.c	ft_width_tostring.c		\
			ft_flags_tostring.c	ft_format_setters_ext.c						\
			ft_itoa_type_ext.c	ft_type_tostring_ext.c
			

FABLIN =	ft_exit.c		ft_realloc.c	ft_lstpush.c	ft_lstdup.c		\
			ft_swapptr.c	get_next_line.c	ft_strjoinfree.c				\
			ft_itoa_base.c	ft_abs.c		ft_strtolower.c	ft_strrealloc.c	\
			ft_bresenham.c	ft_grid.c		ft_point.c		ft_segment.c	\
			ft_ntree.c		ft_strfreejoin.c				ft_lstlen.c

BONUS =		ft_lstnew.c		ft_lstdelone.c	ft_lstdel.c		ft_lstadd.c		\
			ft_lstiter.c	ft_lstmap.c

CFILES =	ft_memset.c		ft_strcat.c		ft_isdigit.c	ft_striter.c	\
			ft_putchar.c 	ft_bzero.c		ft_strncat.c	ft_isalnum.c	\
			ft_striteri.c	ft_putstr.c		ft_memcpy.c		ft_strlcat.c	\
			ft_isascii.c	ft_strmap.c		ft_putendl.c	ft_memccpy.c	\
			ft_strchr.c		ft_isprint.c	ft_strmapi.c	ft_putnbr.c		\
			ft_memmove.c	ft_strrchr.c	ft_toupper.c	ft_strequ.c		\
			ft_putchar_fd.c	ft_memchr.c		ft_strstr.c		ft_tolower.c	\
			ft_strnequ.c	ft_putstr_fd.c	ft_memcmp.c		ft_strnstr.c	\
			ft_memalloc.c	ft_strsub.c		ft_putendl_fd.c	ft_strlen.c		\
			ft_strcmp.c		ft_memdel.c		ft_strjoin.c	ft_putnbr_fd.c	\
		 	ft_strdup.c		ft_strncmp.c	ft_strnew.c		ft_strtrim.c	\
			ft_strcpy.c		ft_atoi.c		ft_strdel.c		ft_strsplit.c	\
			ft_strncpy.c	ft_isalpha.c	ft_strclr.c		ft_itoa.c		\
			$(BONUS)		$(FABLIN)

SOURCES =	$(addprefix $(SRC_DIR), $(CFILES)) $(addprefix $(PRINTF_DIR), $(FT_PRINTF))

OFILES =	$(CFILES:.c=.o) $(FT_PRINTF:.c=.o)

OBJECTS =	$(addprefix $(OBJ_DIR), $(OFILES))

FLAGS =		-Wall -Wextra -Werror

all : $(NAME)

$(NAME) : obj $(OBJECTS)
	ar rc $(NAME) $(OBJECTS)
	@echo "===> LIBFT HAS BEEN COMPILED <==="

$(OBJ_DIR)%.o : $(SRC_DIR)%.c
	gcc $(FLAGS) -c $< -o $@ -I $(INC_DIR)

$(OBJ_DIR)%.o : $(PRINTF_DIR)%.c
	gcc $(FLAGS) -c $< -o $@ -I $(INC_DIR)

obj :
	@mkdir -p $(OBJ_DIR)

clean : obj
	@rm -rf $(OBJ_DIR)

fclean : clean
	@rm -rf $(NAME)
	@rm -rf $(OBJ_DIR)

re : fclean all

.PHONY: all clean fclean re obj
