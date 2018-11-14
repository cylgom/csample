#include "argoat.h"
#include "ctypes.h"
#include <stddef.h>
#include <stdio.h>

#define ARG_COUNT 3

void arg_unflagged(void* data, char** pars, const int pars_count)
{
}

void arg_help(void* data, char** pars, const int pars_count)
{
	printf("rtfm\n");
}

int main(int argc, char** argv)
{
	char* unflagged[32];

	const struct argoat_sprig sprigs[ARG_COUNT] =
	{
		{NULL, 0, NULL, arg_unflagged},
		{"help", 0, NULL, arg_help},
		{"h", 0, NULL, arg_help}
	};

	struct argoat args = {sprigs, ARG_COUNT, unflagged, 0, 32};
	argoat_graze(&args, argc, argv);

	return 0;
}
