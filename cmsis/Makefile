LIBRARY = cmsis.a
A_SOURCES = cmsis_device_f1/Source/Templates/gcc/startup_stm32f103xe.s
С_SOURCES =

A_OBJECTS=$(A_SOURCES:.s=.o)
C_OBJECTS=$(C_SOURCES:.c=.o)

all: $(A_SOURCES) $(C_SOURCES) $(LIBRARY)
	
$(LIBRARY): $(C_OBJECTS) $(A_OBJECTS) 
	$(AR) rcs $(LIBRARY) $(C_OBJECTS) $(A_OBJECTS)
		
.c.o:
	$(CC) -c $(CFLAGS) $(INCLUDE) -o $@ $<

.s.o:
	$(CC) -c $(CFLAGS) -o $@ $<
	
clean:
	@rm -f $(C_OBJECTS) $(A_OBJECTS) $(LIBRARY)