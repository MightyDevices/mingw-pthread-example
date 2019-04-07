# output name
OUTPUT = pthread_test

# sources
SRC += pthread_test.c


# compiler flags
CC_FLAGS  = -g -O0 -I. -I../common -fdata-sections 
CC_FLAGS += -ffunction-sections -Wl,--gc-sections 
CC_FLAGS += -Wall -Wmissing-field-initializers -Wsign-compare
CC_FLAGS += -Wmissing-parameter-type -Wold-style-declaration
CC_FLAGS += -Woverride-init -Wtype-limits -Wuninitialized
CC_FLAGS += -Wcast-align -Wno-format -D_USE_MATH_DEFINES
CC_FLAGS += -pthread  -DHAVE_STRUCT_TIMESPEC --std=gnu99

# linker flags 
LD_FLAGS  =

# tools
CC = cc
AS = cc
LD = ld
OBC = objcopy
OBD = objdump
NM = nm
SIZE = size
RM = rm
ECHO = echo

# sources converted to objs
OBJ = $(SRC:%.c=%.o)

# generate elf and bin
all: $(OUTPUT).exe size

# generate elf file from objs
$(OUTPUT).exe: $(OBJ)
	@ $(ECHO) ---------------------    Linking   ---------------------
	$(CC) $(CC_FLAGS) $(OBJ) --output $@ $(LD_FLAGS) 


# show size information
size: $(OUTPUT).exe
	@ $(ECHO) --------------------- Section size ---------------------
	$(SIZE) $(OUTPUT).exe

# compile all sources
%.o : %.c
	@ $(ECHO) --------------------- Compiling $< ---------------------
	$(CC) -c $(CC_FLAGS) $< -o $@

# cleanser xD
clean:
	$(RM) -f $(OBJ) $(OUTPUT).exe
