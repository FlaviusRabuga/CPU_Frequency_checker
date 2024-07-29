# Compiler and assembler
CC = gcc
ASM = nasm

# Compiler and assembler flags
CFLAGS = -std=c11 -Wall -Wextra -O2 -D_POSIX_C_SOURCE=199309L
ASMFLAGS = -f elf64

# Output executable
TARGET = cpufreq

# Source files
CFILES = main.c
ASMFILES = SpinALot64.asm

# Object files
COBJECTS = $(CFILES:.c=.o)
ASMOBJECTS = $(ASMFILES:.asm=.o)
OBJECTS = $(COBJECTS) $(ASMOBJECTS)

# Default target
all: $(TARGET)

# Link object files to create the executable
$(TARGET): $(OBJECTS)
	$(CC) $(OBJECTS) -o $(TARGET) -lpthread

# Compile C source files to object files
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# Assemble assembly source files to object files
%.o: %.asm
	$(ASM) $(ASMFLAGS) $< -o $@

# Clean up generated files
clean:
	rm -f $(OBJECTS) $(TARGET)

.PHONY: all clean
