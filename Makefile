DEVICE=STM32F103xE

CC = arm-none-eabi-gcc
AR = arm-none-eabi-ar

current_dir = $(shell pwd)

CFLAGS = -g -O0 -mcpu=cortex-m3 -mthumb -Wall -fno-exceptions -ffunction-sections -D$(DEVICE)

INCLUDE = -I$(current_dir)/src
INCLUDE += -I$(current_dir)/cmsis_core/Include
INCLUDE += -I$(current_dir)/cmsis/cmsis_device_f1/Include
INCLUDE += -I$(current_dir)/hal/stm32f1xx_hal_driver/Inc

LINKER = cmsis/cmsis_device_f1/Source/Templates/gcc/linker/STM32F103XE_FLASH.ld
export CC AR CFLAGS INCLUDE

all: 
	make -C ./hal
	make -C ./cmsis
	make -C ./src
	arm-none-eabi-gcc -g $(CFLAGS) $(INCLUDE) -nostdlib -lgcc -T./$(LINKER) -Wl,--gc-section -Wl,-Map=test.map -o test.elf -Wl,--whole-archive src/src.a -Wl,--no-whole-archive cmsis/cmsis.a  hal/hal.a  
	arm-none-eabi-objcopy test.elf test.bin -O binary
	arm-none-eabi-objdump -d test.elf >test.asm
	
clean:
	make -C ./hal clean
	make -C ./cmsis clean
	make -C ./src clean
	@rm -f test.bin test.elf test.map test.asm