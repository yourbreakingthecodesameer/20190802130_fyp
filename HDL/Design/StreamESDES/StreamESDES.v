// async reset 
module circuit(
  input clk,
  input rst,
  input [7:0] nonce,
  input [7:0] plaintext,
  input [9:0] key,
  output reg [7:0] ciphertext
);

  reg [7:0] nonce_reg, plaintext_reg, plaintext_reg_delayed, sdes_output_reg;
  wire [7:0] sdes_output_wire;
  
  SDES sdes_inst(nonce_reg, key, sdes_output_wire);
  assign ciphertext = sdes_output_reg ^ plaintext_reg_delayed;
  
  always @(posedge clk, posedge rst) begin
    if (rst) begin
      nonce_reg <= 8'b0;
      plaintext_reg <= 8'b0;
      plaintext_reg_delayed <= 8'b0;
      sdes_output_reg <= 8'b0;
    end else begin
      plaintext_reg <= plaintext;
      plaintext_reg_delayed <= plaintext_reg;
      sdes_output_reg <= sdes_output_wire;
      
      if (|sdes_output_reg == 1'b1) begin
        nonce_reg <= sdes_output_reg;
      end else begin
        nonce_reg <= nonce;
      end
    end
  end
  
endmodule


// //Syncreset 
// module circuit(
//   input clk,
//   input rst,
//   input [7:0] nonce,
//   input [7:0] plaintext,
//   input [9:0] key,
//   output reg [7:0] ciphertext
// );

//   reg [7:0] nonce_reg, plaintext_reg, plaintext_reg_delayed, sdes_output_reg;
//   wire [7:0] sdes_output_wire;
  
//   SDES sdes_inst(nonce_reg, key, sdes_output_wire);
//   assign ciphertext = sdes_output_reg ^ plaintext_reg_delayed;
  
//   always @(posedge clk) begin
//     if (rst) begin
//       nonce_reg <= 8'b0;
//       plaintext_reg <= 8'b0;
//       plaintext_reg_delayed <= 8'b0;
//       sdes_output_reg <= 8'b0;
//     end else begin
//       plaintext_reg <= plaintext;
//       plaintext_reg_delayed <= plaintext_reg;
//       sdes_output_reg <= sdes_output_wire;
      
//       if (|sdes_output_reg == 1'b1) begin
//         nonce_reg <= sdes_output_reg;
//       end else begin
//         nonce_reg <= nonce;
//       end
//     end
//   end
  
// endmodule
