`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/26 16:44:27
// Design Name: 
// Module Name: top_poly_mul
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

(*DONT_TOUCH = "true"*)
module top_poly_mul 
    #(parameter addr_rom_width = 4'b1001,
                 addr_width = 3'b111,
                 data_width = 256)
   (
    input clk,rst,
    input start,
    output done
    );
    
    //fsm的端口信号
    wire [9:0] J;
    wire [6:0] s;
    wire [6:0] k;
    wire [6:0] i;
    wire sel,sel_m;
    wire wen,ren,en,wen_b;
    
    //address_generator的端口信号
    wire [9:0] old_address_0,old_address_1,old_address_2,old_address_3;
    wire [9:0] old_address_4,old_address_5,old_address_6,old_address_7;
    
    //memory map的输出信号，map后的新地址
    wire [addr_width-1:0] b0,b1,b2,b3,b4,b5,b6,b7;
    //memory map的输出信号，map后的bank_number
    wire [2:0] a0,a1,a2,a3,a4,a5,a6,a7;
    
    //control_bank_in_unit的输出信号，控制着后续的选择
    wire [2:0] sel_a_0,sel_a_1,sel_a_2,sel_a_3,sel_a_4,sel_a_5,sel_a_6,sel_a_7;
    
    //输入给各个bank的写地址，需打5拍
    reg [addr_width-1:0] new_address_0_tmp1,new_address_1_tmp1,new_address_2_tmp1,new_address_3_tmp1;
    reg [addr_width-1:0] new_address_4_tmp1,new_address_5_tmp1,new_address_6_tmp1,new_address_7_tmp1;
    reg [addr_width-1:0] new_address_0_tmp2,new_address_1_tmp2,new_address_2_tmp2,new_address_3_tmp2;
    reg [addr_width-1:0] new_address_4_tmp2,new_address_5_tmp2,new_address_6_tmp2,new_address_7_tmp2;
    reg [addr_width-1:0] new_address_0_tmp3,new_address_1_tmp3,new_address_2_tmp3,new_address_3_tmp3;
    reg [addr_width-1:0] new_address_4_tmp3,new_address_5_tmp3,new_address_6_tmp3,new_address_7_tmp3;        
    reg [addr_width-1:0] new_address_0_tmp4,new_address_1_tmp4,new_address_2_tmp4,new_address_3_tmp4;
    reg [addr_width-1:0] new_address_4_tmp4,new_address_5_tmp4,new_address_6_tmp4,new_address_7_tmp4;
    reg [addr_width-1:0] new_address_0_tmp5,new_address_1_tmp5,new_address_2_tmp5,new_address_3_tmp5;
    reg [addr_width-1:0] new_address_4_tmp5,new_address_5_tmp5,new_address_6_tmp5,new_address_7_tmp5; 
    reg [addr_width-1:0] new_address_0_tmp6,new_address_1_tmp6,new_address_2_tmp6,new_address_3_tmp6;
    reg [addr_width-1:0] new_address_4_tmp6,new_address_5_tmp6,new_address_6_tmp6,new_address_7_tmp6;   
    reg [addr_width-1:0] new_address_0_tmp7,new_address_1_tmp7,new_address_2_tmp7,new_address_3_tmp7;
    reg [addr_width-1:0] new_address_4_tmp7,new_address_5_tmp7,new_address_6_tmp7,new_address_7_tmp7;  
    reg [addr_width-1:0] new_address_0_tmp8,new_address_1_tmp8,new_address_2_tmp8,new_address_3_tmp8;
    reg [addr_width-1:0] new_address_4_tmp8,new_address_5_tmp8,new_address_6_tmp8,new_address_7_tmp8;   
    reg [addr_width-1:0] new_address_0_tmp9,new_address_1_tmp9,new_address_2_tmp9,new_address_3_tmp9;
    reg [addr_width-1:0] new_address_4_tmp9,new_address_5_tmp9,new_address_6_tmp9,new_address_7_tmp9; 
    reg [addr_width-1:0] new_address_0_tmp10,new_address_1_tmp10,new_address_2_tmp10,new_address_3_tmp10;
    reg [addr_width-1:0] new_address_4_tmp10,new_address_5_tmp10,new_address_6_tmp10,new_address_7_tmp10; 
    reg [addr_width-1:0] new_address_0_tmp11,new_address_1_tmp11,new_address_2_tmp11,new_address_3_tmp11;
    reg [addr_width-1:0] new_address_4_tmp11,new_address_5_tmp11,new_address_6_tmp11,new_address_7_tmp11;
    reg [addr_width-1:0] new_address_0_tmp12,new_address_1_tmp12,new_address_2_tmp12,new_address_3_tmp12;
    reg [addr_width-1:0] new_address_4_tmp12,new_address_5_tmp12,new_address_6_tmp12,new_address_7_tmp12;
    reg [addr_width-1:0] new_address_0_tmp13,new_address_1_tmp13,new_address_2_tmp13,new_address_3_tmp13;
    reg [addr_width-1:0] new_address_4_tmp13,new_address_5_tmp13,new_address_6_tmp13,new_address_7_tmp13;       
    wire [addr_width-1:0] bank_0_A1,bank_1_A1,bank_2_A1,bank_3_A1,bank_4_A1,bank_5_A1,bank_6_A1,bank_7_A1;
         
    //输入给各个bank的读地址
    wire [addr_width-1:0] new_address_0,new_address_1,new_address_2,new_address_3;
    wire [addr_width-1:0] new_address_4,new_address_5,new_address_6,new_address_7;
    //从各个bank读出的数据
    wire [data_width-1:0] q0,q1,q2,q3,q4,q5,q6,q7;
    
    //输入给蝶形单元的数据
    wire [data_width-1:0] u0,v0,u1,v1,u2,v2,u3,v3;
    //蝶形单元的输出数据
    wire [data_width-1:0] bf_0_upper,bf_0_lower,bf_1_upper,bf_1_lower;
    wire [data_width-1:0] bf_2_upper,bf_2_lower,bf_3_upper,bf_3_lower;
    //输入给各个bank的结果数据
    wire [data_width-1:0] d0,d1,d2,d3,d4,d5,d6,d7;
   
    //输入给各个bank的旋转因子
    wire [data_width-1:0] w0,w1,w2,w3;  
    wire [data_width-1:0] invw0,invw1,invw2,invw3;
    wire [data_width-1:0] win0,win1,win2,win3;
    
    //输入给各个ROM的旋转因子的地址
    wire [addr_rom_width-1:0] tf_address;
    wire [addr_rom_width-1:0] tf_address_w;
    wire [addr_rom_width-1:0] tf_address_invw;
    
    //从bank_b中读出的数据
    wire [data_width-1:0] q0_b,q1_b,q2_b,q3_b,q4_b,q5_b,q6_b,q7_b;   
    //输入给蝶形单元b的数据
    wire [data_width-1:0] u0_b,v0_b,u1_b,v1_b,u2_b,v2_b,u3_b,v3_b;
    //蝶形单元b的输出数据
    wire [data_width-1:0] bf_0_upper_b,bf_0_lower_b,bf_1_upper_b,bf_1_lower_b;
    wire [data_width-1:0] bf_2_upper_b,bf_2_lower_b,bf_3_upper_b,bf_3_lower_b;
    //输入给各个bankb的结果数据
    wire [data_width-1:0] d0_b,d1_b,d2_b,d3_b,d4_b,d5_b,d6_b,d7_b;
    
    //内积之后的结果
    wire [data_width-1:0] c0,c1,c2,c3,c4,c5,c6,c7;
    
    //输入给control_bf_out的数据，排序后输入到对应的bank中
    wire [data_width-1:0] bf_0_upper_in,bf_0_lower_in,bf_1_upper_in,bf_1_lower_in;
    wire [data_width-1:0] bf_2_upper_in,bf_2_lower_in,bf_3_upper_in,bf_3_lower_in;
    reg sel_m_tmp1,sel_m_tmp2,sel_m_tmp3,sel_m_tmp4,sel_m_tmp5,sel_m_tmp6,sel_m_tmp7,sel_m_tmp8;
    reg sel_m_tmp9,sel_m_tmp10,sel_m_tmp11,sel_m_tmp12,sel_m_tmp13;
    wire sel_m_in;

    assign sel_m_in = sel_m_tmp2;   
    
    assign bf_0_lower_in = sel_m_tmp13 == 1? bf_0_lower : c0;
    assign bf_0_upper_in = sel_m_tmp13 == 1? bf_0_upper : c1;
    assign bf_1_lower_in = sel_m_tmp13 == 1? bf_1_lower : c2;
    assign bf_1_upper_in = sel_m_tmp13 == 1? bf_1_upper : c3;
    assign bf_2_lower_in = sel_m_tmp13 == 1? bf_2_lower : c4;
    assign bf_2_upper_in = sel_m_tmp13 == 1? bf_2_upper : c5;
    assign bf_3_lower_in = sel_m_tmp13 == 1? bf_3_lower : c6;
    assign bf_3_upper_in = sel_m_tmp13 == 1? bf_3_upper : c7;
    
    always@(posedge clk or posedge rst)
    begin
      if(rst)
      begin
        new_address_0_tmp1 <= 0;
        new_address_1_tmp1 <= 0;
        new_address_2_tmp1 <= 0;
        new_address_3_tmp1 <= 0;
        new_address_4_tmp1 <= 0;
        new_address_5_tmp1 <= 0;
        new_address_6_tmp1 <= 0;
        new_address_7_tmp1 <= 0;
        sel_m_tmp1 <= 1;
      end
      else
      begin
        new_address_0_tmp1 <= new_address_0;
        new_address_1_tmp1 <= new_address_1;
        new_address_2_tmp1 <= new_address_2;
        new_address_3_tmp1 <= new_address_3;
        new_address_4_tmp1 <= new_address_4;
        new_address_5_tmp1 <= new_address_5;
        new_address_6_tmp1 <= new_address_6;
        new_address_7_tmp1 <= new_address_7;
        sel_m_tmp1 <= sel_m;
      end
    end
    
    always@(posedge clk or posedge rst)
    begin
      if(rst)
      begin
        new_address_0_tmp2 <= 0;
        new_address_1_tmp2 <= 0;
        new_address_2_tmp2 <= 0;
        new_address_3_tmp2 <= 0;
        new_address_4_tmp2 <= 0;
        new_address_5_tmp2 <= 0;
        new_address_6_tmp2 <= 0;
        new_address_7_tmp2 <= 0;
        sel_m_tmp2 <= 1;
      end
      else
      begin
        new_address_0_tmp2 <= new_address_0_tmp1;
        new_address_1_tmp2 <= new_address_1_tmp1;
        new_address_2_tmp2 <= new_address_2_tmp1;
        new_address_3_tmp2 <= new_address_3_tmp1;
        new_address_4_tmp2 <= new_address_4_tmp1;
        new_address_5_tmp2 <= new_address_5_tmp1;
        new_address_6_tmp2 <= new_address_6_tmp1;
        new_address_7_tmp2 <= new_address_7_tmp1;
        sel_m_tmp2 <= sel_m_tmp1;
      end
    end 
    
    always@(posedge clk or posedge rst)
    begin
      if(rst)
      begin
        new_address_0_tmp3 <= 0;
        new_address_1_tmp3 <= 0;
        new_address_2_tmp3 <= 0;
        new_address_3_tmp3 <= 0;
        new_address_4_tmp3 <= 0;
        new_address_5_tmp3 <= 0;
        new_address_6_tmp3 <= 0;
        new_address_7_tmp3 <= 0;
        sel_m_tmp3 <= 1;
      end
      else
      begin
        new_address_0_tmp3 <= new_address_0_tmp2;
        new_address_1_tmp3 <= new_address_1_tmp2;
        new_address_2_tmp3 <= new_address_2_tmp2;
        new_address_3_tmp3 <= new_address_3_tmp2;
        new_address_4_tmp3 <= new_address_4_tmp2;
        new_address_5_tmp3 <= new_address_5_tmp2;
        new_address_6_tmp3 <= new_address_6_tmp2;
        new_address_7_tmp3 <= new_address_7_tmp2;
        sel_m_tmp3 <= sel_m_tmp2;
      end
    end   
    
    always@(posedge clk or posedge rst)
        begin
          if(rst)
          begin
            new_address_0_tmp4 <= 0;
            new_address_1_tmp4 <= 0;
            new_address_2_tmp4 <= 0;
            new_address_3_tmp4 <= 0;
            new_address_4_tmp4 <= 0;
            new_address_5_tmp4 <= 0;
            new_address_6_tmp4 <= 0;
            new_address_7_tmp4 <= 0;
            sel_m_tmp4 <= 1;
          end
          else
          begin
            new_address_0_tmp4 <= new_address_0_tmp3;
            new_address_1_tmp4 <= new_address_1_tmp3;
            new_address_2_tmp4 <= new_address_2_tmp3;
            new_address_3_tmp4 <= new_address_3_tmp3;
            new_address_4_tmp4 <= new_address_4_tmp3;
            new_address_5_tmp4 <= new_address_5_tmp3;
            new_address_6_tmp4 <= new_address_6_tmp3;
            new_address_7_tmp4 <= new_address_7_tmp3;
            sel_m_tmp4 <= sel_m_tmp3;
          end
        end    
            
    always@(posedge clk or posedge rst)
    begin
      if(rst)
      begin
        new_address_0_tmp5 <= 0;
        new_address_1_tmp5 <= 0;
        new_address_2_tmp5 <= 0;
        new_address_3_tmp5 <= 0;
        new_address_4_tmp5 <= 0;
        new_address_5_tmp5 <= 0;
        new_address_6_tmp5 <= 0;
        new_address_7_tmp5 <= 0;
        sel_m_tmp5 <= 1;
      end
      else
      begin
        new_address_0_tmp5 <= new_address_0_tmp4;
        new_address_1_tmp5 <= new_address_1_tmp4;
        new_address_2_tmp5 <= new_address_2_tmp4;
        new_address_3_tmp5 <= new_address_3_tmp4;
        new_address_4_tmp5 <= new_address_4_tmp4;
        new_address_5_tmp5 <= new_address_5_tmp4;
        new_address_6_tmp5 <= new_address_6_tmp4;
        new_address_7_tmp5 <= new_address_7_tmp4;
        sel_m_tmp5 <= sel_m_tmp4;
      end
    end    

always@(posedge clk or posedge rst)
    begin
      if(rst)
      begin
        new_address_0_tmp6 <= 0;
        new_address_1_tmp6 <= 0;
        new_address_2_tmp6 <= 0;
        new_address_3_tmp6 <= 0;
        new_address_4_tmp6 <= 0;
        new_address_5_tmp6 <= 0;
        new_address_6_tmp6 <= 0;
        new_address_7_tmp6 <= 0;
        sel_m_tmp6 <= 1;
      end
      else
      begin
        new_address_0_tmp6 <= new_address_0_tmp5;
        new_address_1_tmp6 <= new_address_1_tmp5;
        new_address_2_tmp6 <= new_address_2_tmp5;
        new_address_3_tmp6 <= new_address_3_tmp5;
        new_address_4_tmp6 <= new_address_4_tmp5;
        new_address_5_tmp6 <= new_address_5_tmp5;
        new_address_6_tmp6 <= new_address_6_tmp5;
        new_address_7_tmp6 <= new_address_7_tmp5;
        sel_m_tmp6 <= sel_m_tmp5;
      end
    end

    always@(posedge clk or posedge rst)
    begin
      if(rst)
      begin
        new_address_0_tmp7 <= 0;
        new_address_1_tmp7 <= 0;
        new_address_2_tmp7 <= 0;
        new_address_3_tmp7 <= 0;
        new_address_4_tmp7 <= 0;
        new_address_5_tmp7 <= 0;
        new_address_6_tmp7 <= 0;
        new_address_7_tmp7 <= 0;
        sel_m_tmp7 <= 1;
      end
      else
      begin
        new_address_0_tmp7 <= new_address_0_tmp6;
        new_address_1_tmp7 <= new_address_1_tmp6;
        new_address_2_tmp7 <= new_address_2_tmp6;
        new_address_3_tmp7 <= new_address_3_tmp6;
        new_address_4_tmp7 <= new_address_4_tmp6;
        new_address_5_tmp7 <= new_address_5_tmp6;
        new_address_6_tmp7 <= new_address_6_tmp6;
        new_address_7_tmp7 <= new_address_7_tmp6;
        sel_m_tmp7 <= sel_m_tmp6;
      end
    end

    always@(posedge clk or posedge rst)
    begin
      if(rst)
      begin
        new_address_0_tmp8 <= 0;
        new_address_1_tmp8 <= 0;
        new_address_2_tmp8 <= 0;
        new_address_3_tmp8 <= 0;
        new_address_4_tmp8 <= 0;
        new_address_5_tmp8 <= 0;
        new_address_6_tmp8 <= 0;
        new_address_7_tmp8 <= 0;
        sel_m_tmp8 <= 1;
      end
      else
      begin
        new_address_0_tmp8 <= new_address_0_tmp7;
        new_address_1_tmp8 <= new_address_1_tmp7;
        new_address_2_tmp8 <= new_address_2_tmp7;
        new_address_3_tmp8 <= new_address_3_tmp7;
        new_address_4_tmp8 <= new_address_4_tmp7;
        new_address_5_tmp8 <= new_address_5_tmp7;
        new_address_6_tmp8 <= new_address_6_tmp7;
        new_address_7_tmp8 <= new_address_7_tmp7;
        sel_m_tmp8 <= sel_m_tmp7;
      end
    end

    always@(posedge clk or posedge rst)
    begin
      if(rst)
      begin
        new_address_0_tmp9 <= 0;
        new_address_1_tmp9 <= 0;
        new_address_2_tmp9 <= 0;
        new_address_3_tmp9 <= 0;
        new_address_4_tmp9 <= 0;
        new_address_5_tmp9 <= 0;
        new_address_6_tmp9 <= 0;
        new_address_7_tmp9 <= 0;
        sel_m_tmp9 <= 1;
      end
      else
      begin
        new_address_0_tmp9 <= new_address_0_tmp8;
        new_address_1_tmp9 <= new_address_1_tmp8;
        new_address_2_tmp9 <= new_address_2_tmp8;
        new_address_3_tmp9 <= new_address_3_tmp8;
        new_address_4_tmp9 <= new_address_4_tmp8;
        new_address_5_tmp9 <= new_address_5_tmp8;
        new_address_6_tmp9 <= new_address_6_tmp8;
        new_address_7_tmp9 <= new_address_7_tmp8;
        sel_m_tmp9 <= sel_m_tmp8;
      end
    end

    always@(posedge clk or posedge rst)
    begin
      if(rst)
      begin
        new_address_0_tmp10 <= 0;
        new_address_1_tmp10 <= 0;
        new_address_2_tmp10 <= 0;
        new_address_3_tmp10 <= 0;
        new_address_4_tmp10 <= 0;
        new_address_5_tmp10 <= 0;
        new_address_6_tmp10 <= 0;
        new_address_7_tmp10 <= 0;
        sel_m_tmp10 <= 1;
      end
      else
      begin
        new_address_0_tmp10 <= new_address_0_tmp9;
        new_address_1_tmp10 <= new_address_1_tmp9;
        new_address_2_tmp10 <= new_address_2_tmp9;
        new_address_3_tmp10 <= new_address_3_tmp9;
        new_address_4_tmp10 <= new_address_4_tmp9;
        new_address_5_tmp10 <= new_address_5_tmp9;
        new_address_6_tmp10 <= new_address_6_tmp9;
        new_address_7_tmp10 <= new_address_7_tmp9;
        sel_m_tmp10 <= sel_m_tmp9;
      end
    end

    always@(posedge clk or posedge rst)
    begin
      if(rst)
      begin
        new_address_0_tmp11 <= 0;
        new_address_1_tmp11 <= 0;
        new_address_2_tmp11 <= 0;
        new_address_3_tmp11 <= 0;
        new_address_4_tmp11 <= 0;
        new_address_5_tmp11 <= 0;
        new_address_6_tmp11 <= 0;
        new_address_7_tmp11 <= 0;
        sel_m_tmp11 <= 1;
      end
      else
      begin
        new_address_0_tmp11 <= new_address_0_tmp10;
        new_address_1_tmp11 <= new_address_1_tmp10;
        new_address_2_tmp11 <= new_address_2_tmp10;
        new_address_3_tmp11 <= new_address_3_tmp10;
        new_address_4_tmp11 <= new_address_4_tmp10;
        new_address_5_tmp11 <= new_address_5_tmp10;
        new_address_6_tmp11 <= new_address_6_tmp10;
        new_address_7_tmp11 <= new_address_7_tmp10;
        sel_m_tmp11 <= sel_m_tmp10;
      end
    end

    always@(posedge clk or posedge rst)
    begin
      if(rst)
      begin
        new_address_0_tmp12 <= 0;
        new_address_1_tmp12 <= 0;
        new_address_2_tmp12 <= 0;
        new_address_3_tmp12 <= 0;
        new_address_4_tmp12 <= 0;
        new_address_5_tmp12 <= 0;
        new_address_6_tmp12 <= 0;
        new_address_7_tmp12 <= 0;
        sel_m_tmp12 <= 1;
      end
      else
      begin
        new_address_0_tmp12 <= new_address_0_tmp11;
        new_address_1_tmp12 <= new_address_1_tmp11;
        new_address_2_tmp12 <= new_address_2_tmp11;
        new_address_3_tmp12 <= new_address_3_tmp11;
        new_address_4_tmp12 <= new_address_4_tmp11;
        new_address_5_tmp12 <= new_address_5_tmp11;
        new_address_6_tmp12 <= new_address_6_tmp11;
        new_address_7_tmp12 <= new_address_7_tmp11;
        sel_m_tmp12 <= sel_m_tmp11;
      end
    end

    always@(posedge clk or posedge rst)
    begin
      if(rst)
      begin
        new_address_0_tmp13 <= 0;
        new_address_1_tmp13 <= 0;
        new_address_2_tmp13 <= 0;
        new_address_3_tmp13 <= 0;
        new_address_4_tmp13 <= 0;
        new_address_5_tmp13 <= 0;
        new_address_6_tmp13 <= 0;
        new_address_7_tmp13 <= 0;
        sel_m_tmp13 <= 1;
      end
      else
      begin
        new_address_0_tmp13 <= new_address_0_tmp12;
        new_address_1_tmp13 <= new_address_1_tmp12;
        new_address_2_tmp13 <= new_address_2_tmp12;
        new_address_3_tmp13 <= new_address_3_tmp12;
        new_address_4_tmp13 <= new_address_4_tmp12;
        new_address_5_tmp13 <= new_address_5_tmp12;
        new_address_6_tmp13 <= new_address_6_tmp12;
        new_address_7_tmp13 <= new_address_7_tmp12;
        sel_m_tmp13 <= sel_m_tmp12;
      end
    end

    
  assign bank_0_A1 = new_address_0_tmp13;
  assign bank_1_A1 = new_address_1_tmp13;   
  assign bank_2_A1 = new_address_2_tmp13;
  assign bank_3_A1 = new_address_3_tmp13;
  assign bank_4_A1 = new_address_4_tmp13;
  assign bank_5_A1 = new_address_5_tmp13;
  assign bank_6_A1 = new_address_6_tmp13;
  assign bank_7_A1 = new_address_7_tmp13;
  
  (*DONT_TOUCH = "true"*)
  fsm m1 (.clk(clk),
      .rst(rst),
      .start(start),
      .J(J),
      .sel(sel),
      .sel_m(sel_m),
      .s(s),
      .k(k),
      .i(i),
      .wen(wen),
      .ren(ren),
      .wen_b(wen_b),
      .en(en),
      .done(done));  
  
  (*DONT_TOUCH = "true"*)
  address_generator m2(
          .s(s),
          .k(k),
          .i(i),
          .J(J),
          .old_address_0(old_address_0),.old_address_1(old_address_1),
          .old_address_2(old_address_2),.old_address_3(old_address_3),
          .old_address_4(old_address_4),.old_address_5(old_address_5),
          .old_address_6(old_address_6),.old_address_7(old_address_7)
          );  
   
   (*DONT_TOUCH = "true"*)
   conflict_free_memory_map map(
              .old_address_0(old_address_0),
              .old_address_1(old_address_1),
              .old_address_2(old_address_2),
              .old_address_3(old_address_3),
              .old_address_4(old_address_4),
              .old_address_5(old_address_5),
              .old_address_6(old_address_6),
              .old_address_7(old_address_7),
              .new_address_0(b0),
              .new_address_1(b1),
              .new_address_2(b2),
              .new_address_3(b3),
              .new_address_4(b4),
              .new_address_5(b5),
              .new_address_6(b6),
              .new_address_7(b7),
              .bank_number_0(a0),
              .bank_number_1(a1),
              .bank_number_2(a2),
              .bank_number_3(a3),
              .bank_number_4(a4),
              .bank_number_5(a5),
              .bank_number_6(a6),
              .bank_number_7(a7)
              );
          
  (*DONT_TOUCH = "true"*)                                     
  control_bank_in_unit m3(
                          .a0(a0),.a1(a1),.a2(a2),.a3(a3),
                          .a4(a4),.a5(a5),.a6(a6),.a7(a7),
                          .sel_a_0(sel_a_0),.sel_a_1(sel_a_1),
                          .sel_a_2(sel_a_2),.sel_a_3(sel_a_3),
                          .sel_a_4(sel_a_4),.sel_a_5(sel_a_5),
                          .sel_a_6(sel_a_6),.sel_a_7(sel_a_7)
                          ); 
  (*DONT_TOUCH = "true"*)                        
  mux8_2_bank_in mux(
                 .b0(b0),.b1(b1),.b2(b2),.b3(b3),.b4(b4),.b5(b5),.b6(b6),.b7(b7),
                 .sel_a_0(sel_a_0),.sel_a_1(sel_a_1),.sel_a_2(sel_a_2),
                 .sel_a_3(sel_a_3),.sel_a_4(sel_a_4),.sel_a_5(sel_a_5),
                 .sel_a_6(sel_a_6),.sel_a_7(sel_a_7),
                 .new_address_0(new_address_0),.new_address_1(new_address_1),
                 .new_address_2(new_address_2),.new_address_3(new_address_3),
                 .new_address_4(new_address_4),.new_address_5(new_address_5),
                 .new_address_6(new_address_6),.new_address_7(new_address_7)
                 );    
  (*DONT_TOUCH = "true"*)                                   
  data_bank bank_0(
                   .clk(clk),
                   .A1(bank_0_A1),
                   .A2(new_address_0),
                   .D(d0),
                   .WEN(wen),
                   .REN(ren),
                   .EN(en),
                   .Q(q0)
                   );
  (*DONT_TOUCH = "true"*)                 
  data_bank bank_1(
                   .clk(clk),
                   .A1(bank_1_A1),
                   .A2(new_address_1),
                   .D(d1),
                   .WEN(wen),
                   .REN(ren),
                   .EN(en),
                   .Q(q1)
                   );
  (*DONT_TOUCH = "true"*)                   
  data_bank bank_2(
                   .clk(clk),
                   .A1(bank_2_A1),
                   .A2(new_address_2),
                   .D(d2),
                   .WEN(wen),
                   .REN(ren),
                   .EN(en),
                   .Q(q2)
                   );  
  (*DONT_TOUCH = "true"*)                 
  data_bank bank_3(
                   .clk(clk),
                   .A1(bank_3_A1),
                   .A2(new_address_3),
                   .D(d3),
                   .WEN(wen),
                   .REN(ren),
                   .EN(en),
                   .Q(q3)
                   ); 
  (*DONT_TOUCH = "true"*)                   
  data_bank bank_4(
                   .clk(clk),
                   .A1(bank_4_A1),
                   .A2(new_address_4),
                   .D(d4),
                   .WEN(wen),
                   .REN(ren),
                   .EN(en),
                   .Q(q4)
                   ); 
  (*DONT_TOUCH = "true"*)                 
  data_bank bank_5(
                   .clk(clk),
                   .A1(bank_5_A1),
                   .A2(new_address_5),
                   .D(d5),
                   .WEN(wen),
                   .REN(ren),
                   .EN(en),
                   .Q(q5)
                   );
   (*DONT_TOUCH = "true"*)                
   data_bank bank_6(
                    .clk(clk),
                    .A1(bank_6_A1),
                    .A2(new_address_6),
                    .D(d6),
                    .WEN(wen),
                    .REN(ren),
                    .EN(en),
                    .Q(q6)
                    );   
   (*DONT_TOUCH = "true"*)                 
   data_bank bank_7(
                    .clk(clk),
                    .A1(bank_7_A1),
                    .A2(new_address_7),
                    .D(d7),
                    .WEN(wen),
                    .REN(ren),
                    .EN(en),
                    .Q(q7)
                    );
   (*DONT_TOUCH = "true"*)
   data_bank bank_0_b(
                      .clk(clk),
                      .A1(bank_0_A1),
                      .A2(new_address_0),
                      .D(d0_b),
                      .WEN(wen),
                      .REN(ren),
                      .EN(en),
                      .Q(q0_b)
                      );
   (*DONT_TOUCH = "true"*)                   
   data_bank bank_1_b(
                      .clk(clk),
                      .A1(bank_1_A1),
                      .A2(new_address_1),
                      .D(d1_b),
                      .WEN(wen_b),
                      .REN(ren),
                      .EN(en),
                      .Q(q1_b)
                      );  
   (*DONT_TOUCH = "true"*)                   
   data_bank bank_2_b(
                    .clk(clk),
                    .A1(bank_2_A1),
                    .A2(new_address_2),
                    .D(d2_b),
                    .WEN(wen_b),
                    .REN(ren),
                    .EN(en),
                    .Q(q2_b)
                    );  
   (*DONT_TOUCH = "true"*)                 
   data_bank bank_3_b(
                      .clk(clk),
                      .A1(bank_3_A1),
                      .A2(new_address_3),
                      .D(d3_b),
                      .WEN(wen_b),
                      .REN(ren),
                      .EN(en),
                      .Q(q3_b)
                      );   
   (*DONT_TOUCH = "true"*)                   
   data_bank bank_4_b(
                      .clk(clk),
                      .A1(bank_4_A1),
                      .A2(new_address_4),
                      .D(d4_b),
                      .WEN(wen_b),
                      .REN(ren),
                      .EN(en),
                      .Q(q4_b)
                      ); 
   (*DONT_TOUCH = "true"*)                   
   data_bank bank_5_b(
                      .clk(clk),
                      .A1(bank_5_A1),
                      .A2(new_address_5),
                      .D(d5_b),
                      .WEN(wen_b),
                      .REN(ren),
                      .EN(en),
                      .Q(q5_b)
                      );
    (*DONT_TOUCH = "true"*)                  
    data_bank bank_6_b(
                       .clk(clk),
                       .A1(bank_6_A1),
                       .A2(new_address_6),
                       .D(d6_b),
                       .WEN(wen_b),
                       .REN(ren),
                       .EN(en),
                       .Q(q6_b)
                       );   
    (*DONT_TOUCH = "true"*)                   
    data_bank bank_7_b(
                       .clk(clk),
                       .A1(bank_7_A1),
                       .A2(new_address_7),
                       .D(d7_b),
                       .WEN(wen_b),
                       .REN(ren),
                       .EN(en),
                       .Q(q7_b)
                       );
   (*DONT_TOUCH = "true"*)                 
   control_bf_in_unit m4(
                      .clk(clk),.rst(rst),
                      .sel_a_0(sel_a_0),.sel_a_1(sel_a_1),.sel_a_2(sel_a_2),
                      .sel_a_3(sel_a_3),.sel_a_4(sel_a_4),.sel_a_5(sel_a_5),
                      .sel_a_6(sel_a_6),.sel_a_7(sel_a_7),
                      .q0(q0),.q1(q1),.q2(q2),.q3(q3),.q4(q4),.q5(q5),.q6(q6),.q7(q7),
                      .u0(u0),.v0(v0),.u1(u1),.v1(v1),.u2(u2),.v2(v2),.u3(u3),.v3(v3)
                        ); 
   (*DONT_TOUCH = "true"*)                     
   control_bf_in_unit m4_b(
                         .clk(clk),.rst(rst),
                         .sel_a_0(sel_a_0),.sel_a_1(sel_a_1),.sel_a_2(sel_a_2),
                         .sel_a_3(sel_a_3),.sel_a_4(sel_a_4),.sel_a_5(sel_a_5),
                         .sel_a_6(sel_a_6),.sel_a_7(sel_a_7),
                         .q0(q0_b),.q1(q1_b),.q2(q2_b),.q3(q3_b),.q4(q4_b),.q5(q5_b),.q6(q6_b),.q7(q7_b),
                         .u0(u0_b),.v0(v0_b),.u1(u1_b),.v1(v1_b),.u2(u2_b),.v2(v2_b),.u3(u3_b),.v3(v3_b)
                         );   
   (*DONT_TOUCH = "true"*)                                                                            
   compact_bf bf_0(
              .clk(clk),.rst(rst),
              .a(u0),
              .b(u0_b),
              .c(c0),
              .u(u0),.v(v0),
              .w(win0),
              .sel(sel),.sel_m(sel_m_in),
              .bf_upper(bf_0_upper),.bf_lower(bf_0_lower)
              ); 
   (*DONT_TOUCH = "true"*)           
   compact_bf bf_1(
                   .clk(clk),.rst(rst),
                   .a(v0),
                   .b(v0_b),
                   .c(c1),
                   .u(u1),.v(v1),
                   .w(win1),
                   .sel(sel),.sel_m(sel_m_in),
                   .bf_upper(bf_1_upper),.bf_lower(bf_1_lower)
                   ); 
   (*DONT_TOUCH = "true"*)                
   compact_bf bf_2(
                   .clk(clk),.rst(rst),
                   .a(u1),
                   .b(u1_b),
                   .c(c2),
                   .u(u2),.v(v2),
                   .w(win2),
                   .sel(sel),.sel_m(sel_m_in),
                   .bf_upper(bf_2_upper),.bf_lower(bf_2_lower)
                   );   
   (*DONT_TOUCH = "true"*)                
   compact_bf bf_3(
                   .clk(clk),.rst(rst),
                   .a(v1),
                   .b(v1_b),
                   .c(c3),
                   .u(u3),.v(v3),
                   .w(win3),
                   .sel(sel),.sel_m(sel_m_in),
                   .bf_upper(bf_3_upper),.bf_lower(bf_3_lower)
                   );
                   (*DONT_TOUCH = "true"*)
                  compact_bf bf_0_b(
                              .clk(clk),.rst(rst),
                              .a(u2),
                              .b(u2_b),
                              .c(c4),
                              .u(u0_b),.v(v0_b),
                              .w(win0),
                              .sel(sel),.sel_m(sel_m_in),
                              .bf_upper(bf_0_upper_b),.bf_lower(bf_0_lower_b)
                              ); 
                   (*DONT_TOUCH = "true"*)           
                   compact_bf bf_1_b(
                                   .clk(clk),.rst(rst),
                                   .a(v2),
                                   .b(v2_b),
                                   .c(c5),
                                   .u(u1_b),.v(v1_b),
                                   .w(win1),
                                   .sel(sel),.sel_m(sel_m_in),
                                   .bf_upper(bf_1_upper_b),.bf_lower(bf_1_lower_b)
                                   ); 
                   (*DONT_TOUCH = "true"*)                
                   compact_bf bf_2_b(
                                   .clk(clk),.rst(rst),
                                   .a(u3),
                                   .b(u3_b),
                                   .c(c6),
                                   .u(u2_b),.v(v2_b),
                                   .w(win2),
                                   .sel(sel),.sel_m(sel_m_in),
                                   .bf_upper(bf_2_upper_b),.bf_lower(bf_2_lower_b)
                                   );  
                   (*DONT_TOUCH = "true"*)                
                   compact_bf bf_3_b(
                                   .clk(clk),.rst(rst),
                                   .a(v3),
                                   .b(v3_b),
                                   .c(c7),
                                   .u(u3_b),.v(v3_b),
                                   .w(win3),
                                   .sel(sel),.sel_m(sel_m_in),
                                   .bf_upper(bf_3_upper_b),.bf_lower(bf_3_lower_b)
                                   );                   
  (*DONT_TOUCH = "true"*)                 
  control_bf_out_unit m5(
                       .clk(clk),.rst(rst),
                       .bf_0_upper(bf_0_upper_in),.bf_0_lower(bf_0_lower_in),
                       .bf_1_upper(bf_1_upper_in),.bf_1_lower(bf_1_lower_in),
                       .bf_2_upper(bf_2_upper_in),.bf_2_lower(bf_2_lower_in),
                       .bf_3_upper(bf_3_upper_in),.bf_3_lower(bf_3_lower_in),
                       .sel_a_0(sel_a_0),.sel_a_1(sel_a_1),.sel_a_2(sel_a_2),
                       .sel_a_3(sel_a_3),.sel_a_4(sel_a_4),.sel_a_5(sel_a_5),
                       .sel_a_6(sel_a_6),.sel_a_7(sel_a_7),
                       .d0(d0),.d1(d1),.d2(d2),.d3(d3),.d4(d4),.d5(d5),.d6(d6),.d7(d7)
                       );  
  (*DONT_TOUCH = "true"*)                     
  control_bf_out_unit m5_b(
                           .clk(clk),.rst(rst),
                           .bf_0_upper(bf_0_upper_b),.bf_0_lower(bf_0_lower_b),
                           .bf_1_upper(bf_1_upper_b),.bf_1_lower(bf_1_lower_b),
                           .bf_2_upper(bf_2_upper_b),.bf_2_lower(bf_2_lower_b),
                           .bf_3_upper(bf_3_upper_b),.bf_3_lower(bf_3_lower_b),
                           .sel_a_0(sel_a_0),.sel_a_1(sel_a_1),.sel_a_2(sel_a_2),
                           .sel_a_3(sel_a_3),.sel_a_4(sel_a_4),.sel_a_5(sel_a_5),
                           .sel_a_6(sel_a_6),.sel_a_7(sel_a_7),
                           .d0(d0_b),.d1(d1_b),.d2(d2_b),.d3(d3_b),.d4(d4_b),.d5(d5_b),.d6(d6_b),.d7(d7_b)
                           );                       
  (*DONT_TOUCH = "true"*)                     
  tf_address_generator m6(
                          .J(J),
                          .i(i),
                          .tf_address(tf_address)               
                           );  
  assign tf_address_w = sel == 1? tf_address : 9'bz;
  assign tf_address_invw = sel == 0? tf_address : 9'bz; 
  assign win0 = sel == 1? w0 : invw0;
  assign win1 = sel == 1? w1 : invw1;
  assign win2 = sel == 1? w2 : invw2;
  assign win3 = sel == 1? w3 : invw3;
  
  (*DONT_TOUCH = "true"*)                   
  tf_ROM rom0(
              .clk(clk),
              .A(tf_address_w),
              .D(0),
              .REN(ren),
              .EN(en),
              .Q(w0)
              );
  (*DONT_TOUCH = "true"*)            
  tf_ROM rom1(
              .clk(clk),
              .A(tf_address_w),
              .D(0),
              .REN(ren),
              .EN(en),
              .Q(w1)
              );  
  (*DONT_TOUCH = "true"*)            
  tf_ROM rom2(
              .clk(clk),
              .A(tf_address_w),
              .D(0),
              .REN(ren),
              .EN(en),
              .Q(w2)
              );  
  (*DONT_TOUCH = "true"*)            
  tf_ROM rom3(
              .clk(clk),
              .A(tf_address_w),
              .D(0),
              .REN(ren),
              .EN(en),
              .Q(w3)
              );
   (*DONT_TOUCH = "true"*)           
   tf_ROM rom4(
               .clk(clk),
               .A(tf_address_invw),
               .D(0),
               .REN(ren),
               .EN(en),
               .Q(invw0)
               );
   (*DONT_TOUCH = "true"*)            
   tf_ROM rom5(
               .clk(clk),
               .A(tf_address_invw),
               .D(0),
               .REN(ren),
               .EN(en),
               .Q(invw1)
               ); 
   (*DONT_TOUCH = "true"*)            
   tf_ROM rom6(
                  .clk(clk),
                  .A(tf_address_invw),
                  .D(0),
                  .REN(ren),
                  .EN(en),
                  .Q(invw2)
                  ); 
   (*DONT_TOUCH = "true"*)               
   tf_ROM rom7(
               .clk(clk),
               .A(tf_address_invw),
               .D(0),
               .REN(ren),
               .EN(en),
               .Q(invw3)
               );                              
  /*initial
  begin 
      $readmemh("D:/Xilinx_project/polynomial_mul_1024/bank0.txt",top_poly_mul.bank_0.bank);
  end
               
  initial
  begin 
      $readmemh("D:/Xilinx_project/polynomial_mul_1024/bank1.txt",top_poly_mul.bank_1.bank);
  end
               
               initial
               begin 
                 $readmemh("D:/Xilinx_project/polynomial_mul_1024/bank2.txt",top_poly_mul.bank_2.bank);
               end
               
               initial
               begin 
                 $readmemh("D:/Xilinx_project/polynomial_mul_1024/bank3.txt",top_poly_mul.bank_3.bank);
               end
               
               initial
               begin 
                 $readmemh("D:/Xilinx_project/polynomial_mul_1024/bank4.txt",top_poly_mul.bank_4.bank);
               end
               
               initial
               begin 
                 $readmemh("D:/Xilinx_project/polynomial_mul_1024/bank5.txt",top_poly_mul.bank_5.bank);
               end
               
               initial
               begin 
                 $readmemh("D:/Xilinx_project/polynomial_mul_1024/bank6.txt",top_poly_mul.bank_6.bank);
               end
               
               initial
               begin 
                 $readmemh("D:/Xilinx_project/polynomial_mul_1024/bank7.txt",top_poly_mul.bank_7.bank);
               end
               
               initial
               begin 
                 $readmemh("D:/Xilinx_project/polynomial_mul_1024/bank0b.txt",top_poly_mul.bank_0_b.bank);
               end
               
               initial
               begin 
                 $readmemh("D:/Xilinx_project/polynomial_mul_1024/bank1b.txt",top_poly_mul.bank_1_b.bank);
               end
               
               initial
               begin 
                 $readmemh("D:/Xilinx_project/polynomial_mul_1024/bank2b.txt",top_poly_mul.bank_2_b.bank);
               end
               
               initial
               begin 
                 $readmemh("D:/Xilinx_project/polynomial_mul_1024/bank3b.txt",top_poly_mul.bank_3_b.bank);
               end
               
               initial
               begin 
                 $readmemh("D:/Xilinx_project/polynomial_mul_1024/bank4b.txt",top_poly_mul.bank_4_b.bank);
               end
               
               initial
               begin 
                 $readmemh("D:/Xilinx_project/polynomial_mul_1024/bank5b.txt",top_poly_mul.bank_5_b.bank);
               end
               
               initial
               begin 
                 $readmemh("D:/Xilinx_project/polynomial_mul_1024/bank6b.txt",top_poly_mul.bank_6_b.bank);
               end
               
               initial
               begin 
                 $readmemh("D:/Xilinx_project/polynomial_mul_1024/bank7b.txt",top_poly_mul.bank_7_b.bank);
               end
               
               initial
               begin 
                 $readmemh("D:/Xilinx_project/polynomial_mul_1024/NTT_w_rom_1.txt",top_poly_mul.rom0.ROM);
               end
               
               initial
               begin 
                 $readmemh("D:/Xilinx_project/polynomial_mul_1024/NTT_w_rom_2.txt",top_poly_mul.rom1.ROM);
               end
               
               initial
               begin 
                 $readmemh("D:/Xilinx_project/polynomial_mul_1024/NTT_w_rom_3.txt",top_poly_mul.rom2.ROM);
               end
               
               initial
               begin 
                 $readmemh("D:/Xilinx_project/polynomial_mul_1024/NTT_w_rom_4.txt",top_poly_mul.rom3.ROM);            
               end
               
               initial
               begin 
                 $readmemh("D:/Xilinx_project/polynomial_mul_1024/NTT_inv_w_rom_1.txt",top_poly_mul.rom4.ROM);
               end
               
               initial
               begin 
                 $readmemh("D:/Xilinx_project/polynomial_mul_1024/NTT_inv_w_rom_2.txt",top_poly_mul.rom5.ROM);
               end
               
               initial
               begin 
                 $readmemh("D:/Xilinx_project/polynomial_mul_1024/NTT_inv_w_rom_3.txt",top_poly_mul.rom6.ROM);
               end
               
               initial
               begin 
                 $readmemh("D:/Xilinx_project/polynomial_mul_1024/NTT_inv_w_rom_4.txt",top_poly_mul.rom7.ROM);
               end */                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
endmodule
