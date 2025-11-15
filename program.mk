TARGET = name
FLAGS = -std=gnu99 -Os -ffast-math -pthread -s
LIBS =

SOURCE_DIRS =\
src\


INCLUDE_DIRS = $(patsubst %,-I%,$(SOURCE_DIRS))
SOURCES = $(wildcard $(patsubst %,%/*.c,$(SOURCE_DIRS)))
OBJECTS = $(SOURCES:.c=.o)

$(TARGET) : $(OBJECTS)
	$(CC) $(FLAGS) $^ $(LIBS) -o $@

%.o : %.c
	$(CC) $(INCLUDE_DIRS) $(FLAGS) -c $< -o $@

clean :
	$(RM) $(OBJECTS) $(TARGET)

.PHONY : clean
