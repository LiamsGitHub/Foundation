/* Memory configuration for STM32F100C8 */
/* 8th Sept 2017. Works with NanoLib */


StackSize = 1000;
HeapSize = 5000;

MEMORY
{
  	SRAM (rwx) 	: ORIGIN = 0x20000000, LENGTH = 8K
  	FLASH (rx)  : ORIGIN = 0x00000000, LENGTH = 64K

}

SECTIONS {

	. = ORIGIN(FLASH);

	.text :
	{
		*(.vectors)			/* Vector table */
		*(.text*)				/* Program code */
		*(.rodata*)
	} >FLASH

	.data :
	{
		sram_datastart = .;
		*(.data*)
		sram_dataend = .;
	} >SRAM AT >FLASH

    flash_datastart = LOADADDR(.data);
    data_size = sram_dataend - sram_datastart;

	.bss :
	{
		__bss_start__ = .;
		*(.bss*)
		__bss_end__ = .;
	} >SRAM
	
	bss_size = __bss_end__ - __bss_end__;
	

	end = . ; 					/* Required for _sbrk */

	__HeapBase = .;
	__HeapLimit = __HeapBase + HeapSize;
		
	__stack_base__ = ORIGIN(SRAM) + LENGTH(SRAM);

}

