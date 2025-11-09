TARGET = name.a
FLAGS = -std=gnu99 -Os -ffast-math -pthread -s

SOURCE_DIRS =\
src\


SOURCES = $(wildcard $(patsubst %,%/*.c,$(SOURCE_DIRS)))
OBJECTS = $(SOURCES:.c=.o)

$(TARGET) : $(OBJECTS)
	$(AR) rcs $@ $^

%.o : %.c
	$(CC) $(FLAGS) -c $< -o $@

clean :
	$(RM) $(OBJECTS) $(TARGET)

.PHONY : clean
