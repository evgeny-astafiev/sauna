LIBRARY = hal.a
SOURCES = $(wildcard stm32f1xx_hal_driver/Src/stm32f1xx_hal*.c)
OBJECTS = $(SOURCES:.c=.o)

all: $(SOURCES) $(LIBRARY)
	
$(LIBRARY): $(OBJECTS) 
	$(AR) rcs $(LIBRARY) $(OBJECTS)
		
.c.o:
	$(CC) -c $(CFLAGS) $(INCLUDE) -o $@ $<

clean:
	@rm -f $(OBJECTS) $(LIBRARY)