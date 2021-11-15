DEVICE=STM32F103xB

CC = arm-none-eabi-gcc
AR = arm-none-eabi-ar

current_dir = $(shell pwd)

CFLAGS = -g -O0 -mcpu=cortex-m3 -mthumb -Wall -fno-exceptions -ffunction-sections -D$(DEVICE)

INCLUDE = -I$(current_dir)/src
INCLUDE += -I$(current_dir)/cmsis_core/Include
INCLUDE += -I$(current_dir)/cmsis/cmsis_device_f1/Include
INCLUDE += -I$(current_dir)/hal/stm32f1xx_hal_driver/Inc

LINKER = cmsis/cmsis_device_f1/Source/Templates/gcc/linker/STM32F103XB_FLASH.ld
export CC AR CFLAGS INCLUDE

all: 
	make -C ./hal
	make -C ./cmsis
	make -C ./src
	arm-none-eabi-gcc -g $(CFLAGS) $(INCLUDE) -nostdlib -lgcc -T./$(LINKER) -Wl,--gc-section -Wl,-Map=sauna.map -o sauna.elf -Wl,--whole-archive src/src.a -Wl,--no-whole-archive cmsis/cmsis.a hal/hal.a  
	arm-none-eabi-objcopy sauna.elf sauna.bin -O binary
	arm-none-eabi-objdump -d sauna.elf >sauna.asm
	
clean:
	make -C ./hal clean
	make -C ./cmsis clean
	make -C ./src clean
	@rm -f sauna.bin sauna.elf sauna.map sauna.asm