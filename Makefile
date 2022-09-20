# Author: Kenneth Wallace
# Makefile for Toolkit 2: Make and Makefiles
# Last Modified: 9-20-2022
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
# Contains the output name for the file
TARGET = employee


### TARGETS

## all
# Using $(TARGET) it will link all object (*.o) files.
# Defines name of output to "employee".
all: 	$(TARGET)

## TARGET
$(TARGET):	main.o Employee.o Officer.o Supervisor.o
	$(CC) $(CFLAGS) -o $(TARGET) main.o Employee.o Officer.o Supervisor.o

## main.o
# Requires main.cpp and all header files.
main.o: 	main.cpp Employee.h Officer.h Supervisor.h
	$(CC) $(CFLAGS) -c main.cpp
  
## Employee.o
# Requires Employee header and implementation files.
Employee.o: 	Employee.cpp Employee.h
	$(CC) $(CFLAGS) -c Employee.cpp

## Officer.o
# Requires Officer header and implementation files along with the Employee header file.
Officer.o: 	Officer.cpp Officer.h Employee.h
	$(CC) $(CFLAGS) -c Officer.cpp

## Supervisor.o
# Requires Supervisor header and implementation files along with the Employee header file.
Supervisor.o: 	Supervisor.cpp Supervisor.h Employee.h
	$(CC) $(CFLAGS) -c Supervisor.cpp

## clean
# Removes all unnecessary files including objects (*.o) and emacs backup (*~) files.
clean:
	$(RM) $(TARGET) -f *.o *~
