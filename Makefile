ECHO := /bin/echo
DEFAULT_ := \e[0m
BOLD_ := \e[1m
RED_ := \e[31m
GREEN_ := \e[32m
CYAN_ := \e[36m

# Compilation
CC = gcc
CFLAGS = -W -Wall -Wextra -g3 -I includes -lm
LDLIBS = -L lib -lm
CRITERION = -lcriterion --coverage -I includes
SRC =	$(wildcard src/*.c)
OBJ = $(SRC:.c=.o)
EXEC = Kgit 

all: $(EXEC)

$(EXEC): $(OBJ)
	@$(CC) -o $@ $^ $(LDLIBS) -g3 && \
	$(ECHO) -e "\n[$(GREEN_)✔$(DEFAULT_)] COMPILED : \
	$(GREEN_)$(BOLD_)$(EXEC)$(DEFAULT_)\n" || \
	$(ECHO) -e "\n[$(RED_)✘$(DEFAULT_)]$(RED_)$(BOLD_) \
	BUILD FAILED$(DEFAULT_)\n"

%.o: %.c
	$(CC) -o $@ -c $< $(CFLAGS)

unit_tests:
	$(CC) -o unit_tests $(TEST_SRC) $(CRITERION) $(LDLIBS)

tests_run: unit_tests
	./unit_tests

clean:
	@for file in $(OBJ); do \
		$(ECHO) -e "[$(CYAN_)src$(DEFAULT_)] [\
$(RED_)$(BOLD_)DELETED$(DEFAULT_)] $$file"; \
		rm -rf $$file; \
	done

fclean: clean
	@$(ECHO) -e "[$(CYAN_).$(DEFAULT_)] [$(RED_)$(BOLD_)DELETED\
$(DEFAULT_)] $(EXEC)"
	@rm -f $(EXEC)
	@rm -f unit_tests *.gcda *.gcno
	@$(ECHO) -e "\n[$(CYAN_)$(BOLD_)INFO$(DEFAULT_)] \
ALL FILES DELETED$(DEFAULT_)\n"

re: fclean all
	@make clean -s

.PHONY: clean fclean re