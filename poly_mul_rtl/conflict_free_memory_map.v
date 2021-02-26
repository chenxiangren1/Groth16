module conflict_free_memory_map(
    input [9:0] old_address_0,
    input [9:0] old_address_1,
    input [9:0] old_address_2,
    input [9:0] old_address_3,
    input [9:0] old_address_4,
    input [9:0] old_address_5,
    input [9:0] old_address_6,
    input [9:0] old_address_7,
    output [6:0] new_address_0,
    output [6:0] new_address_1,
    output [6:0] new_address_2,
    output [6:0] new_address_3,
    output [6:0] new_address_4,
    output [6:0] new_address_5,
    output [6:0] new_address_6,
    output [6:0] new_address_7,
    output [2:0] bank_number_0,
    output [2:0] bank_number_1,
    output [2:0] bank_number_2,
    output [2:0] bank_number_3,
    output [2:0] bank_number_4,
    output [2:0] bank_number_5,
    output [2:0] bank_number_6,
    output [2:0] bank_number_7
    );
    reg mem[127:0];
    //地址被分到了哪个组
    wire [6:0] array_number_0;
    wire [6:0] array_number_1;
    wire [6:0] array_number_2;
    wire [6:0] array_number_3;
    wire [6:0] array_number_4;
    wire [6:0] array_number_5;
    wire [6:0] array_number_6;
    wire [6:0] array_number_7;
    wire [2:0] bank_number_tmp1_0,bank_number_tmp2_0;
    wire [2:0] bank_number_tmp1_1,bank_number_tmp2_1;
    wire [2:0] bank_number_tmp1_2,bank_number_tmp2_2;
    wire [2:0] bank_number_tmp1_3,bank_number_tmp2_3;
    wire [2:0] bank_number_tmp1_4,bank_number_tmp2_4;
    wire [2:0] bank_number_tmp1_5,bank_number_tmp2_5;
    wire [2:0] bank_number_tmp1_6,bank_number_tmp2_6;
    wire [2:0] bank_number_tmp1_7,bank_number_tmp2_7;
    
    initial
    begin
      $readmemb("D:/Xilinx_project/polynomial_mul_1024/look_up_table.txt",mem);
    end   
    
    assign new_address_0 = old_address_0 >> 3;
    assign array_number_0 = new_address_0;
    assign bank_number_tmp1_0 = old_address_0 - (array_number_0 << 3);
    assign bank_number_tmp2_0 = 7 - bank_number_tmp1_0;
    assign bank_number_0 = mem[array_number_0] == 0? bank_number_tmp1_0 : bank_number_tmp2_0;
    
    assign new_address_1 = old_address_1 >> 3;
    assign array_number_1 = new_address_1;
    assign bank_number_tmp1_1 = old_address_1 - (array_number_1 << 3);
    assign bank_number_tmp2_1 = 7 - bank_number_tmp1_1;
    assign bank_number_1 = mem[array_number_1] == 0? bank_number_tmp1_1 : bank_number_tmp2_1;
    
    assign new_address_2 = old_address_2 >> 3;
    assign array_number_2 = new_address_2;
    assign bank_number_tmp1_2 = old_address_2 - (array_number_2 << 3);
    assign bank_number_tmp2_2 = 7 - bank_number_tmp1_2;
    assign bank_number_2 = mem[array_number_2] == 0? bank_number_tmp1_2 : bank_number_tmp2_2;
    
    assign new_address_3 = old_address_3 >> 3;
    assign array_number_3 = new_address_3;
    assign bank_number_tmp1_3 = old_address_3 - (array_number_3 << 3);
    assign bank_number_tmp2_3 = 7 - bank_number_tmp1_3;
    assign bank_number_3 = mem[array_number_3] == 0? bank_number_tmp1_3 : bank_number_tmp2_3;
    
    assign new_address_4 = old_address_4 >> 3;
    assign array_number_4 = new_address_4;
    assign bank_number_tmp1_4 = old_address_4 - (array_number_4 << 3);
    assign bank_number_tmp2_4 = 7 - bank_number_tmp1_4;
    assign bank_number_4 = mem[array_number_4] == 0? bank_number_tmp1_4 : bank_number_tmp2_4;
    
    assign new_address_5 = old_address_5 >> 3;
    assign array_number_5 = new_address_5;
    assign bank_number_tmp1_5 = old_address_5 - (array_number_5 << 3);
    assign bank_number_tmp2_5 = 7 - bank_number_tmp1_5;
    assign bank_number_5 = mem[array_number_5] == 0? bank_number_tmp1_5 : bank_number_tmp2_5;
    
    assign new_address_6 = old_address_6 >> 3;
    assign array_number_6 = new_address_6;
    assign bank_number_tmp1_6 = old_address_6 - (array_number_6 << 3);
    assign bank_number_tmp2_6 = 7 - bank_number_tmp1_6;
    assign bank_number_6 = mem[array_number_6] == 0? bank_number_tmp1_6 : bank_number_tmp2_6;
    
    assign new_address_7 = old_address_7 >> 3;
    assign array_number_7 = new_address_7;
    assign bank_number_tmp1_7 = old_address_7 - (array_number_7 << 3);
    assign bank_number_tmp2_7 = 7 - bank_number_tmp1_7;
    assign bank_number_7 = mem[array_number_7] == 0? bank_number_tmp1_7 : bank_number_tmp2_7;                   
endmodule