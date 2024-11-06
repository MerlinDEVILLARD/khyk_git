#include <stdlib.h>
#include <stdbool.h>
#include <string.h>

#include "../includes/struct.h"

bool in_array(char **array, size_t len, char *to_find)
{
    for (size_t i = 0; i < len; i++){
        if (strcmp(array[i], to_find) == 0)
            return true;
    }
    return false;
}

token_t *tokeniser(int ac, char **av)
{
    token_t *tokens = malloc(sizeof(*tokens) * ac);

    for (int i = 0; i < ac; i++){
        if (av[i][0] == '-'){
            continue;
        } else if (in_array){

        } else {

        }
    }
    return tokens;
}

bool lexer(token_t *tokens)
{
    return (true);
}

input_t *parser(int ac, char **av)
{
    input_t *c = malloc(sizeof(*c));

    c->tokens = tokeniser(ac, av);
    if (!lexer(c->tokens))
        return (NULL);
    return (c);
}
