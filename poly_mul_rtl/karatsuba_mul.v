//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/26 21:55:19
// Design Name: 
// Module Name: karatsuba_mul
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

module karatsuba_mul #(parameter data_width = 256)(
    input [255:0] x,y,
    input clk,rst,
	output wire [511:0] z_q
    );
    wire [127:0] x0,x1,y0,y1;
	wire sign1;
	wire [127:0] x_sub1_in,y_sub1_in;
	wire sign2;
	wire [127:0] x_sub2_in,y_sub2_in;
	
	wire op,op1,op2;//为0时加法，为1时减法
	wire [127:0] diffx,diffy;
	wire [255:0] mul3_z;
	wire [255:0] mul2_z;
    wire [255:0] mul1_z;

	wire [383:0] shif1;
    wire [383:0] shif2;
	wire [383:0] shif3;
	//wire [383:0] xor_out;
	wire [511:0] shif4;
	
	wire [511:0] combine;
	wire [511:0] z;
	wire [511:0] add1_out,add2_out;
	
	//流水线
	wire [255:0] mul1_z_q,mul2_z_q,mul3_z_q;
	wire [511:0] add2_out_q;
	wire [127:0] diffx_q,diffy_q;
	
    (*DONT_TOUCH = "true"*)                    
    DFFbit db1(
           .clk(clk),
           .rst(rst),
           .d(op),
           .q(op1)
           );	
	
    (*DONT_TOUCH = "true"*)                    
     DFFbit db2(
                  .clk(clk),
                  .rst(rst),
                  .d(op1),
                  .q(op2)
                  );
                  	
    (*DONT_TOUCH = "true"*)                    
    DFF d1(
           .clk(clk),
           .rst(rst),
           .d(mul1_z),
           .q(mul1_z_q)
           );	
    (*DONT_TOUCH = "true"*)                    
    DFF d2(
           .clk(clk),
           .rst(rst),
           .d(mul2_z),
           .q(mul2_z_q)
           );	
    (*DONT_TOUCH = "true"*)                    
     DFF d3(
            .clk(clk),
            .rst(rst),
            .d(mul3_z),
            .q(mul3_z_q)
            );	
    (*DONT_TOUCH = "true"*)                    
    DFF  #(.data_width(512)) d4(
                                .clk(clk),
                                .rst(rst),
                                .d(add2_out),
                                .q(add2_out_q)
                                );                         
    (*DONT_TOUCH = "true"*)                    
     DFF  #(.data_width(128)) d5(
                                 .clk(clk),
                                 .rst(rst),
                                 .d(diffx),
                                 .q(diffx_q)
                                );    
    (*DONT_TOUCH = "true"*)                    
     DFF  #(.data_width(128)) d6(
                                 .clk(clk),
                                 .rst(rst),
                                 .d(diffy),
                                 .q(diffy_q)
                                 );  
    (*DONT_TOUCH = "true"*)                    
     DFF  #(.data_width(512)) d7(
                                        .clk(clk),
                                        .rst(rst),
                                        .d(z),
                                        .q(z_q)
                                        );                                 
                                   
                         
	assign x0 = x[127:0];
    assign x1 = x[255:128];
	assign y0 = y[127:0];
	assign y1 = y[255:128];
		
	assign sign1 = (x0 > x1)? 0 : 1;
	assign x_sub1_in = sign1 == 0? x0 : x1;
	assign y_sub1_in = sign1 == 0? x1 : x0;
	assign diffx = x_sub1_in - y_sub1_in;
	
	assign sign2 = (y0 > y1)? 0 : 1;
	assign x_sub2_in = sign2 == 0? y0 : y1;
	assign y_sub2_in = sign2 == 0? y1 : y0;
	assign diffy = x_sub2_in - y_sub2_in;
	
	assign mul3_z = diffx_q * diffy_q;
	assign shif3 = mul3_z_q << 128;
	
	assign mul1_z = x0 * y0;
	assign shif1 = mul1_z_q << 128;
	assign mul2_z = x1 * y1;
	assign shif2 = mul2_z_q << 128;
	
	assign shif4 = shif2 << 128;
	
	assign combine[255:0] = mul1_z_q;
	assign combine[511:256] = shif4[511:256];
	
	assign add1_out = combine + shif1;
	assign add2_out = add1_out + shif2;
	assign op = sign1 == sign2? 1'b1 : 1'b0;
	assign z = op2 == 1? add2_out_q - shif3 : add2_out_q + shif3;
	
endmodule
