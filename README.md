 Carry Select Adder (CSA)
🔧 Description
This Verilog project implements a Carry Select Adder, which speeds up binary addition by computing two outcomes in parallel:
One assuming carry-in = 0
One assuming carry-in = 1
After the actual carry-in is known, the correct result is selected using a multiplexer.

⚙️ Structure
Divided into segments (e.g., 4-bit blocks).
Each segment computes sum and carry for both carry-in possibilities.
Final result selected based on carry propagation.

🧪 Simulation
Verified using testbenches and $monitor in Xilinx Vivado.
Tested for multiple input combinations to confirm accurate carry handling.

💡 Key Concepts
Parallelism in carry computation.
MUX-based selection.
Faster than ripple carry adder for larger bit-width.
