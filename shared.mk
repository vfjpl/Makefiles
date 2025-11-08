NAME = template.so

DEFINES =
FLAGS = -W -std=gnu99 -Os -ffast-math -pthread -s
CFLAGS = $(FLAGS)
LDFLAGS = $(FLAGS)


SOURCE_DIRS =\


SOURCES = $(wildcard $(patsubst %,%/*.c,$(SOURCE_DIRS)))
OBJECTS = $(SOURCES:.c=.o)

$(NAME) : %(OBJECTS)
	$(CC) $(LDFLAGS) $^ -o $@

%.o : %.c
	$(CC) $(DEFINES) $(CFLAGS) -c $<

clean :
	$(RM) $(OBJECTS) $(NAME)

.PHONY : clean
