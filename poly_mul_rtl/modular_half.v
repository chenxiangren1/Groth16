module modular_half #(parameter data_width = 256)(
    input [data_width-1:0] x_half,
    output [data_width-1:0] y_half
    );
    
    parameter M = 256'h73eda753299d7d483339d80809a1d80553bda402fffe5bfeffffffff00000001;
    parameter M_half = 256'h39f6d3a994cebea4199cec0404d0ec02a9ded2017fff2dff7fffffff80000001;
    //parameter M = 32'h73eda753;
    //parameter M_half = 32'h39f6d3a9;
    wire [data_width-1:0] x_sh;
    wire c;
    wire [data_width-1:0] s;
    
    assign x_sh = x_half >> 1;
    assign {c,s} = x_sh + M_half;
    assign y_half = x_half[0] == 1? s : x_sh;
endmodule