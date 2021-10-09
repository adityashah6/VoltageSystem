/**
 * Name: "main.c"
 *
 * Description: This file drives the main program.
 * 
 * Author: Aditya Shah
 *         adityashah@csu.fullerton.edu
 * 
 *                     GNU GENERAL PUBLIC LICENSE
 *                       Version 3, 29 June 2007
 * 
 * Copyright (C) 2007 Free Software Foundation, Inc. <https://fsf.org/>
 * Everyone is permitted to copy and distribute verbatim copies
 * of this license document, but changing it is not allowed.
 */

#include <stdio.h>

char* ohm(void);

int main()
{
	printf("Welcome to High High Voltage System Programming brought to you by Aditya Shah.\n");
	char* name = ohm();
	printf("Goodbye, %s. Have a nice research party.\n", name);
	printf("A zero will be returned to the operating system.\n");
	return 0;
}

// Copyright 2021 Aditya Shah