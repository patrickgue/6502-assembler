#include <stdio.h>
#include <string.h>
#include <assert.h>

#include "helper.h"

void succ(char *msg)
{
    printf("%-20s [SUCCESS]\n", msg);
}

void test_strtrim()
{
    char buff[] = "    Hello World    ";
    char comp[] = "Hello World";
    strtrim(buff);
    assert(strcmp(buff, comp) == 0);
}

void test_strsepa()
{
    char buff[32] = "Hello World", buff2[32];
    char part_1[32] = "Hello";
    char part_2[32] = "World";
    strsepa(buff, 32, buff2, 32, ' ');
    assert(strcmp(buff, part_1) == 0);
    assert(strcmp(buff2, part_2) == 0);        
}


int main(void)
{
    test_strtrim(); succ("strtrim");
    test_strsepa(); succ("strsepa");
    return 0;
}
