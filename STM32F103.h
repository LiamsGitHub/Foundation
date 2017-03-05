// Header file for STM32F103 peripheral set
// Commented ones are copied from 100.h but not verified

// Reset and Clock Control (RCC)
#define RCC_CR            (*((volatile unsigned long *) 0x40021000)) // Clock Control register. Offset=0x0
#define RCC_CFGR          (*((volatile unsigned long *) 0x40021004)) // Clock configuration register. Offset=0x4
#define RCC_APB1ENR       (*((volatile unsigned long *) 0x4002101C)) // APB1 peripheral clock enable register. Offset=0x1C
#define RCC_APB2ENR       (*((volatile unsigned long *) 0x40021018)) // APB2 peripheral clock enable register. Offset=0x18

// GPIO Port A
#define GPIOA_CRL         (*((volatile unsigned long *) 0x40010800)) // GPIO port A. Port configuration register low. Offset=0x0
#define GPIOA_CRH         (*((volatile unsigned long *) 0x40010804)) // GPIO port A. Port configuration register High. Offset=0x4
#define GPIOA_ODR		  (*((volatile unsigned long *) 0x4001080C)) // GPIO port A. Output data register also used to set pullup/down. Offset = 0xC
#define GPIOA_BSRR        (*((volatile unsigned long *) 0x40010810)) // GPIO port A. Bit set/reset register. Offset = 0x10

// GPIO Port B
#define GPIOB_CRL         (*((volatile unsigned long *) 0x40010C00)) // GPIO port B. Port configuration register low. Offset=0x0
#define GPIOB_CRH         (*((volatile unsigned long *) 0x40010C04)) // GPIO port B. Port configuration register High. Offset=0x4
#define GPIOB_ODR		  (*((volatile unsigned long *) 0x40010C0C)) // GPIO port B. Output data register also used to set pullup/down. Offset = 0xC
#define GPIOB_BSRR        (*((volatile unsigned long *) 0x40010C10)) // GPIO port B. Bit set/reset register. Offset = 0x10

// GPIO Port C
#define GPIOC_CRL         (*((volatile unsigned long *) 0x40011000)) // GPIO port C. Port configuration register low. Offset=0x0
#define GPIOC_CRH         (*((volatile unsigned long *) 0x40011004)) // GPIO port C. Port configuration register High. Offset=0x4
#define GPIOC_BSRR        (*((volatile unsigned long *) 0x40011010)) // GPIO port C. Bit set/reset register. Offset = 0x10

// USART1 Registers
#define USART1_SR         (*((volatile unsigned long *) 0x40013800)) // USART1. Status register. Offset=0x0
#define USART1_DR         (*((volatile unsigned long *) 0x40013804)) // USART1. Data register. Offset=0x4
#define USART1_BRR        (*((volatile unsigned long *) 0x40013808)) // USART1. Baud rate register. Offset=0x8
#define USART1_CR1        (*((volatile unsigned long *) 0x4001380C)) // USART1. Control register 1. Offset=0xC
#define USART1_CR2        (*((volatile unsigned long *) 0x40013810)) // USART1. Control register 2. Offset=0x10
#define USART1_CR3        (*((volatile unsigned long *) 0x40013814)) // USART1. Control register 3. Offset=0x14

// SPI1 Registers
#define SPI1_CR1		(*((volatile unsigned long *) 0x40013000)) // SPI1 Control register 1. Offset=0x0
#define SPI1_CR2		(*((volatile unsigned long *) 0x40013004)) // SPI1 Control register 2. Offset=0x4
#define SPI1_SR			(*((volatile unsigned long *) 0x40013008)) // SPI1 Status register. Offset=0x8
#define SPI1_DR			(*((volatile unsigned long *) 0x4001300c)) // SPI1 Data register. Offset=0xC
#define SPI1_I2SCFGR	(*((volatile unsigned long *) 0x4001301c)) // SPI1 Config register. Offset=0x1C
#define SPI1_I2SPR		(*((volatile unsigned long *) 0x40013020)) // SPI1 prescaler register. Offset=0x20

// SPI2 Registers
#define SPI2_CR1		(*((volatile unsigned long *) 0x40003800)) // SPI2 Control register 1. Offset=0x0
#define SPI2_CR2		(*((volatile unsigned long *) 0x40003804)) // SPI2 Control register 2. Offset=0x4
#define SPI2_SR			(*((volatile unsigned long *) 0x40003808)) // SPI2 Status register. Offset=0x8
#define SPI2_DR			(*((volatile unsigned long *) 0x4000380c)) // SPI2 Data register. Offset=0xC
#define SPI2_I2SCFGR	(*((volatile unsigned long *) 0x4000381c)) // SPI2 Config register. Offset=0x1C
#define SPI2_I2SPR		(*((volatile unsigned long *) 0x40003820)) // SPI2 prescaler register. Offset=0x20

// ADC1 Registers
// Base = 0x4001 2400
//#define ADC_SR             (*((volatile unsigned long *) 0x40012400)) // ADC Status Register. Offset = 0x0
//#define ADC_CR2            (*((volatile unsigned long *) 0x40012408)) // ADC Control Register 2. Offset = 0x8
//#define ADC_SMPR2          (*((volatile unsigned long *) 0x40012410)) // ADC Sample time Register 2. Offset = 0x10
//#define ADC_SQR3           (*((volatile unsigned long *) 0x40012434)) // ADC Regular Sequence Register3. Offset = 0x34
//#define ADC_DR             (*((volatile unsigned long *) 0x4001244C)) // ADC Regular Data Register. Offset = 0x4C


// DAC Registers
// Base = 0x4000 7400
//#define DAC_CR             (*((volatile unsigned long *) 0x40007400)) // Applies to both DAC1 and DAC2. Offset = 0x0
//#define DAC_DHR12R1        (*((volatile unsigned long *) 0x40007408)) // DAC1 data holding register for right aligned 12-bit mode. Offset = 0x8
//#define DAC_DHR12R2        (*((volatile unsigned long *) 0x40007414)) // DAC2 data holding register for right aligned 12-bit mode. Offset = 0x14
//#define DAC_DOR1           (*((volatile unsigned long *) 0x4000742C)) // DAC channel1 data output register. Read-only. Offset = 0x2C
//#define DAC_DOR2           (*((volatile unsigned long *) 0x40007430)) // DAC channel2 data output register. Read-only. Offset = 0x30

