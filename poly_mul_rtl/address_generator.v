module address_generator(
    input [6:0] s,
    input [6:0] k,
    input [6:0] i,
    input [9:0] J,
    output [9:0] old_address_0,old_address_1,old_address_2,
    output [9:0] old_address_3,old_address_4,old_address_5,
    output [9:0] old_address_6,old_address_7
    );
    parameter d = 4;
    reg [1:0] sel_J_1;
    reg sel_J_2;
    reg sel_J_3;
    wire [9:0] mul_1_a_in_0,mul_1_b_in_0,mul_1_c_out_0;
    wire [9:0] add_1_a_in_0,add_1_c_out_0;
    wire [9:0] add_2_c_out_0;
    
    wire [9:0] mul_1_a_in_1,mul_1_b_in_1,mul_1_c_out_1;
    wire [9:0] add_1_a_in_1,add_1_c_out_1;
    wire [9:0] add_2_c_out_1;
    
    wire [9:0] mul_1_a_in_2,mul_1_b_in_2,mul_1_c_out_2;
    wire [9:0] add_1_a_in_2,add_1_c_out_2;
    wire [9:0] add_2_c_out_2;
    
    wire [9:0] mul_1_a_in_3,mul_1_b_in_3,mul_1_c_out_3;
    wire [9:0] add_1_a_in_3,add_1_c_out_3;
    wire [9:0] add_2_c_out_3;
    
    wire [9:0] mul_1_a_in_4,mul_1_b_in_4,mul_1_c_out_4;
    wire [9:0] add_1_a_in_4,add_1_c_out_4;
    wire [9:0] add_2_c_out_4;
    
    wire [9:0] mul_1_a_in_5,mul_1_b_in_5,mul_1_c_out_5;
    wire [9:0] add_1_a_in_5,add_1_c_out_5;
    wire [9:0] add_2_c_out_5;
    
    wire [9:0] mul_1_a_in_6,mul_1_b_in_6,mul_1_c_out_6;
    wire [9:0] add_1_a_in_6,add_1_c_out_6;
    wire [9:0] add_2_c_out_6;
    
    wire [9:0] mul_1_a_in_7,mul_1_b_in_7,mul_1_c_out_7;
    wire [9:0] add_1_a_in_7,add_1_c_out_7;
    wire [9:0] add_2_c_out_7;    
    
    always@(J)
    begin
       if(J >= d)
       begin
           sel_J_1 <= 0;
           sel_J_2 <= 1;
           sel_J_3 <= 0;
       end
       else if(J > 1)
       begin
            sel_J_1 <= 2;
            sel_J_2 <= 0;
            sel_J_3 <= 1;
       end
       else
       begin
            sel_J_1 <= 1;
            sel_J_2 <= 0;
            sel_J_3 <= 1;
       end
    end
    
    assign mul_1_a_in_0 = sel_J_2 == 0? s : k;
    assign mul_1_b_in_0 = sel_J_2 == 0? 8 : (J << 1);
    assign mul_1_c_out_0 = mul_1_a_in_0 * mul_1_b_in_0;
    assign add_1_a_in_0 = sel_J_1 == 0? (i << 2) : (sel_J_1 == 1? 0 : 0);
    assign add_1_c_out_0 = add_1_a_in_0 + mul_1_c_out_0;
    assign add_2_c_out_0 = add_1_c_out_0 + 0;
    assign old_address_0 = sel_J_3 == 1? add_1_c_out_0 : add_2_c_out_0;
    
    assign mul_1_a_in_1 = sel_J_2 == 0? s : k;
    assign mul_1_b_in_1 = sel_J_2 == 0? 8 : (J << 1);
    assign mul_1_c_out_1 = mul_1_a_in_1 * mul_1_b_in_1;
    assign add_1_a_in_1 = sel_J_1 == 0? (i << 2) : (sel_J_1 == 1? 1 : 2);
    assign add_1_c_out_1 = add_1_a_in_1 + mul_1_c_out_1;
    assign add_2_c_out_1 = add_1_c_out_1 + J;
    assign old_address_1 = sel_J_3 == 1? add_1_c_out_1 : add_2_c_out_1;  
    
    assign mul_1_a_in_2 = sel_J_2 == 0? s : k;
    assign mul_1_b_in_2 = sel_J_2 == 0? 8 : (J << 1);
    assign mul_1_c_out_2 = mul_1_a_in_2 * mul_1_b_in_2;
    assign add_1_a_in_2 = sel_J_1 == 0? (i << 2) : (sel_J_1 == 1? 2 : 1);
    assign add_1_c_out_2 = add_1_a_in_2 + mul_1_c_out_2;
    assign add_2_c_out_2 = add_1_c_out_2 + 1;
    assign old_address_2 = sel_J_3 == 1? add_1_c_out_2 : add_2_c_out_2;  
    
    assign mul_1_a_in_3 = sel_J_2 == 0? s : k;
    assign mul_1_b_in_3 = sel_J_2 == 0? 8 : (J << 1);
    assign mul_1_c_out_3 = mul_1_a_in_3 * mul_1_b_in_3;
    assign add_1_a_in_3 = sel_J_1 == 0? (i << 2) : (sel_J_1 == 1? 3 : 3);
    assign add_1_c_out_3 = add_1_a_in_3 + mul_1_c_out_3;
    assign add_2_c_out_3 = add_1_c_out_3 + J + 1;
    assign old_address_3 = sel_J_3 == 1? add_1_c_out_3 : add_2_c_out_3;
    
    assign mul_1_a_in_4 = sel_J_2 == 0? s : k;
    assign mul_1_b_in_4 = sel_J_2 == 0? 8 : (J << 1);
    assign mul_1_c_out_4 = mul_1_a_in_4 * mul_1_b_in_4;
    assign add_1_a_in_4 = sel_J_1 == 0? (i << 2) : (sel_J_1 == 1? 4 : 4);
    assign add_1_c_out_4 = add_1_a_in_4 + mul_1_c_out_4;
    assign add_2_c_out_4 = add_1_c_out_4 + 2;
    assign old_address_4 = sel_J_3 == 1? add_1_c_out_4 : add_2_c_out_4;
    
    assign mul_1_a_in_5 = sel_J_2 == 0? s : k;
    assign mul_1_b_in_5 = sel_J_2 == 0? 8 : (J << 1);
    assign mul_1_c_out_5 = mul_1_a_in_5 * mul_1_b_in_5;
    assign add_1_a_in_5 = sel_J_1 == 0? (i << 2) : (sel_J_1 == 1? 5 : 6);
    assign add_1_c_out_5 = add_1_a_in_5 + mul_1_c_out_5;
    assign add_2_c_out_5 = add_1_c_out_5 + J + 2;
    assign old_address_5 = sel_J_3 == 1? add_1_c_out_5 : add_2_c_out_5;
    
    assign mul_1_a_in_6 = sel_J_2 == 0? s : k;
    assign mul_1_b_in_6 = sel_J_2 == 0? 8 : (J << 1);
    assign mul_1_c_out_6 = mul_1_a_in_6 * mul_1_b_in_6;
    assign add_1_a_in_6 = sel_J_1 == 0? (i << 2) : (sel_J_1 == 1? 6 : 5);
    assign add_1_c_out_6 = add_1_a_in_6 + mul_1_c_out_6;
    assign add_2_c_out_6 = add_1_c_out_6 + 3;
    assign old_address_6 = sel_J_3 == 1? add_1_c_out_6 : add_2_c_out_6;
    
    assign mul_1_a_in_7 = sel_J_2 == 0? s : k;
    assign mul_1_b_in_7 = sel_J_2 == 0? 8 : (J << 1);
    assign mul_1_c_out_7 = mul_1_a_in_7 * mul_1_b_in_7;
    assign add_1_a_in_7 = sel_J_1 == 0? (i << 2) : (sel_J_1 == 1? 7 : 7);
    assign add_1_c_out_7 = add_1_a_in_7 + mul_1_c_out_7;
    assign add_2_c_out_7 = add_1_c_out_7 + J + 3;
    assign old_address_7 = sel_J_3 == 1? add_1_c_out_7 : add_2_c_out_7;
    
endmodule
