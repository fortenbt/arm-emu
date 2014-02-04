BUILD_DIR:=build
OBJ_DIR:=$(BUILD_DIR)/obj
BIN_DIR:=$(BUILD_DIR)/bin
SRC_DIR:=src

BIN:=$(BIN_DIR)/armemu

SOURCES:=main.c
SOURCES:=$(addprefix $(SRC_DIR)/, $(SOURCES))

OBJECTS:=$(notdir $(SOURCES:.c=.o))
OBJECTS:=$(addprefix $(OBJ_DIR)/, $(OBJECTS))

DARMLIB_DIR:=lib/darmlib
DARMLIB:=$(DARMLIB_DIR)/libdarm.a

INC_DIR:=$(DARMLIB_DIR)

CFLAGS+=-I$(INC_DIR)

.PHONY: all
all: $(BIN)

$(BIN): $(OBJECTS) | $(BIN_DIR)
	$(CC) $(LDFLAGS) $(OBJECTS) $(DARMLIB) -o $@

vpath %.c $(SRC_DIR)
$(OBJECTS): | $(BUILD_DIR) $(OBJ_DIR)

$(OBJ_DIR)/%.o : %.c
	@echo $<
	@$(CC) -c $(CFLAGS) $< -o $@

$(BUILD_DIR):
	mkdir -p $@

$(OBJ_DIR):
	mkdir -p $@

$(BIN_DIR):
	mkdir -p $@

.PHONY: clean
clean:
	@rm -rf $(BUILD_DIR)
	@echo -e "Project cleaned."
