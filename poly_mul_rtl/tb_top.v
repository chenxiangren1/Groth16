`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/27 16:23:45
// Design Name: 
// Module Name: tb_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_top;
  reg clk,rst;
  reg start;
  wire done;
  reg [255:0] bank0 [127:0];
  reg [255:0] bank1 [127:0];
  reg [255:0] bank2 [127:0];
  reg [255:0] bank3 [127:0];
  reg [255:0] bank4 [127:0];
  reg [255:0] bank5 [127:0];
  reg [255:0] bank6 [127:0];
  reg [255:0] bank7 [127:0];
  
  reg [255:0] bank0b [127:0];
  reg [255:0] bank1b [127:0];
  reg [255:0] bank2b [127:0];
  reg [255:0] bank3b [127:0];
  reg [255:0] bank4b [127:0];
  reg [255:0] bank5b [127:0];
  reg [255:0] bank6b [127:0];
  reg [255:0] bank7b [127:0];
  
  reg [255:0] ROM0 [256:0];
  reg [255:0] ROM1 [256:0];
  reg [255:0] ROM2 [256:0];
  reg [255:0] ROM3 [256:0];
  reg [255:0] ROM4 [256:0];
  reg [255:0] ROM5 [256:0];
  reg [255:0] ROM6 [256:0];
  reg [255:0] ROM7 [256:0];
  integer i;
  
  top_poly_mul poly_mul(
      .clk(clk),.rst(rst),
      .start(start),
      .done(done)
      );
  initial
  begin
    clk=1'b0;
    forever #5 clk=~clk;
  end
  
  initial 
  begin
    start = 1;
    rst = 1;
    # 5 rst = 0;
    # 20 start = 0;
  end
   
  initial
   begin 
     $readmemh("D:/Xilinx_project/polynomial_mul/tmp_1024/bank0.txt",bank0);
      for(i=0;i<128;i=i+1)
        tb_top.poly_mul.bank_0.bank[i]=bank0[i];
   end
   
   initial
   begin 
     $readmemh("D:/Xilinx_project/polynomial_mul/tmp_1024/bank1.txt",bank1);
      for(i=0;i<128;i=i+1)
        tb_top.poly_mul.bank_1.bank[i]=bank1[i];
   end
   
   initial
   begin 
     $readmemh("D:/Xilinx_project/polynomial_mul/tmp_1024/bank2.txt",bank2);
      for(i=0;i<128;i=i+1)
        tb_top.poly_mul.bank_2.bank[i]=bank2[i];
   end
   
   initial
   begin 
     $readmemh("D:/Xilinx_project/polynomial_mul/tmp_1024/bank3.txt",bank3);
      for(i=0;i<128;i=i+1)
        tb_top.poly_mul.bank_3.bank[i]=bank3[i];
   end
   
   initial
   begin 
     $readmemh("D:/Xilinx_project/polynomial_mul/tmp_1024/bank4.txt",bank4);
      for(i=0;i<128;i=i+1)
        tb_top.poly_mul.bank_4.bank[i]=bank4[i];
   end
   
   initial
   begin 
     $readmemh("D:/Xilinx_project/polynomial_mul/tmp_1024/bank5.txt",bank5);
      for(i=0;i<128;i=i+1)
        tb_top.poly_mul.bank_5.bank[i]=bank5[i];
   end
   
   initial
   begin 
     $readmemh("D:/Xilinx_project/polynomial_mul/tmp_1024/bank6.txt",bank6);
      for(i=0;i<128;i=i+1)
        tb_top.poly_mul.bank_6.bank[i]=bank6[i];
   end
   
   initial
   begin 
     $readmemh("D:/Xilinx_project/polynomial_mul/tmp_1024/bank7.txt",bank7);
      for(i=0;i<128;i=i+1)
        tb_top.poly_mul.bank_7.bank[i]=bank7[i];
   end
   
   initial
   begin 
     $readmemh("D:/Xilinx_project/polynomial_mul/tmp_1024/bank0b.txt",bank0b);
      for(i=0;i<128;i=i+1)
        tb_top.poly_mul.bank_0_b.bank[i]=bank0b[i];
   end
   
   initial
   begin 
     $readmemh("D:/Xilinx_project/polynomial_mul/tmp_1024/bank1b.txt",bank1b);
      for(i=0;i<128;i=i+1)
        tb_top.poly_mul.bank_1_b.bank[i]=bank1b[i];
   end
   
   initial
   begin 
     $readmemh("D:/Xilinx_project/polynomial_mul/tmp_1024/bank2b.txt",bank2b);
      for(i=0;i<128;i=i+1)
        tb_top.poly_mul.bank_2_b.bank[i]=bank2b[i];
   end
   
   initial
   begin 
     $readmemh("D:/Xilinx_project/polynomial_mul/tmp_1024/bank3b.txt",bank3b);
      for(i=0;i<128;i=i+1)
        tb_top.poly_mul.bank_3_b.bank[i]=bank3b[i];
   end
   
   initial
   begin 
     $readmemh("D:/Xilinx_project/polynomial_mul/tmp_1024/bank4b.txt",bank4b);
      for(i=0;i<128;i=i+1)
        tb_top.poly_mul.bank_4_b.bank[i]=bank4b[i];
   end
   
   initial
   begin 
     $readmemh("D:/Xilinx_project/polynomial_mul/tmp_1024/bank5b.txt",bank5b);
      for(i=0;i<128;i=i+1)
        tb_top.poly_mul.bank_5_b.bank[i]=bank5b[i];
   end
   
   initial
   begin 
     $readmemh("D:/Xilinx_project/polynomial_mul/tmp_1024/bank6b.txt",bank6b);
      for(i=0;i<128;i=i+1)
        tb_top.poly_mul.bank_6_b.bank[i]=bank6b[i];
   end
   
   initial
   begin 
     $readmemh("D:/Xilinx_project/polynomial_mul/tmp_1024/bank7b.txt",bank7b);
      for(i=0;i<128;i=i+1)
        tb_top.poly_mul.bank_7_b.bank[i]=bank7b[i];
   end
   
   initial
   begin 
     $readmemh("D:/Xilinx_project/polynomial_mul/tmp_1024/NTT_w_rom_1.txt",ROM0);
      for(i=0;i<257;i=i+1)
        tb_top.poly_mul.rom0.ROM[i]=ROM0[i];
   end
   
   initial
   begin 
     $readmemh("D:/Xilinx_project/polynomial_mul/tmp_1024/NTT_w_rom_2.txt",ROM1);
      for(i=0;i<257;i=i+1)
        tb_top.poly_mul.rom1.ROM[i]=ROM1[i];
   end
   
   initial
   begin 
     $readmemh("D:/Xilinx_project/polynomial_mul/tmp_1024/NTT_w_rom_3.txt",ROM2);
      for(i=0;i<257;i=i+1)
        tb_top.poly_mul.rom2.ROM[i]=ROM2[i];
   end
   
   initial
   begin 
     $readmemh("D:/Xilinx_project/polynomial_mul/tmp_1024/NTT_w_rom_4.txt",ROM3);
      for(i=0;i<257;i=i+1)
        tb_top.poly_mul.rom3.ROM[i]=ROM3[i];
   end
   
   initial
   begin 
     $readmemh("D:/Xilinx_project/polynomial_mul/tmp_1024/NTT_inv_w_rom_1.txt",ROM4);
      for(i=0;i<257;i=i+1)
        tb_top.poly_mul.rom4.ROM[i]=ROM4[i];
   end
   
   initial
   begin 
     $readmemh("D:/Xilinx_project/polynomial_mul/tmp_1024/NTT_inv_w_rom_2.txt",ROM5);
      for(i=0;i<257;i=i+1)
        tb_top.poly_mul.rom5.ROM[i]=ROM5[i];
   end
   
   initial
   begin 
     $readmemh("D:/Xilinx_project/polynomial_mul/tmp_1024/NTT_inv_w_rom_3.txt",ROM6);
      for(i=0;i<257;i=i+1)
        tb_top.poly_mul.rom6.ROM[i]=ROM6[i];
   end
   
   initial
   begin 
     $readmemh("D:/Xilinx_project/polynomial_mul/tmp_1024/NTT_inv_w_rom_4.txt",ROM7);
      for(i=0;i<257;i=i+1)
        tb_top.poly_mul.rom7.ROM[i]=ROM7[i];
   end
 endmodule
