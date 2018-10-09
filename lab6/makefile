################################
##        Program config
################################
PROJECT_NAME    = Modeling_lab6
BUILD_DIR 		= build
SOURCE_DIR 		= .
INC_DIR 		= .
OUT_DIR 		= out

################################
##        Source config
################################
SOURCE          = 
SOURCE          += main.cpp
SOURCE          += AJIOB_random.cpp
SOURCE          += model.cpp
SOURCE          += state.cpp
SOURCE          += channel.cpp
SOURCE          += source.cpp

################################
##        Flags config
################################
CFLAGS          =
CFLAGS          += -std=c++11
CFLAGS          += -Wall -Wpedantic -Werror

################################
##        Print config
################################
LDPRINT         = "Link   $@"
CCPRINT         = "Build  $<"

################################
##        Auto config
################################
OBJECTS         = $(addprefix $(BUILD_DIR)/, $(SOURCE:.cpp=.o))
CFLAGS          += -I $(INC_DIR)
PROJECT			= $(OUT_DIR)/$(PROJECT_NAME)

################################
##        Make config
################################
.DEFAULT_GOAL := all

################################
##           Targets
################################
all: clean build

build: $(PROJECT)

$(PROJECT): $(OBJECTS)
	@mkdir -p $(dir $@)
	@echo $(LDPRINT)
	@$(CXX) -o $@ $(OBJECTS)

$(BUILD_DIR)/%.o: $(SOURCE_DIR)/%.cpp
	@mkdir -p $(dir $@)
	@echo $(CCPRINT)
	@$(CXX) -c $(CFLAGS) $< -o $@

clean:
	@rm -rf $(BUILD_DIR)
	@rm -rf $(OUT_DIR)

run:
	@$(PROJECT)
