/* Memory configuration for STM32F100C8 and STM32F103C8 */

ENTRY(main)

MEMORY
{
  	SRAM (rwx) 	: ORIGIN = 0x20000000, LENGTH = 8K
  	STACK (rwx)	: ORIGIN = 0x20002000, LENGTH = 0K	/* Defines address of the end of the stack */
  	FLASH (rx)  : ORIGIN = 0x00000000, LENGTH = 64K

}

PROVIDE(__stack = ORIGIN(STACK) );  				/* __stack required by crt0.o otherwise it assumes 0x8000 */
HeapSize = 5000;


SECTIONS {

	. = ORIGIN(FLASH);

	.text :
	{
		*(.isr_vector)								/* ISR Vector table. Used by startup asm */
		*(.Default_Handler*)
		*(.Reset_Handler*)
		*(.text*)									/* Program */
		*(.rodata*)
	} >FLASH
	
		__etext = .;

	.data :
	{
		__data_start__ = .;							/* Starting point of SRAM block where data is to be copied. Used by startup asm */
		*(.data*)
		__data_end__ = .;							/* Used by startup asm */
	} >SRAM AT >FLASH

    _start_data_flash = LOADADDR(.data);			/* Starting location in FLASH of data to be copied */

	.bss :
	{
		__bss_start__ = .;							/* Used by startup asm */
		*(.bss*)
		__bss_end__ = .;							/* Used by startup asm */
	} >SRAM
	
	end = . ; 										/* Required for _sbrk in semihost.c*/	
	
	.heap :
	{
		__HeapBase = .;								/* required for _sbrk in semihost.c */
		__HeapLimit = __HeapBase + HeapSize ;		/* required for _sbrk in semihost.c */ 
		*(.heap*)
	} > SRAM

}

