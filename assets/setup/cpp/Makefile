# Compiler and Linker Flags.
CC := g++
CFLAGS := -std=c++11 -g -O3 -Wall -Werror
LFLAGS := -L/usr/local -L lib
SRCEXT := cc

# Load Sources.
SRC := src
BIN := bin
INC := -I include -I ./src
LIB := -L lib
BUILD := build

SOURCES := $(shell find $(SRC) -type f -name *.$(SRCEXT) ! -path "*/main/*")
OBJECTS := $(patsubst $(SRC)/%.$(SRCEXT),$(BUILD)/%.o,$(SOURCES))

# Define Build Targets.
EXAMPLE_TARGET := $(BIN)/example
EXAMPLE_RUNNER := $(BUILD)/main/example.o

# Load Tests.
TEST := test
TLIB := $(LIB) -phtread -L lib -lgmock

TSOURCES := $(shell find $(TEST) -type f -name *.$(SRCEXT))
TOBJECTS := $(filter-out $(BUILD)/*.o, $(OBJECTS))

# Define Test Target.
TEST_TARGET := $(BIN)/tests

# All
all: $(EXAMPLE_TARGET)

# Link Example Target. (bin/example)
$(EXAMPLE_TARGET): $(EXAMPLE_RUNNER) $(OBJECTS)
	@mkdir -p $(BIN)
	$(CC) $^ -o $@ $(LFLAGS) $(LIB)

# Compile (*.o)
$(BUILD)/%.o: $(SRC)/%.$(SRCEXT)
	@mkdir -p $(BUILD)
	@mkdir -p $(@D)
	$(CC) $(CFLAGS) $(INC) -c -o $@ $<

# Clean
clean:
	$(RM) -r $(BUILD) $(BIN)

# Tester
test: $(OBJECTS)
	@echo " $(TOBJECTS)"
	$(CC) $(CFLAGS) $(TSOURCES) $(TOBJECTS) $(INC) $(LFLAGS) $(TLIB) -o $(TEST_TARGET)

.PHONY: clean
