TARGET = name.so
FLAGS = -std=gnu99 -Os -ffast-math -pthread -s -fpic -shared

SOURCE_DIRS =\
src\


INCLUDE_DIRS = $(patsubst %,-I%,$(SOURCE_DIRS))
SOURCES = $(wildcard $(patsubst %,%/*.c,$(SOURCE_DIRS)))
OBJECTS = $(SOURCES:.c=.o)

$(TARGET) : $(OBJECTS)
	$(CC) $(FLAGS) $^ -o $@

%.o : %.c
	$(CC) $(INCLUDE_DIRS) $(FLAGS) -c $< -o $@

clean :
	$(RM) $(OBJECTS) $(TARGET)

.PHONY : clean
