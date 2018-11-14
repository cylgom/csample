NAME = zip
CC = gcc
FLAGS = -std=c99 -pedantic -g
FLAGS+= -Wall -Wno-unused-parameter -Wextra -Werror=vla -Werror

BIND = bin
OBJD = obj
SRCD = src
SUBD = sub

INCL = -I$(SRCD)
INCL+= -I$(SUBD)/ctypes
INCL+= -I$(SUBD)/argoat/src

SRCS = $(SRCD)/main.c
SRCS+= $(SUBD)/argoat/src/argoat.c

OBJS:= $(patsubst $(SRCD)/%.c,$(OBJD)/$(SRCD)/%.o,$(SRCS))

.PHONY: all
all: $(BIND)/$(NAME) run

$(OBJD)/%.o: %.c
	@echo "building object $@"
	@mkdir -p $(@D)
	@$(CC) $(INCL) $(FLAGS) -c -o $@ $<

$(BIND)/$(NAME): $(OBJS)
	@echo "compiling executable $@"
	@mkdir -p $(@D)
	@$(CC) -o $@ $^ $(LINK)

run:
	./$(BIND)/$(NAME)

clean:
	@echo "cleaning"
	@rm -rf $(BIND) $(OBJD)
