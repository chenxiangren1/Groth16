`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/23 11:05:48
// Design Name: 
// Module Name: modular_substraction
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


module modular_substraction #(parameter data_width = 256)(
    input [data_width-1:0] x_sub,
    input [data_width-1:0] y_sub,
    output [data_width-1:0] z_sub
    );
    
    parameter M = 256'h73eda753299d7d483339d80809a1d80553bda402fffe5bfeffffffff00000001;
    //parameter M = 32'h73eda753;
    
    wire [data_width-1:0] q;
    wire c;
    wire [data_width-1:0] d;
    wire b;
    
    assign {b,d} = x_sub - y_sub;
    assign  q = b == 1? M : 0;
    assign {c,z_sub} = d + q;
    
endmodule
