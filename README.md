# Enhanced S-DES as RNG for stream cipher VLSI implementation

# Introduction 

## Folder Structure:

The project has the following folder structure:

- **Schematics** folder
  - **Python** folder: Contains the implemented algorithm in Python.
  - **Logisim** folder: Contains images of most circuits and a Logisim file to explore the circuit.
- **HDL** folder: Contains files related to Hardware Description Language (HDL).
  - **Design** folder: Contains HDL files that describe the circuit designs or modules.
  - **Dump** folder: Stores output files or logs generated during the simulation or synthesis process.
  - **Testbench** folder: Stores HDL files with testbenches used for verifying the circuit functionality.
- **GDS** folder: Contains files related to the Graphic Data System (GDS) format, commonly used in semiconductor manufacturing.

If you have any further questions or need more specific guidance, feel free to ask!

# Methodology

1. **Algorithm Design**: Begin by designing and implementing the algorithm in Python. Clearly define the problem statement, determine the required inputs and outputs, and develop an efficient algorithmic solution using Python programming language.

2.  **Schematic Design**: Create schematics using a tool Logisim based on the algorithm in python.
   
4. **Translate Algorithm to Verilog**: Once the algorithm in Python is finalized, the next step is to translate it into hardware using a hardware description language (HDL) such as Verilog. Write Verilog modules that represent the functionality of the algorithm. Define the input and output ports, internal logic, and any required control signals within the Verilog modules.

5. **Testbench Development**: Create a testbench in Verilog to verify the functionality of the Verilog modules. The testbench should include test vectors that cover different scenarios and edge cases to ensure proper operation of the design. The testbench will generate stimulus for the design and capture the expected outputs for comparison.

6. **Simulate and Verify**: Use a Verilog simulator, such as ModelSim or VCS, to simulate the Verilog design with the testbench. Run the simulation and analyze the waveform results to verify that the design operates correctly and produces the expected outputs for the given inputs. Debug any issues that arise during simulation.

7. **RTL to GDS Conversion**: Once the design is verified at the RTL (Register Transfer Level) level, the next step is to convert it into a GDS (Graphic Data System) file, which represents the physical layout of the design. OpenLANE is an open-source software tool that automates the RTL to GDS conversion flow. Configure and run OpenLANE with the required design specifications and constraints to generate the GDS file.

# Implimentation
![image](https://github.com/yourbreakingthecodesameer/20190802130_fyp/assets/81480956/699e27bc-1ceb-4442-99b8-abdce77f7301)

![image](https://github.com/yourbreakingthecodesameer/20190802130_fyp/assets/81480956/0208a128-a0ad-4994-b271-082860aa4e99)

![image](https://github.com/yourbreakingthecodesameer/20190802130_fyp/assets/81480956/8a2f4060-d99d-465b-a5b6-30adfa693a6d)

![image](https://github.com/yourbreakingthecodesameer/20190802130_fyp/assets/81480956/c539d9cb-e443-4b1f-85f5-e512ec0ed3f0)



