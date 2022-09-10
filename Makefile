# Author: Kenneth Wallace
# Makefile for Toolkit 2: Make and Makefiles
# Last Modified: 9-9-2022
#
# Used for quickly and automatically compiling an executable.
#
# Type 'make' to create an executable for testing called "employee".


### VARIABLES

## Compiler variable
CC = g++

## Compiler Flag variable
# Compile with debugging features and all errors + warnings.
CFLAGS = -g -Wall -Wextra

## Target Flag variable
# Defines name of output to "employee" and contains all targets to fully compile.
# !! If adding more methods, implement them in methods and add them here so they are compiled. !!
TARGET = -o employee main.o Employee.o Officer.o Supervisor.o

## Remove Flag variable
RM = rm -i


### METHODS

## Default entry
# Sets the default method to be called when typing 'make'.
default: all

## all
# Using $(TARGET) it will link all object (*.o) files into an executable called "all".
all:
	$(CC) $(CFLAGS) $(TARGET)

## main.o
# Requires main.cpp and all header files.
main.o: main.cpp Employee.h Officer.h Supervisor.h
	$(CC) $(CFLAGS) -c main.cpp
  
## Employee.o
# Requires Employee header and implementation files.
Employee.o: Employee.cpp Employee.h

## Officer.o
# Requires Officer header and implementation files along with the Employee header file.
Officer.o: Officer.cpp Officer.h Employee.h

## Supervisor.o
# Requires Supervisor header and implementation files along with the Employee header file.
Supervisor.o: Supervisor.cpp Supervisor.h Employee.h

## clean
# Removes all unnecessary files including objects (*.o) and emacs backup (*~) files.
clean:
	$(RM) *.o *~
