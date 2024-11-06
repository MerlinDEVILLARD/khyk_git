#pragma once

#define NB_IMPLEMENTED = 6

typedef enum token_s {
    COMMAND,
    OPTION,
    ARG,
} token_t;

typedef struct input_s {
    token_t *tokens;
    char *command;
    char *options;
    int nb_options;
    char **args;
} input_t;