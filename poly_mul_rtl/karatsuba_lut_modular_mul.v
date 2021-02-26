//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/02/15 22:00:54
// Design Name: 
// Module Name: karatsuba_lut_modular_mul
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


module modular_mul #(parameter data_width = 256)(
    input clk,rst,
    input [data_width-1:0] A_in,B_in,
    output [data_width-1:0] P_out
    );
    reg [255:0] ram0 [255:0];
    reg [255:0] ram1 [255:0];
    reg [255:0] ram2 [255:0];
    reg [255:0] ram3 [255:0];
    reg [255:0] ram4 [255:0];
    reg [255:0] ram5 [255:0];
    reg [255:0] ram6 [255:0];
    reg [255:0] ram7 [255:0];
    reg [255:0] ram8 [255:0];
    reg [255:0] ram9 [255:0];
    reg [255:0] ram10 [255:0];
    reg [255:0] ram11 [255:0];
    reg [255:0] ram12 [255:0];
    reg [255:0] ram13 [255:0];
    reg [255:0] ram14 [255:0];
    reg [255:0] ram15 [255:0];
    reg [255:0] ram16 [255:0];
    reg [255:0] ram17 [255:0];
    reg [255:0] ram18 [255:0];
    reg [255:0] ram19 [255:0];
    reg [255:0] ram20 [255:0];
    reg [255:0] ram21 [255:0];
    reg [255:0] ram22 [255:0];
    reg [255:0] ram23 [255:0];
    reg [255:0] ram24 [255:0];
    reg [255:0] ram25 [255:0];
    reg [255:0] ram26 [255:0];
    reg [255:0] ram27 [255:0];
    reg [255:0] ram28 [255:0];
    reg [255:0] ram29 [255:0];
    reg [255:0] ram30 [255:0];
    reg [255:0] ram31 [255:0];
    
    wire [511:0] z_q,z_q2,z_q3,z_q4;
    wire [511:0] z_q5,z_q6,z_q7,z_q8;
    wire [data_width-1:0] x2,x3,x4,x5,x6,x7,x8,x9;
    wire [data_width-1:0] x10,x11,x12,x13,x14,x15,x16,x17;
    wire [data_width-1:0] x18,x19,x20,x21,x22,x23,x24,x25;
    wire [data_width-1:0] x26,x27,x28,x29,x30,x31,x32,x33;
    wire [data_width-1:0] x9_d,x17_d,x25_d,x33_d;
    wire [data_width-1:0] x5_d,x13_d,x21_d,x29_d;
    
    assign P_out = x33;
    (*DONT_TOUCH = "true"*)                    
     DFF  #(.data_width(512)) d1(
                                 .clk(clk),
                                 .rst(rst),
                                 .d(z_q),
                                 .q(z_q2)
                                 );
    (*DONT_TOUCH = "true"*)                    
     DFF  #(.data_width(512)) d2(
                                  .clk(clk),
                                  .rst(rst),
                                  .d(z_q2),
                                  .q(z_q3)
                                  );                                        
    (*DONT_TOUCH = "true"*)                    
     DFF  #(.data_width(512)) d3(
                                 .clk(clk),
                                 .rst(rst),
                                 .d(z_q3),
                                 .q(z_q4)
                                 );  
    (*DONT_TOUCH = "true"*)                    
                                  DFF  #(.data_width(512)) d4(
                                                              .clk(clk),
                                                              .rst(rst),
                                                              .d(z_q4),
                                                              .q(z_q5)
                                                              );
                                 (*DONT_TOUCH = "true"*)                    
                                  DFF  #(.data_width(512)) d5(
                                                               .clk(clk),
                                                               .rst(rst),
                                                               .d(z_q5),
                                                               .q(z_q6)
                                                               );                                        
                                 (*DONT_TOUCH = "true"*)                    
                                  DFF  #(.data_width(512)) d6(
                                                              .clk(clk),
                                                              .rst(rst),
                                                              .d(z_q6),
                                                              .q(z_q7)
                                                              );                                                                       
                                 (*DONT_TOUCH = "true"*)                    
                                  DFF  #(.data_width(512)) d7(
                                                              .clk(clk),
                                                              .rst(rst),
                                                              .d(z_q7),
                                                              .q(z_q8)
                                                               );                
                                        
                                        
                                        
    initial
    begin 
        $readmemh("D:/Xilinx_project/zcash_ram_table_modular_mul_256/LUT/LUT0.txt",ram0);
    end
    initial
    begin 
        $readmemh("D:/Xilinx_project/zcash_ram_table_modular_mul_256/LUT/LUT1.txt",ram1);
    end
    initial
    begin 
        $readmemh("D:/Xilinx_project/zcash_ram_table_modular_mul_256/LUT/LUT2.txt",ram2);
    end
    initial
    begin 
        $readmemh("D:/Xilinx_project/zcash_ram_table_modular_mul_256/LUT/LUT3.txt",ram3);
    end
    initial
    begin 
        $readmemh("D:/Xilinx_project/zcash_ram_table_modular_mul_256/LUT/LUT4.txt",ram4);
    end
    initial
    begin 
        $readmemh("D:/Xilinx_project/zcash_ram_table_modular_mul_256/LUT/LUT5.txt",ram5);
    end
    initial
    begin 
        $readmemh("D:/Xilinx_project/zcash_ram_table_modular_mul_256/LUT/LUT6.txt",ram6);
    end
    initial
    begin 
        $readmemh("D:/Xilinx_project/zcash_ram_table_modular_mul_256/LUT/LUT7.txt",ram7);
    end
    initial
    begin 
        $readmemh("D:/Xilinx_project/zcash_ram_table_modular_mul_256/LUT/LUT8.txt",ram8);
    end
    initial
    begin 
        $readmemh("D:/Xilinx_project/zcash_ram_table_modular_mul_256/LUT/LUT9.txt",ram9);
    end
    initial
    begin 
        $readmemh("D:/Xilinx_project/zcash_ram_table_modular_mul_256/LUT/LUT10.txt",ram10);
    end
    initial
    begin 
        $readmemh("D:/Xilinx_project/zcash_ram_table_modular_mul_256/LUT/LUT11.txt",ram11);
    end
    initial
    begin 
        $readmemh("D:/Xilinx_project/zcash_ram_table_modular_mul_256/LUT/LUT12.txt",ram12);
    end
    initial
    begin 
        $readmemh("D:/Xilinx_project/zcash_ram_table_modular_mul_256/LUT/LUT13.txt",ram13);
    end
    initial
    begin 
        $readmemh("D:/Xilinx_project/zcash_ram_table_modular_mul_256/LUT/LUT14.txt",ram14);
    end
    initial
    begin 
        $readmemh("D:/Xilinx_project/zcash_ram_table_modular_mul_256/LUT/LUT15.txt",ram15);
    end
    initial
    begin 
        $readmemh("D:/Xilinx_project/zcash_ram_table_modular_mul_256/LUT/LUT16.txt",ram16);
    end
    initial
    begin 
        $readmemh("D:/Xilinx_project/zcash_ram_table_modular_mul_256/LUT/LUT17.txt",ram17);
    end
    initial
    begin 
        $readmemh("D:/Xilinx_project/zcash_ram_table_modular_mul_256/LUT/LUT18.txt",ram18);
    end
    initial
    begin 
        $readmemh("D:/Xilinx_project/zcash_ram_table_modular_mul_256/LUT/LUT19.txt",ram19);
    end
    initial
    begin 
        $readmemh("D:/Xilinx_project/zcash_ram_table_modular_mul_256/LUT/LUT20.txt",ram20);
    end
    initial
    begin 
        $readmemh("D:/Xilinx_project/zcash_ram_table_modular_mul_256/LUT/LUT21.txt",ram21);
    end
    initial
    begin 
        $readmemh("D:/Xilinx_project/zcash_ram_table_modular_mul_256/LUT/LUT22.txt",ram22);
    end
    initial
    begin 
        $readmemh("D:/Xilinx_project/zcash_ram_table_modular_mul_256/LUT/LUT23.txt",ram23);
    end
    initial
    begin 
        $readmemh("D:/Xilinx_project/zcash_ram_table_modular_mul_256/LUT/LUT24.txt",ram24);
    end
    initial
    begin 
        $readmemh("D:/Xilinx_project/zcash_ram_table_modular_mul_256/LUT/LUT25.txt",ram25);
    end
    initial
    begin 
        $readmemh("D:/Xilinx_project/zcash_ram_table_modular_mul_256/LUT/LUT26.txt",ram26);
    end
    initial
    begin 
        $readmemh("D:/Xilinx_project/zcash_ram_table_modular_mul_256/LUT/LUT27.txt",ram27);
    end
    initial
    begin 
        $readmemh("D:/Xilinx_project/zcash_ram_table_modular_mul_256/LUT/LUT28.txt",ram28);
    end
    initial
    begin 
        $readmemh("D:/Xilinx_project/zcash_ram_table_modular_mul_256/LUT/LUT29.txt",ram29);
    end
    initial
    begin 
        $readmemh("D:/Xilinx_project/zcash_ram_table_modular_mul_256/LUT/LUT30.txt",ram30);
    end
    initial
    begin 
        $readmemh("D:/Xilinx_project/zcash_ram_table_modular_mul_256/LUT/LUT31.txt",ram31);
    end
    
    (*DONT_TOUCH = "true"*)
    karatsuba_mul m0(
        .clk(clk),
        .rst(rst),
        .x(A_in),
        .y(B_in),
        .z_q(z_q)
        );

       (*DONT_TOUCH = "true"*)                 
        modular_add m1(
                              .x_add(z_q[255:0]),
                              .y_add(ram0[z_q[263:256]]),
                              .z_add(x2)
                              );

       (*DONT_TOUCH = "true"*)                 
        modular_add m2(
                              .x_add(x2),
                              .y_add(ram1[z_q[271:264]]),
                              .z_add(x3)
                              );

       (*DONT_TOUCH = "true"*)                 
        modular_add m3(
                              .x_add(x3),
                              .y_add(ram2[z_q[279:272]]),
                              .z_add(x4)
                              );

       (*DONT_TOUCH = "true"*)                 
        modular_add m4(
                              .x_add(x4),
                              .y_add(ram3[z_q[287:280]]),
                              .z_add(x5_d)
                              );

       (*DONT_TOUCH = "true"*)                 
        modular_add m5(
                              .x_add(x5),
                              .y_add(ram4[z_q2[295:288]]),
                              .z_add(x6)
                              );

       (*DONT_TOUCH = "true"*)                 
        modular_add m6(
                              .x_add(x6),
                              .y_add(ram5[z_q2[303:296]]),
                              .z_add(x7)
                              );

       (*DONT_TOUCH = "true"*)                 
        modular_add m7(
                              .x_add(x7),
                              .y_add(ram6[z_q2[311:304]]),
                              .z_add(x8)
                              );

       (*DONT_TOUCH = "true"*)                 
        modular_add m8(
                              .x_add(x8),
                              .y_add(ram7[z_q2[319:312]]),
                              .z_add(x9_d)
                              );

       (*DONT_TOUCH = "true"*)                 
        modular_add m9(
                              .x_add(x9),
                              .y_add(ram8[z_q3[327:320]]),
                              .z_add(x10)
                              );

       (*DONT_TOUCH = "true"*)                 
        modular_add m10(
                              .x_add(x10),
                              .y_add(ram9[z_q3[335:328]]),
                              .z_add(x11)
                              );

       (*DONT_TOUCH = "true"*)                 
        modular_add m11(
                              .x_add(x11),
                              .y_add(ram10[z_q3[343:336]]),
                              .z_add(x12)
                              );

       (*DONT_TOUCH = "true"*)                 
        modular_add m12(
                              .x_add(x12),
                              .y_add(ram11[z_q3[351:344]]),
                              .z_add(x13_d)
                              );

       (*DONT_TOUCH = "true"*)                 
        modular_add m13(
                              .x_add(x13),
                              .y_add(ram12[z_q4[359:352]]),
                              .z_add(x14)
                              );

       (*DONT_TOUCH = "true"*)                 
        modular_add m14(
                              .x_add(x14),
                              .y_add(ram13[z_q4[367:360]]),
                              .z_add(x15)
                              );

       (*DONT_TOUCH = "true"*)                 
        modular_add m15(
                              .x_add(x15),
                              .y_add(ram14[z_q4[375:368]]),
                              .z_add(x16)
                              );

       (*DONT_TOUCH = "true"*)                 
        modular_add m16(
                              .x_add(x16),
                              .y_add(ram15[z_q4[383:376]]),
                              .z_add(x17_d)
                              );

       (*DONT_TOUCH = "true"*)                 
        modular_add m17(
                              .x_add(x17),
                              .y_add(ram16[z_q5[391:384]]),
                              .z_add(x18)
                              );

       (*DONT_TOUCH = "true"*)                 
        modular_add m18(
                              .x_add(x18),
                              .y_add(ram17[z_q5[399:392]]),
                              .z_add(x19)
                              );

       (*DONT_TOUCH = "true"*)                 
        modular_add m19(
                              .x_add(x19),
                              .y_add(ram18[z_q5[407:400]]),
                              .z_add(x20)
                              );

       (*DONT_TOUCH = "true"*)                 
        modular_add m20(
                              .x_add(x20),
                              .y_add(ram19[z_q5[415:408]]),
                              .z_add(x21_d)
                              );

       (*DONT_TOUCH = "true"*)                 
        modular_add m21(
                              .x_add(x21),
                              .y_add(ram20[z_q6[423:416]]),
                              .z_add(x22)
                              );

       (*DONT_TOUCH = "true"*)                 
        modular_add m22(
                              .x_add(x22),
                              .y_add(ram21[z_q6[431:424]]),
                              .z_add(x23)
                              );

       (*DONT_TOUCH = "true"*)                 
        modular_add m23(
                              .x_add(x23),
                              .y_add(ram22[z_q6[439:432]]),
                              .z_add(x24)
                              );

       (*DONT_TOUCH = "true"*)                 
        modular_add m24(
                              .x_add(x24),
                              .y_add(ram23[z_q6[447:440]]),
                              .z_add(x25_d)
                              );

       (*DONT_TOUCH = "true"*)                 
        modular_add m25(
                              .x_add(x25),
                              .y_add(ram24[z_q7[455:448]]),
                              .z_add(x26)
                              );

       (*DONT_TOUCH = "true"*)                 
        modular_add m26(
                              .x_add(x26),
                              .y_add(ram25[z_q7[463:456]]),
                              .z_add(x27)
                              );

       (*DONT_TOUCH = "true"*)                 
        modular_add m27(
                              .x_add(x27),
                              .y_add(ram26[z_q7[471:464]]),
                              .z_add(x28)
                              );

       (*DONT_TOUCH = "true"*)                 
        modular_add m28(
                              .x_add(x28),
                              .y_add(ram27[z_q7[479:472]]),
                              .z_add(x29_d)
                              );

       (*DONT_TOUCH = "true"*)                 
        modular_add m29(
                              .x_add(x29),
                              .y_add(ram28[z_q8[487:480]]),
                              .z_add(x30)
                              );

       (*DONT_TOUCH = "true"*)                 
        modular_add m30(
                              .x_add(x30),
                              .y_add(ram29[z_q8[495:488]]),
                              .z_add(x31)
                              );

       (*DONT_TOUCH = "true"*)                 
        modular_add m31(
                              .x_add(x31),
                              .y_add(ram30[z_q8[503:496]]),
                              .z_add(x32)
                              );

       (*DONT_TOUCH = "true"*)                 
        modular_add m32(
                              .x_add(x32),
                              .y_add(ram31[z_q8[511:504]]),
                              .z_add(x33_d)
                              );
        (*DONT_TOUCH = "true"*)                 
        DFF dd4(
                .clk(clk),
                .rst(rst),
                .d(x5_d),
                .q(x5)
                );      

        (*DONT_TOUCH = "true"*)                 
        DFF dd8(
                .clk(clk),
                .rst(rst),
                .d(x9_d),
                .q(x9)
                );
                
        (*DONT_TOUCH = "true"*)                 
                DFF dd12(
                        .clk(clk),
                        .rst(rst),
                        .d(x13_d),
                        .q(x13)
                        );                

        (*DONT_TOUCH = "true"*)                 
        DFF dd16(
                .clk(clk),
                .rst(rst),
                .d(x17_d),
                .q(x17)
                );
        (*DONT_TOUCH = "true"*)                 
         DFF dd20(
                  .clk(clk),
                  .rst(rst),
                  .d(x21_d),
                  .q(x21)
                  );                               
        (*DONT_TOUCH = "true"*)                 
        DFF dd24(
                .clk(clk),
                .rst(rst),
                .d(x25_d),
                .q(x25)
                );
        (*DONT_TOUCH = "true"*)                 
        DFF dd28(
                .clk(clk),
                .rst(rst),
                .d(x29_d),
                .q(x29)
                );                               
        (*DONT_TOUCH = "true"*)                 
        DFF dd32(
                .clk(clk),
                .rst(rst),
                .d(x33_d),
                .q(x33)
                );
            
            
endmodule
