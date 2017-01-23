 /******************************************************************************
 *	Startup for STM32F100C8
 *  Targets Eclipse Mars with ARM GNU tools gcc-arm-none-eabi-4_8-2013q4
 *******************************************************************************/

.section  .vectors

.word __stack_base__
.word Reset_Handler
.word NMI_Handler
.word HardFault_Handler
.word MemManage_Handler
.word BusFault_Handler
.word UsageFault_Handler
.word 0
.word 0
.word 0
.word 0
.word SVC_Handler
.word DebugMon_Handler
.word 0

.section .text.handlers
.syntax unified							// Sets new ARM instruction syntax. See GNU asm manual section 9.4.2.1. Must have this to support CortexM0

Reset_Handler:
        ldr   r0, =flash_datastart
        ldr   r1, =sram_datastart
        ldr   r2, =data_size

copy:	cmp   r2, #0
        beq   init_bss
        ldrb   r4, [r0], #1
        strb   r4, [r1], #1
        subs   r2, r2, #1
        bne    copy

init_bss:
        ldr   r0, =__bss_start__
        ldr   r2, =bss_size
        mov   r4, #0

zero:   cmp   r2, #0
        beq   finish_init
        strb  r4, [r0], #1
        subs  r2, r2, #1
        bne   zero

finish_init:
  		bl  SystemInit   						// Call the clock system intitialization function.
  		bl _start								// Call crt0
  		bl    main 								// Call application entry point
  		bx    lr


NMI_Handler:
  		b  Infinite_Loop						// Loops here forever to trap an exception

HardFault_Handler:
  		b  Infinite_Loop						// Loops here forever to trap an exception

MemManage_Handler:
  		b  Infinite_Loop					// Loops here forever to trap an exception

BusFault_Handler:
  		b  Infinite_Loop						// Loops here forever to trap an exception

UsageFault_Handler:
  		b  Infinite_Loop						// Loops here forever to trap an exception

SVC_Handler:
  		b  Infinite_Loop 						// Loops here forever to trap an exception

DebugMon_Handler:
  		b  Infinite_Loop 						// Loops here forever to trap an exception


Infinite_Loop:
  		b  Infinite_Loop 						// Loops here forever to trap an exception



.end

