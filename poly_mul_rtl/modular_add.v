module modular_add #(parameter data_width = 256)(
    input [data_width-1:0] x_add,
    input [data_width-1:0] y_add,
    output [data_width-1:0] z_add
    );
    
    parameter M = 256'h73eda753299d7d483339d80809a1d80553bda402fffe5bfeffffffff00000001;
    //parameter M = 32'h73eda753;
    wire [data_width-1:0] s;
    wire c;
    wire [data_width-1:0] d;
    wire b;
    wire sel;
    
    assign sel = ~((~c) & b);
    assign {c,s} = x_add + y_add;
    assign {b,d} = s - M;
    assign z_add = sel == 1? d : s;
    
endmodule