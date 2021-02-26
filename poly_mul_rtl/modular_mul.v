module modular_mul #(parameter data_width = 256)(
    input clk,rst,
    input [data_width-1:0] A_in,
    input [data_width-1:0] B_in,
    output [data_width-1:0] P_out
    );
    parameter M = 256'h73eda753299d7d483339d80809a1d80553bda402fffe5bfeffffffff00000001;
    parameter R2 = 256'h748d9d99f59ff1105d314967254398f2b6cedcb87925c23c999e990f3f29c6d;
    //parameter M = 32'h73eda753;
    //parameter R2 = 32'h748d9d99;
    
    wire [data_width-1:0] result_1;
    wire [data_width-1:0] result_2;
    wire [data_width-1:0] result_3;
    wire [data_width-1:0] result_4;
    
    wire [data_width-1:0] q_1;
    wire [data_width-1:0] q_2;
    wire [data_width-1:0] q_3;
    wire [data_width-1:0] q_4;
    
    montgomery_mul m1(
        .A(A_in),
        .B(R2),
        .P_256(result_1)
        );
    montgomery_mul m2(
                .A(B_in),
                .B(R2),
                .P_256(result_2)
                );
     DFF m3(
          .clk(clk),.rst(rst),
          .d(result_1),
          .q(q_1)
          );
     DFF m4(
           .clk(clk),.rst(rst),
           .d(result_2),
           .q(q_2)
           );
     montgomery_mul m5(
                   .A(q_1),
                   .B(q_2),
                   .P_256(result_3)
                   );
     DFF m6(
            .clk(clk),.rst(rst),
            .d(result_3),
            .q(q_3)
            );
     montgomery_mul m7(
                       .A(q_3),
                       .B(1),
                       .P_256(result_4)
                       );
     DFF m8(
            .clk(clk),.rst(rst),
            .d(result_4),
            .q(q_4)
            );     
     assign P_out = q_4;
endmodule