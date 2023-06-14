module testbench();

  reg [7:0] nonce;
  reg [9:0] key;
  wire [7:0] rn;
  reg mismatch;

  SDES dut (
    .nonce(nonce),
    .key(key),
    .rn(rn)
  );
    initial begin
    $dumpfile("dump.vcd"); 
    $dumpvars(1);
    
  end

  initial begin
    mismatch =0;
  
  	// false test 
    nonce = 8'h0a;
    key = 10'h010;
    #10;
    if (rn !== 8'hf0) begin
      $display("Test failed: Output mismatch!");
      mismatch = 1;
    end
    else begin
      mismatch = 0;
    end
  
  
  
    // Test 1 
    nonce = 8'h00;
    key = 10'h000;
    #10;
    if (rn !== 8'hf0) begin
      $display("Test 1 failed: Output mismatch!");
      mismatch = 1;
    end
    else begin
       mismatch = 0;
    end

    // Test 2 
    nonce = 8'hff;
    key = 10'h3ff;
    #10;
    if (rn !== 8'h0f) begin
      $display("Test 2 failed: Output mismatch!");
      mismatch = 1;
    end
    else begin
       mismatch = 0;
    end
    
    // test 3
     nonce = 8'h11;
    key = 10'h001;
    #10;
    if (rn !== 8'hc3) begin
      $display("Test 3 failed: Output mismatch!");
      mismatch = 1;
    end
    else begin
        mismatch = 0;
    end
    
    // test 4
     nonce = 8'hb1;
    key = 10'h102;
    #10;
    if (rn !== 8'hb0) begin
      $display("Test 4 failed: Output mismatch!");
      mismatch = 1;
    end
    else begin
       mismatch = 0;
    end
    
    // test 5
     nonce = 8'hb1;
    key = 10'h1a2;
    #10;
    if (rn !== 8'h1c) begin
      $display("Test 5 failed: Output mismatch!");
      mismatch = 1;
    end
    else begin
        mismatch = 0;
    end
    
    // test 6
     nonce = 8'hd2;
    key = 10'h1a2;
    #10;
    if (rn !== 8'h49) begin
      $display("Test 6 failed: Output mismatch!");
      mismatch = 1;
    end
    else begin
        mismatch = 0;
    end
    
    // test 7
     nonce = 8'hd2;
    key = 10'h1b2;
    #10;
    if (rn !== 8'h09) begin
      $display("Test 7 failed: Output mismatch!");
      mismatch = 1;
    end
    else begin
        mismatch = 0;
    end
    
    // test 8
     nonce = 8'he4;
    key = 10'h2c2;
    #10;
    if (rn !== 8'he3) begin
      $display("Test 8 failed: Output mismatch!");
      mismatch = 1;
    end
    else begin
       mismatch = 0;
    end
    
    // test 9
     nonce = 8'hf5;
    key = 10'h0c5;
    #10;
    if (rn !== 8'h12) begin
      $display("Test 9 failed: Output mismatch!");
      mismatch = 1;
    end
    else begin
       mismatch = 0;
    end
    
    // test 10
     nonce = 8'h18;
    key = 10'h0d5;
    #10;
    if (rn !== 8'h76) begin
      $display("Test 10 failed: Output mismatch!");
      mismatch = 1;
    end
    else begin
        mismatch = 0;
    end
    
  end

endmodule
