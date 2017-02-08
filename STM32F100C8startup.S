 /******************************************************************************
 *	Startup for STM32F100C8 and STM32F103C8
 *	Based on code from STDiscovery adjusted to target specifically STM32F100C8 and F103
 *  Targets Eclipse Mars with ARM GNU tools gcc-arm-none-eabi-4_8-2013q4
 *  November 2016
 *
 *******************************************************************************/
    
.syntax unified
.thumb

.global  Vectors
.global  Default_Handler
.global  Reset_Handler


// Handler for Reset.
.section  .Reset_Handler

Reset_Handler:  
/*
// Copy the data segment initializers from flash to SRAM.
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


// Zero fill the bss segment.
FillZerobss:
  movs  r3, #0
  str   r3, [r2], #4
    
LoopFillZerobss:
  ldr   r3, = __bss_end__
  cmp   r2, r3
  bcc   FillZerobss
/*
#ifdef CRT
  bl  SystemInit   						// Call the clock system intitialization function.
  bl _start								// Call crt0
#endif
*/
  bl    main 							// Call application entry point
  bx    lr


.section  .Default_Handler			// Default handler for exceptions where specific handler has not been written

Default_Handler:
Infinite_Loop:
  b  Infinite_Loop 						// Loops here forever to trap an exception


/******************************************************************************
* Vector table for STM32F100C8 and F103
* Must be placed at physical address 0x0000.0000.
* 
* (Liam Goudge) These are vectors for the STM32F100C8 and F103
******************************************************************************/    

.section  .isr_vector

Vectors:
.word   __stack						/* stack top address */
.word   Reset_Handler				/* Reset. First code address after reset */
.word   Default_Handler        		/* NMI_Handler */
.word   Default_Handler        		/* HardFault */
.word   Default_Handler        		/* MemManage */
.word   Default_Handler        		/* BusFault */
.word   Default_Handler        		/* UsageFault */
.word   Default_Handler        		/* RESERVED */
.word   Default_Handler        		/* RESERVED */
.word   Default_Handler        		/* RESERVED*/
.word   Default_Handler        		/* RESERVED */
.word   Default_Handler        		/* SVC Handler */
.word   Default_Handler        		/* Debug Monitor */
.word   Default_Handler        		/* RESERVED */
.word   Default_Handler        		/* PendSV */
.word   Default_Handler        		/* SysTick */
.word   Default_Handler        		/* WWDG */
.word   Default_Handler        		/* PVD */
.word   Default_Handler        		/* Tamper Stamp */
.word   Default_Handler        		/* RTC WKUP */
.word   Default_Handler        		/* Flash */
.word   Default_Handler        		/* RCC */
.word   Default_Handler        		/* EXTI0 */
.word   Default_Handler        		/* EXTI1 */
.word   Default_Handler        		/* EXTI2 */
.word   Default_Handler        		/* EXTI3 */
.word   Default_Handler        		/* EXTI4 */
.word   Default_Handler        		/* DMA1 Channel1 */
.word   Default_Handler        		/* DMA1 Channel2 */
.word   Default_Handler        		/* DMA1 Channel3 */
.word   Default_Handler        		/* DMA1 Channel4 */
.word   Default_Handler        		/* DMA1 Channel5 */
.word   Default_Handler        		/* DMA1 Channel6 */
.word   Default_Handler        		/* DMA1 Channel7 */
.word   Default_Handler        		/* ADC1 */
.word   Default_Handler        		/* RESERVED */
.word   Default_Handler        		/* RESERVED */
.word   Default_Handler        		/* RESERVED*/
.word   Default_Handler        		/* RESERVED */
.word   Default_Handler        		/* EXTI9_5 */
.word   Default_Handler        		/* TIM1_BRK_TIM15 */
.word   Default_Handler        		/* TIM1_UP_TIM16 */
.word   Default_Handler        		/* TIM1_TRG_COM_TIM17 */
.word   Default_Handler        		/* TIM1_CC */
.word   Default_Handler        		/* TIM2 */
.word   Default_Handler        		/* TIM3 */
.word   Default_Handler        		/* TIM4 */
.word   Default_Handler        		/* I2C1_EV */
.word   Default_Handler        		/* I2C1_ER */
.word   Default_Handler        		/* I2C2_EV */
.word   Default_Handler        		/* I2C2_ER */
.word   Default_Handler        		/* SPI1 */
.word   Default_Handler        		/* SPI2 */
.word   Default_Handler        		/* USART1 */
.word   Default_Handler        		/* USART2 */
.word   Default_Handler        		/* USART3 */
.word   Default_Handler        		/* EXTI15_10 */
.word   Default_Handler        		/* RTC_Alarm */
.word   Default_Handler        		/* CEC */
.word   Default_Handler        		/* TIM12 */
.word   Default_Handler        		/* TIM13 */
.word   Default_Handler        		/* TIM14 */
.word   Default_Handler        		/* RESERVED */
.word   Default_Handler        		/* RESERVED */
.word   Default_Handler        		/* FSMC */
.word   Default_Handler        		/* RESERVED */
.word   Default_Handler        		/* TIM5 */
.word   Default_Handler        		/* SPI3 */
.word   Default_Handler        		/* UART4 */
.word   Default_Handler        		/* UART5 */
.word   Default_Handler        		/* TIM6_DAC */
.word   Default_Handler        		/* TIM7 */
.word   Default_Handler        		/* DMA2_Channel1 */
.word   Default_Handler        		/* DMA2_Channel2 */
.word   Default_Handler        		/* DMA2_Channel3 */
.word   Default_Handler        		/* DMA2_Channel4_5 */
.word   Default_Handler        		/* DMA2_Channel5 */

.end

