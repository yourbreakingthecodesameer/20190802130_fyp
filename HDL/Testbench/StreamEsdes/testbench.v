module testbench;

  // Declare inputs and outputs
  reg clk, rst; 
  reg [7:0] nonce, plaintext;
  reg [9:0] key;
  wire [7:0] ciphertext;

  // Instantiate the module under test
  circuit inst(
    .clk(clk),
    .rst(rst),
    .nonce(nonce),
    .plaintext(plaintext),
    .key(key),
    .ciphertext(ciphertext)
  );
  
  // Generate clock signal
  always #1 clk = ~clk;

  // Initialize inputs
  initial begin
    // Dump waveform to VCD file
    $dumpfile("streamesdes.vcd");
    $dumpvars();
    
    // Set initial input values
    clk = 0;
    nonce = 8'b00001000;
    plaintext = 8'b00000000;
    key = 10'b0000000100;
    rst = 1;
    #5rst = 0;
	#10 rst = 1;
    #1 nonce = 8'b00010000;
    #3rst = 0;
    #20 rst = 1;
    #50 $finish;
  end 
endmodule


