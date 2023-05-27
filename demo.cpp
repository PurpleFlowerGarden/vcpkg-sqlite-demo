#include <stdio.h>
#include <stdlib.h>

#include <sqlite3.h>

int main() {
	printf("Linked Against SQLite3 Version: %s\n", sqlite3_libversion());
	return EXIT_SUCCESS;
}