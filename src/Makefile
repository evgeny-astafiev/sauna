LIBRARY = src.a
SOURCES = $(wildcard *.c)
OBJECTS = $(SOURCES:.c=.o)

all: $(SOURCES) $(LIBRARY)
	
$(LIBRARY): $(OBJECTS) 
	$(AR) rcs $(LIBRARY) $(OBJECTS)
		
.c.o:
	$(CC) -c $(CFLAGS) $(INCLUDE) $< -o $@ 

clean:
	@rm -f $(OBJECTS) $(LIBRARY)