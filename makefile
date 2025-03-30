# Compiler settings
CC = gcc
FC = gfortran

SDL_FLAGS = -lSDL2

# Output binary name
TARGET = app

# Directories
SRC_DIR = src
SRC_BUILD = src/build
FORT_DIR = fort
FORT_BUILD = fort/build

# Find source files
C_SOURCES := $(wildcard $(SRC_DIR)/*.c)
C_OBJECTS := $(patsubst $(SRC_DIR)/%.c,$(SRC_BUILD)/%.o,$(C_SOURCES))

F_SOURCES := $(wildcard $(FORT_DIR)/*.f90)
F_OBJECTS := $(patsubst $(FORT_DIR)/%.f90,$(FORT_BUILD)/%.o,$(F_SOURCES))

# Compiler flags
CFLAGS = -std=c99
FFLAGS = -J$(FORT_BUILD)

# Default target
all: $(TARGET)

# Rule to build the final executable
$(TARGET): $(C_OBJECTS) $(F_OBJECTS)
	$(FC) $(F_OBJECTS) $(C_OBJECTS) -o $(TARGET) $(SDL_FLAGS)

# Compile C files
c: $(C_OBJECTS)

$(SRC_BUILD)/%.o: $(SRC_DIR)/%.c
	@mkdir -p $(SRC_BUILD)
	$(CC) $(CFLAGS) -c $< -o $@

# Compile Fortran files
fortran: $(F_OBJECTS)

$(FORT_BUILD)/%.o: $(FORT_DIR)/%.f90
	@mkdir -p $(FORT_BUILD)
	$(FC) $(FFLAGS) -c $< -o $@

# Clean up
clean:
	rm -rf $(SRC_BUILD)/*.o $(FORT_BUILD)/*.o $(FORT_BUILD)/*.mod $(TARGET)
