# CEG4322 - Very Large Scale Integrated Circuit Design

*This repository serves as an archive for the project my teammates and I constructed for our VLSI course.*

## Project Overview

Our project was an **8-bit CPU**, designed and implemented using **45nm CMOS technology** as taught in the course using **Cadence Virtuoso**.

The overall design of our CPU was based on a microprocessor that I built in another course.
- *See the schematics of the original design [here](/Logisim/Schematics/4-Bit)*
- *Or, download the original Logisim schematic [here](/Logisim/Files/4-Bit-Microprocessor.circ) (**Note**: original Logism file)*

Prior to our implementation of the CPU in Cadence Virtuoso, the original microprocessor was reconstructed, redesigned, and scaled to 8-bits in Logism Evolution, serving as the base of our CPU.
- *Download the 8-bit Logisim Evolution CPU [here](/Logisim/Files/8-Bit-CPU.circ)*

While constructing the CPU in Cadence I wrote some [code](/Code) that automatically optimized the transistor-widths of some of the components, and saved time wiring the RAM/ROM.

## CPU Architecture
- Control Unit
  - Processed instructions into microinstructions that were then fed into the data unit
  - Handled branching logic, memory write signals, and auto-incrementing instructions
  - Utilized a ROM that housed pre-programmed microinstructions to facilitate proper data sequencing
- Data Unit
  - 8x8 register file that stored intermediate values when processing a microinstruction
  - 16 function ALU with 14 functions fully implemented, including multiplication, logical and arithmetic shifts, addition/subtraction, basic boolean operations, 0/1, and two's compliment
  - Made use of two muxes that allowed inserting values stored in RAM or the CPU's instruction into the data unit for processing
- RAM
  - 256x8 (256 bytes)

## Team Members

- *Jeremiah Carter*
- *[Logan Current](https://github.com/kingANGRYKIWI)*

## Demonstration

*Watch a **demo video** of the CPU running the Fibonacci sequence in Logisim*:  
[![Demo Video](https://img.youtube.com/vi/TlxvIQwvaOU/0.jpg)](https://www.youtube.com/watch?v=TlxvIQwvaOU)
