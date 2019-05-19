
OUTPUT_DIR = obj

LIBRARY_SOURCES = strlen.s
LIBRARY_OBJECTS = $(OUTPUT_DIR)/strlen.o
TEST_SOURCES = test_strlen.s
TEST_OBJECTS = $(OUTPUT_DIR)/test_strlen.o

TEST_EXECUTABLE = $(OUTPUT_DIR)/test_strlen.exe

VASM = ./bin/linux/vasmm68k_mot
VLINK = ./bin/linux/vlink
TESTRUNNER = testrunner-68k

.PHONY: test

test: $(TEST_EXECUTABLE)
	$(TESTRUNNER) $(TEST_EXECUTABLE)

$(OUTPUT_DIR):
	mkdir -p $(OUTPUT_DIR)

$(OUTPUT_DIR)/%.o : %.s $(OUTPUT_DIR)
	$(VASM) -Fhunk $< -o $@

$(TEST_EXECUTABLE) : $(LIBRARY_OBJECTS) $(TEST_OBJECTS)
	$(VLINK) -b amigahunk $(LIBRARY_OBJECTS) $(TEST_OBJECTS) -o $(TEST_EXECUTABLE)
