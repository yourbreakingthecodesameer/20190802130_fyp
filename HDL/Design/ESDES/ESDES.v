module SDES(input [7:0] nonce, input [9:0] key,output [7:0] rn);
  reg [8:0]nonceinv, IP,EP_1,key_1,key_2,epxork_1,EP_2,epxork_2,IP_inv,finalsum;
  reg [9:0] keyinv;
  reg [3:0] nonce_r, nonce_l, aftersbox_1,aftersbox_2, P4,round2inp,P4_2,noncerxorp4;
  reg [1:0] s0_1,s1_1,s0_2,s1_2;
  always @ (*) begin
    keyinv = ~key;
    key_1 = {keyinv[9],keyinv[3],keyinv[1],keyinv[6],keyinv[2],keyinv[7],keyinv[0],keyinv[4]};
    key_2 = {keyinv[2],keyinv[7],keyinv[4],keyinv[5],keyinv[0],keyinv[8],keyinv[1],keyinv[9]};
    nonceinv = ~nonce;
    IP = {nonceinv[6], nonceinv[2], nonceinv[5], nonceinv[7],nonceinv[4], nonceinv[0], nonceinv[3], nonceinv[1]};
    nonce_r = IP[3:0];
    nonce_l = IP[7:4];
    EP_1 =  {nonce_r[0], nonce_r[3], nonce_r[2], nonce_r[1], nonce_r[2], nonce_r[1], nonce_r[0], nonce_r[3]};
    epxork_1 = key_1 ^ EP_1;
    // S0 box for round1         
    case (epxork_1[7:4])     
      4'b0000	:  s0_1 = 2'b01;
      4'b0001	:  s0_1 = 2'b11;
      4'b0010	:  s0_1 = 2'b00;
      4'b0011	:  s0_1 = 2'b10;
      4'b0100	:  s0_1 = 2'b11;
      4'b0101	:  s0_1 = 2'b01;
      4'b0110	:  s0_1 = 2'b10;
      4'b0111	:  s0_1 = 2'b00;
      4'b1000	:  s0_1 = 2'b00;
      4'b1001	:  s0_1 = 2'b11;
      4'b1010	:  s0_1 = 2'b10;
      4'b1011	:  s0_1 = 2'b01;
      4'b1100	:  s0_1 = 2'b01;
      4'b1101	:  s0_1 = 2'b11;
      4'b1110	:  s0_1 = 2'b11;
      4'b1111	:  s0_1 = 2'b10;
     endcase 
     // S1 box for round1  
     case (epxork_1[3:0])
     
      4'b0000 : s1_1 = 2'b00;
      4'b0001 : s1_1 = 2'b10;
      4'b0010 : s1_1 = 2'b01;
      4'b0011 : s1_1 = 2'b00;
      4'b0100 : s1_1 = 2'b10;
      4'b0101 : s1_1 = 2'b01;
      4'b0110 : s1_1 = 2'b11;
      4'b0111 : s1_1 = 2'b11;
      4'b1000 : s1_1 = 2'b11;
      4'b1001 : s1_1 = 2'b10;
      4'b1010 : s1_1 = 2'b00;
      4'b1011 : s1_1 = 2'b01;
      4'b1100 : s1_1 = 2'b01;
      4'b1101 : s1_1 = 2'b00;
      4'b1110 : s1_1 = 2'b00;
      4'b1111 : s1_1 = 2'b11;
		endcase 
    aftersbox_1 = {s0_1,s1_1};
    P4 = {aftersbox_1[2],
          aftersbox_1[0],
          aftersbox_1[1],
          aftersbox_1[3]}; 
    round2inp = nonce_l ^ P4;
    // round 2
    EP_2 =  {round2inp[0],
             round2inp[3],
             round2inp[2],
             round2inp[1],
             round2inp[2],
             round2inp[1],
             round2inp[0],
             round2inp[3]};
    epxork_2 = EP_2 ^ key_2;
        // S0 box for round2         
    case (epxork_2[7:4])     
      4'b0000	:  s0_2 = 2'b01;
      4'b0001	:  s0_2 = 2'b11;
      4'b0010	:  s0_2 = 2'b00;
      4'b0011	:  s0_2 = 2'b10;
      4'b0100	:  s0_2 = 2'b11;
      4'b0101	:  s0_2 = 2'b01;
      4'b0110	:  s0_2 = 2'b10;
      4'b0111	:  s0_2 = 2'b00;
      4'b1000	:  s0_2 = 2'b00;
      4'b1001	:  s0_2 = 2'b11;
      4'b1010	:  s0_2 = 2'b10;
      4'b1011	:  s0_2 = 2'b01;
      4'b1100	:  s0_2 = 2'b01;
      4'b1101	:  s0_2 = 2'b11;
      4'b1110	:  s0_2 = 2'b11;
      4'b1111	:  s0_2 = 2'b10;
     endcase 
     // S1 box for round2 
    case (epxork_2[3:0])
     
      4'b0000 : s1_2 = 2'b00;
      4'b0001 : s1_2 = 2'b10;
      4'b0010 : s1_2 = 2'b01;
      4'b0011 : s1_2 = 2'b00;
      4'b0100 : s1_2 = 2'b10;
      4'b0101 : s1_2 = 2'b01;
      4'b0110 : s1_2 = 2'b11;
      4'b0111 : s1_2 = 2'b11;
      4'b1000 : s1_2 = 2'b11;
      4'b1001 : s1_2 = 2'b10;
      4'b1010 : s1_2 = 2'b00;
      4'b1011 : s1_2 = 2'b01;
      4'b1100 : s1_2 = 2'b01;
      4'b1101 : s1_2 = 2'b00;
      4'b1110 : s1_2 = 2'b00;
      4'b1111 : s1_2 = 2'b11;
		endcase 
    aftersbox_2 = {s0_2,s1_2};
    P4_2 = {aftersbox_2[2],
            aftersbox_2[0],
            aftersbox_2[1],
            aftersbox_2[3]}; 
    noncerxorp4 = nonce_r ^ P4_2;
    finalsum = {noncerxorp4,round2inp} ;
    IP_inv ={finalsum[4],
             finalsum[7],
             finalsum[5],
             finalsum[3],
             finalsum[1],
             finalsum[6],
             finalsum[0],
             finalsum[2]};
 
    
    
    
   
  end
  assign    rn = ~IP_inv;
endmodule 