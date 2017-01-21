 /******************************************************************************
 *	Startup for STM32F100C8
 *	Based on code from STDiscovery adjusted to target specifically STM32F100C8 with complete set of vectors
 *  Targets Eclipse Kepler with ARM GNU tools gcc-arm-none-eabi-4_8-2013q4
 * 	Did not bother to set up NVIC
 *
 *******************************************************************************/
    
.syntax unified
.thumb

.global  Vectors
.global  Default_Handler
.global  Reset_Handler


// Handler for Reset.
.section  .text.Reset_Handler

Reset_Handler:  

/***** Copy the data segment initializers from flash to SRAM. */
  movs  r1, #0							// Iteration counter
  b     LoopCopyDataInit

CopyDataInit:
  ldr   r3, =_start_data_flash			// Starting location in FLASH of data to be copied
  ldr   r3, [r3, r1]					// Load data from flash location start_data_flash + offset of iteration counter
  str   r3, [r0, r1]					// And store it to SRAM at location of __data_start__ + offset of iteration counter
  adds  r1, r1, #4
    
LoopCopyDataInit:
  ldr   r0, =__data_start__				// Starting point of SRAM block where data is to be copied
  ldr   r3, =__data_end__
  adds  r2, r0, r1
  cmp   r2, r3
  bcc   CopyDataInit
  ldr   r2, =__bss_start__
  b     LoopFillZerobss


/* Zero fill the bss segment. */  
FillZerobss:
  movs  r3, #0
  str   r3, [r2], #4
    
LoopFillZerobss:
  ldr   r3, = __bss_end__
  cmp   r2, r3
  bcc   FillZerobss

  bl  SystemInit   						// Call the clock system intitialization function.
  bl _start								// Call crt0
  bl    main 							// Call application entry point
  bx    lr


.section  .text.Default_Handler			// Default handler for exceptions where specific handler has not been written

Default_Handler:
Infinite_Loop:
  b  Infinite_Loop 						// Loops here forever to trap an exception

.section  .text.NMI_Handler

NMI_Handler:
Infinite_Loop1:
  b  Infinite_Loop						// Loops here forever to trap an exception

.section  .text.HardFault_Handler

HardFault_Handler:
Infinite_Loop2:
  b  Infinite_Loop						// Loops here forever to trap an exception

.section  .text.MemManage_Handler

MemManage_Handler:
Infinite_Loop3:
  b  Infinite_Loop					// Loops here forever to trap an exception

.section  .text.BusFault_Handler

BusFault_Handler:
Infinite_Loop4:
  b  Infinite_Loop						// Loops here forever to trap an exception

.section  .text.UsageFault_Handler

UsageFault_Handler:
Infinite_Loop5:
  b  Infinite_Loop						// Loops here forever to trap an exception

.section  .text.SVC_Handler

SVC_Handler:
Infinite_Loop6:
  b  Infinite_Loop 						// Loops here forever to trap an exception

.section  .text.DebugMon_Handler

DebugMon_Handler:
Infinite_Loop7:
  b  Infinite_Loop 						// Loops here forever to trap an exception


/******************************************************************************
* Complete vector table for STM32F100C8.
* Must be placed at physical address 0x0000.0000.
* 
* (Liam Goudge) These are vectors for the STM32F100C8
******************************************************************************/    

.section  .isr_vector

Vectors:
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
/*
.word PendSV_Handler
.word SysTick_Handler
.word WWDG_IRQHandler
*/

/*******************************************************************************
* Provide weak aliases for each Exception handler to the Default_Handler. 
* As they are weak aliases, any function with the same name will override 
* this definition.
*
* This is the full set of handlers for the full set of STM32F100C8 exception vectors (LG)
*******************************************************************************/

  .weak  NMI_Handler
  .thumb_set NMI_Handler,Default_Handler
  
  .weak  HardFault_Handler
  .thumb_set HardFault_Handler,Default_Handler
  
  .weak  MemManage_Handler
  .thumb_set MemManage_Handler,Default_Handler
  
  .weak  BusFault_Handler
  .thumb_set BusFault_Handler,Default_Handler

  .weak  UsageFault_Handler
  .thumb_set UsageFault_Handler,Default_Handler

  .weak  SVC_Handler
  .thumb_set SVC_Handler,Default_Handler

  .weak  DebugMon_Handler
  .thumb_set DebugMon_Handler,Default_Handler

  .weak  PendSV_Handler
  .thumb_set PendSV_Handler,Default_Handler

  .weak  SysTick_Handler
  .thumb_set SysTick_Handler,Default_Handler

  .weak  WWDG_IRQHandler
  .thumb_set WWDG_IRQHandler,Default_Handler


.end

