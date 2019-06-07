
SOURCE_DIR = src
OUTPUT_DIR = obj

LIBRARY_SOURCES = $(SOURCE_DIR)/strlen.s
LIBRARY_OBJECTS = $(OUTPUT_DIR)/strlen.o
TEST_SOURCES = $(SOURCE_DIR)/test_strlen_with_return_value.s $(SOURCE_DIR)/test_strlen_with_passed_and_failed_macros.s
TEST_OBJECTS = $(OUTPUT_DIR)/test_strlen_with_return_value.o $(OUTPUT_DIR)/test_strlen_with_passed_and_failed_macros.o

TEST_EXECUTABLE = $(OUTPUT_DIR)/test_strlen.exe

INCLUDES = -Iexternal/testrunner-68k-native-library/asm/include

VASM = ./bin/linux/vasmm68k_mot
VLINK = ./bin/linux/vlink
TESTRUNNER = testrunner-68k

.PHONY: test

test: $(TEST_EXECUTABLE)
	$(TESTRUNNER) $(TEST_EXECUTABLE)

$(OUTPUT_DIR):
	mkdir -p $(OUTPUT_DIR)

$(OUTPUT_DIR)/%.o : $(SOURCE_DIR)/%.s $(OUTPUT_DIR)
	$(VASM) -Fhunk $(INCLUDES) $< -o $@

$(TEST_EXECUTABLE) : $(LIBRARY_OBJECTS) $(TEST_OBJECTS)
	$(VLINK) -b amigahunk $(LIBRARY_OBJECTS) $(TEST_OBJECTS) -o $(TEST_EXECUTABLE)
