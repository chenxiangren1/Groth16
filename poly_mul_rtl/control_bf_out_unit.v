module control_bf_out_unit #(parameter data_width = 256)(
    input clk,rst,
    input [data_width-1:0] bf_0_upper,bf_0_lower,bf_1_upper,bf_1_lower,bf_2_upper,bf_2_lower,bf_3_upper,bf_3_lower,
    input [2:0] sel_a_0,sel_a_1,sel_a_2,sel_a_3,sel_a_4,sel_a_5,sel_a_6,sel_a_7,
    output reg [data_width-1:0] d0,d1,d2,d3,d4,d5,d6,d7
    );
    
    reg [2:0] sel_a_0_tmp_0,sel_a_1_tmp_0,sel_a_2_tmp_0,sel_a_3_tmp_0,sel_a_4_tmp_0,sel_a_5_tmp_0,sel_a_6_tmp_0,sel_a_7_tmp_0;
    reg [2:0] sel_a_0_tmp_1,sel_a_1_tmp_1,sel_a_2_tmp_1,sel_a_3_tmp_1,sel_a_4_tmp_1,sel_a_5_tmp_1,sel_a_6_tmp_1,sel_a_7_tmp_1;
    reg [2:0] sel_a_0_tmp_2,sel_a_1_tmp_2,sel_a_2_tmp_2,sel_a_3_tmp_2,sel_a_4_tmp_2,sel_a_5_tmp_2,sel_a_6_tmp_2,sel_a_7_tmp_2;
    reg [2:0] sel_a_0_tmp_3,sel_a_1_tmp_3,sel_a_2_tmp_3,sel_a_3_tmp_3,sel_a_4_tmp_3,sel_a_5_tmp_3,sel_a_6_tmp_3,sel_a_7_tmp_3;
    reg [2:0] sel_a_0_tmp_4,sel_a_1_tmp_4,sel_a_2_tmp_4,sel_a_3_tmp_4,sel_a_4_tmp_4,sel_a_5_tmp_4,sel_a_6_tmp_4,sel_a_7_tmp_4;
    reg [2:0] sel_a_0_tmp_5,sel_a_1_tmp_5,sel_a_2_tmp_5,sel_a_3_tmp_5,sel_a_4_tmp_5,sel_a_5_tmp_5,sel_a_6_tmp_5,sel_a_7_tmp_5;
    reg [2:0] sel_a_0_tmp_6,sel_a_1_tmp_6,sel_a_2_tmp_6,sel_a_3_tmp_6,sel_a_4_tmp_6,sel_a_5_tmp_6,sel_a_6_tmp_6,sel_a_7_tmp_6;
    reg [2:0] sel_a_0_tmp_7,sel_a_1_tmp_7,sel_a_2_tmp_7,sel_a_3_tmp_7,sel_a_4_tmp_7,sel_a_5_tmp_7,sel_a_6_tmp_7,sel_a_7_tmp_7;
    reg [2:0] sel_a_0_tmp_8,sel_a_1_tmp_8,sel_a_2_tmp_8,sel_a_3_tmp_8,sel_a_4_tmp_8,sel_a_5_tmp_8,sel_a_6_tmp_8,sel_a_7_tmp_8;     
    reg [2:0] sel_a_0_tmp_9,sel_a_1_tmp_9,sel_a_2_tmp_9,sel_a_3_tmp_9,sel_a_4_tmp_9,sel_a_5_tmp_9,sel_a_6_tmp_9,sel_a_7_tmp_9;
    reg [2:0] sel_a_0_tmp_10,sel_a_1_tmp_10,sel_a_2_tmp_10,sel_a_3_tmp_10,sel_a_4_tmp_10,sel_a_5_tmp_10,sel_a_6_tmp_10,sel_a_7_tmp_10;
    reg [2:0] sel_a_0_tmp_11,sel_a_1_tmp_11,sel_a_2_tmp_11,sel_a_3_tmp_11,sel_a_4_tmp_11,sel_a_5_tmp_11,sel_a_6_tmp_11,sel_a_7_tmp_11;
    reg [2:0] sel_a_0_tmp_12,sel_a_1_tmp_12,sel_a_2_tmp_12,sel_a_3_tmp_12,sel_a_4_tmp_12,sel_a_5_tmp_12,sel_a_6_tmp_12,sel_a_7_tmp_12;       
    
    
    
    
    always@(posedge clk or posedge rst)
    begin
      if(rst)
      begin
        sel_a_0_tmp_0 <= 0;
        sel_a_1_tmp_0 <= 0;
        sel_a_2_tmp_0 <= 0;
        sel_a_3_tmp_0 <= 0;
        sel_a_4_tmp_0 <= 0;
        sel_a_5_tmp_0 <= 0;
        sel_a_6_tmp_0 <= 0;
        sel_a_7_tmp_0 <= 0;
      end
      else
      begin
        sel_a_0_tmp_0 <= sel_a_0; 
        sel_a_1_tmp_0 <= sel_a_1;
        sel_a_2_tmp_0 <= sel_a_2;
        sel_a_3_tmp_0 <= sel_a_3;
        sel_a_4_tmp_0 <= sel_a_4;
        sel_a_5_tmp_0 <= sel_a_5;
        sel_a_6_tmp_0 <= sel_a_6;
        sel_a_7_tmp_0 <= sel_a_7;
      end
    end
    
    always@(posedge clk or posedge rst)
    begin
      if(rst)
      begin
        sel_a_0_tmp_1 <= 0;
        sel_a_1_tmp_1 <= 0;
        sel_a_2_tmp_1 <= 0;
        sel_a_3_tmp_1 <= 0;
        sel_a_4_tmp_1 <= 0;
        sel_a_5_tmp_1 <= 0;
        sel_a_6_tmp_1 <= 0;
        sel_a_7_tmp_1 <= 0;
      end
      else
      begin
        sel_a_0_tmp_1 <= sel_a_0_tmp_0; 
        sel_a_1_tmp_1 <= sel_a_1_tmp_0;
        sel_a_2_tmp_1 <= sel_a_2_tmp_0;
        sel_a_3_tmp_1 <= sel_a_3_tmp_0;
        sel_a_4_tmp_1 <= sel_a_4_tmp_0;
        sel_a_5_tmp_1 <= sel_a_5_tmp_0;
        sel_a_6_tmp_1 <= sel_a_6_tmp_0;
        sel_a_7_tmp_1 <= sel_a_7_tmp_0;
      end
    end
    
    always@(posedge clk or posedge rst)
    begin
      if(rst)
      begin
        sel_a_0_tmp_2 <= 0;
        sel_a_1_tmp_2 <= 0;
        sel_a_2_tmp_2 <= 0;
        sel_a_3_tmp_2 <= 0;
        sel_a_4_tmp_2 <= 0;
        sel_a_5_tmp_2 <= 0;
        sel_a_6_tmp_2 <= 0;
        sel_a_7_tmp_2 <= 0;
      end
      else
      begin
        sel_a_0_tmp_2 <= sel_a_0_tmp_1; 
        sel_a_1_tmp_2 <= sel_a_1_tmp_1;
        sel_a_2_tmp_2 <= sel_a_2_tmp_1;
        sel_a_3_tmp_2 <= sel_a_3_tmp_1;
        sel_a_4_tmp_2 <= sel_a_4_tmp_1;
        sel_a_5_tmp_2 <= sel_a_5_tmp_1;
        sel_a_6_tmp_2 <= sel_a_6_tmp_1;
        sel_a_7_tmp_2 <= sel_a_7_tmp_1;
      end
    end  
    
    always@(posedge clk or posedge rst)
    begin
    if(rst)
    begin
      sel_a_0_tmp_3 <= 0;
      sel_a_1_tmp_3 <= 0;
      sel_a_2_tmp_3 <= 0;
      sel_a_3_tmp_3 <= 0;
      sel_a_4_tmp_3 <= 0;
      sel_a_5_tmp_3 <= 0;
      sel_a_6_tmp_3 <= 0;
      sel_a_7_tmp_3 <= 0;
    end
    else
    begin
      sel_a_0_tmp_3 <= sel_a_0_tmp_2; 
      sel_a_1_tmp_3 <= sel_a_1_tmp_2;
      sel_a_2_tmp_3 <= sel_a_2_tmp_2;
      sel_a_3_tmp_3 <= sel_a_3_tmp_2;
      sel_a_4_tmp_3 <= sel_a_4_tmp_2;
      sel_a_5_tmp_3 <= sel_a_5_tmp_2;
      sel_a_6_tmp_3 <= sel_a_6_tmp_2;
      sel_a_7_tmp_3 <= sel_a_7_tmp_2;
     end
    end
    
    always@(posedge clk or posedge rst)
    begin
      if(rst)
      begin
        sel_a_0_tmp_4 <= 0;
        sel_a_1_tmp_4 <= 0;
        sel_a_2_tmp_4 <= 0;
        sel_a_3_tmp_4 <= 0;
        sel_a_4_tmp_4 <= 0;
        sel_a_5_tmp_4 <= 0;
        sel_a_6_tmp_4 <= 0;
        sel_a_7_tmp_4 <= 0;
      end
      else
      begin
        sel_a_0_tmp_4 <= sel_a_0_tmp_3; 
        sel_a_1_tmp_4 <= sel_a_1_tmp_3;
        sel_a_2_tmp_4 <= sel_a_2_tmp_3;
        sel_a_3_tmp_4 <= sel_a_3_tmp_3;
        sel_a_4_tmp_4 <= sel_a_4_tmp_3;
        sel_a_5_tmp_4 <= sel_a_5_tmp_3;
        sel_a_6_tmp_4 <= sel_a_6_tmp_3;
        sel_a_7_tmp_4 <= sel_a_7_tmp_3;
      end
    end
always@(posedge clk or posedge rst)
        begin
          if(rst)
          begin
            sel_a_0_tmp_5 <= 0;
            sel_a_1_tmp_5 <= 0;
            sel_a_2_tmp_5 <= 0;
            sel_a_3_tmp_5 <= 0;
            sel_a_4_tmp_5 <= 0;
            sel_a_5_tmp_5 <= 0;
            sel_a_6_tmp_5 <= 0;
            sel_a_7_tmp_5 <= 0;
          end
          else
          begin
            sel_a_0_tmp_5 <= sel_a_0_tmp_4; 
            sel_a_1_tmp_5 <= sel_a_1_tmp_4;
            sel_a_2_tmp_5 <= sel_a_2_tmp_4;
            sel_a_3_tmp_5 <= sel_a_3_tmp_4;
            sel_a_4_tmp_5 <= sel_a_4_tmp_4;
            sel_a_5_tmp_5 <= sel_a_5_tmp_4;
            sel_a_6_tmp_5 <= sel_a_6_tmp_4;
            sel_a_7_tmp_5 <= sel_a_7_tmp_4;
          end
        end
    always@(posedge clk or posedge rst)
        begin
          if(rst)
          begin
            sel_a_0_tmp_6 <= 0;
            sel_a_1_tmp_6 <= 0;
            sel_a_2_tmp_6 <= 0;
            sel_a_3_tmp_6 <= 0;
            sel_a_4_tmp_6 <= 0;
            sel_a_5_tmp_6 <= 0;
            sel_a_6_tmp_6 <= 0;
            sel_a_7_tmp_6 <= 0;
          end
          else
          begin
            sel_a_0_tmp_6 <= sel_a_0_tmp_5; 
            sel_a_1_tmp_6 <= sel_a_1_tmp_5;
            sel_a_2_tmp_6 <= sel_a_2_tmp_5;
            sel_a_3_tmp_6 <= sel_a_3_tmp_5;
            sel_a_4_tmp_6 <= sel_a_4_tmp_5;
            sel_a_5_tmp_6 <= sel_a_5_tmp_5;
            sel_a_6_tmp_6 <= sel_a_6_tmp_5;
            sel_a_7_tmp_6 <= sel_a_7_tmp_5;
          end
        end
    always@(posedge clk or posedge rst)
        begin
          if(rst)
          begin
            sel_a_0_tmp_7 <= 0;
            sel_a_1_tmp_7 <= 0;
            sel_a_2_tmp_7 <= 0;
            sel_a_3_tmp_7 <= 0;
            sel_a_4_tmp_7 <= 0;
            sel_a_5_tmp_7 <= 0;
            sel_a_6_tmp_7 <= 0;
            sel_a_7_tmp_7 <= 0;
          end
          else
          begin
            sel_a_0_tmp_7 <= sel_a_0_tmp_6; 
            sel_a_1_tmp_7 <= sel_a_1_tmp_6;
            sel_a_2_tmp_7 <= sel_a_2_tmp_6;
            sel_a_3_tmp_7 <= sel_a_3_tmp_6;
            sel_a_4_tmp_7 <= sel_a_4_tmp_6;
            sel_a_5_tmp_7 <= sel_a_5_tmp_6;
            sel_a_6_tmp_7 <= sel_a_6_tmp_6;
            sel_a_7_tmp_7 <= sel_a_7_tmp_6;
          end
        end
    always@(posedge clk or posedge rst)
        begin
          if(rst)
          begin
            sel_a_0_tmp_8 <= 0;
            sel_a_1_tmp_8 <= 0;
            sel_a_2_tmp_8 <= 0;
            sel_a_3_tmp_8 <= 0;
            sel_a_4_tmp_8 <= 0;
            sel_a_5_tmp_8 <= 0;
            sel_a_6_tmp_8 <= 0;
            sel_a_7_tmp_8 <= 0;
          end
          else
          begin
            sel_a_0_tmp_8 <= sel_a_0_tmp_7; 
            sel_a_1_tmp_8 <= sel_a_1_tmp_7;
            sel_a_2_tmp_8 <= sel_a_2_tmp_7;
            sel_a_3_tmp_8 <= sel_a_3_tmp_7;
            sel_a_4_tmp_8 <= sel_a_4_tmp_7;
            sel_a_5_tmp_8 <= sel_a_5_tmp_7;
            sel_a_6_tmp_8 <= sel_a_6_tmp_7;
            sel_a_7_tmp_8 <= sel_a_7_tmp_7;
          end
        end
    always@(posedge clk or posedge rst)
        begin
          if(rst)
          begin
            sel_a_0_tmp_9 <= 0;
            sel_a_1_tmp_9 <= 0;
            sel_a_2_tmp_9 <= 0;
            sel_a_3_tmp_9 <= 0;
            sel_a_4_tmp_9 <= 0;
            sel_a_5_tmp_9 <= 0;
            sel_a_6_tmp_9 <= 0;
            sel_a_7_tmp_9 <= 0;
          end
          else
          begin
            sel_a_0_tmp_9 <= sel_a_0_tmp_8; 
            sel_a_1_tmp_9 <= sel_a_1_tmp_8;
            sel_a_2_tmp_9 <= sel_a_2_tmp_8;
            sel_a_3_tmp_9 <= sel_a_3_tmp_8;
            sel_a_4_tmp_9 <= sel_a_4_tmp_8;
            sel_a_5_tmp_9 <= sel_a_5_tmp_8;
            sel_a_6_tmp_9 <= sel_a_6_tmp_8;
            sel_a_7_tmp_9 <= sel_a_7_tmp_8;
          end
        end
    always@(posedge clk or posedge rst)
        begin
          if(rst)
          begin
            sel_a_0_tmp_10 <= 0;
            sel_a_1_tmp_10 <= 0;
            sel_a_2_tmp_10 <= 0;
            sel_a_3_tmp_10 <= 0;
            sel_a_4_tmp_10 <= 0;
            sel_a_5_tmp_10 <= 0;
            sel_a_6_tmp_10 <= 0;
            sel_a_7_tmp_10 <= 0;
          end
          else
          begin
            sel_a_0_tmp_10 <= sel_a_0_tmp_9; 
            sel_a_1_tmp_10 <= sel_a_1_tmp_9;
            sel_a_2_tmp_10 <= sel_a_2_tmp_9;
            sel_a_3_tmp_10 <= sel_a_3_tmp_9;
            sel_a_4_tmp_10 <= sel_a_4_tmp_9;
            sel_a_5_tmp_10 <= sel_a_5_tmp_9;
            sel_a_6_tmp_10 <= sel_a_6_tmp_9;
            sel_a_7_tmp_10 <= sel_a_7_tmp_9;
          end
        end
    always@(posedge clk or posedge rst)
        begin
          if(rst)
          begin
            sel_a_0_tmp_11 <= 0;
            sel_a_1_tmp_11 <= 0;
            sel_a_2_tmp_11 <= 0;
            sel_a_3_tmp_11 <= 0;
            sel_a_4_tmp_11 <= 0;
            sel_a_5_tmp_11 <= 0;
            sel_a_6_tmp_11 <= 0;
            sel_a_7_tmp_11 <= 0;
          end
          else
          begin
            sel_a_0_tmp_11 <= sel_a_0_tmp_10; 
            sel_a_1_tmp_11 <= sel_a_1_tmp_10;
            sel_a_2_tmp_11 <= sel_a_2_tmp_10;
            sel_a_3_tmp_11 <= sel_a_3_tmp_10;
            sel_a_4_tmp_11 <= sel_a_4_tmp_10;
            sel_a_5_tmp_11 <= sel_a_5_tmp_10;
            sel_a_6_tmp_11 <= sel_a_6_tmp_10;
            sel_a_7_tmp_11 <= sel_a_7_tmp_10;
          end
        end
    always@(posedge clk or posedge rst)
        begin
          if(rst)
          begin
            sel_a_0_tmp_12 <= 0;
            sel_a_1_tmp_12 <= 0;
            sel_a_2_tmp_12 <= 0;
            sel_a_3_tmp_12 <= 0;
            sel_a_4_tmp_12 <= 0;
            sel_a_5_tmp_12 <= 0;
            sel_a_6_tmp_12 <= 0;
            sel_a_7_tmp_12 <= 0;
          end
          else
          begin
            sel_a_0_tmp_12 <= sel_a_0_tmp_11; 
            sel_a_1_tmp_12 <= sel_a_1_tmp_11;
            sel_a_2_tmp_12 <= sel_a_2_tmp_11;
            sel_a_3_tmp_12 <= sel_a_3_tmp_11;
            sel_a_4_tmp_12 <= sel_a_4_tmp_11;
            sel_a_5_tmp_12 <= sel_a_5_tmp_11;
            sel_a_6_tmp_12 <= sel_a_6_tmp_11;
            sel_a_7_tmp_12 <= sel_a_7_tmp_11;
          end
        end    
 
    always@(*)
    begin
      case(sel_a_0_tmp_12)
      3'b000:d0 = bf_0_lower;
      3'b001:d0 = bf_0_upper;
      3'b010:d0 = bf_1_lower;
      3'b011:d0 = bf_1_upper;
      3'b100:d0 = bf_2_lower;
      3'b101:d0 = bf_2_upper;
      3'b110:d0 = bf_3_lower;
      3'b111:d0 = bf_3_upper;
      default:;
      endcase
    end
    
    always@(*)
    begin
      case(sel_a_1_tmp_12)
      3'b000:d1 = bf_0_lower;
      3'b001:d1 = bf_0_upper;
      3'b010:d1 = bf_1_lower;
      3'b011:d1 = bf_1_upper;
      3'b100:d1 = bf_2_lower;
      3'b101:d1 = bf_2_upper;
      3'b110:d1 = bf_3_lower;
      3'b111:d1 = bf_3_upper;
      default:;
      endcase
    end    
    
    always@(*)
    begin
      case(sel_a_2_tmp_12)
      3'b000:d2 = bf_0_lower;
      3'b001:d2 = bf_0_upper;
      3'b010:d2 = bf_1_lower;
      3'b011:d2 = bf_1_upper;
      3'b100:d2 = bf_2_lower;
      3'b101:d2 = bf_2_upper;
      3'b110:d2 = bf_3_lower;
      3'b111:d2 = bf_3_upper;
      default:;
      endcase
    end                       

    always@(*)
    begin
      case(sel_a_3_tmp_12)
      3'b000:d3 = bf_0_lower;
      3'b001:d3 = bf_0_upper;
      3'b010:d3 = bf_1_lower;
      3'b011:d3 = bf_1_upper;
      3'b100:d3 = bf_2_lower;
      3'b101:d3 = bf_2_upper;
      3'b110:d3 = bf_3_lower;
      3'b111:d3 = bf_3_upper;
      default:;
      endcase
    end
    
    always@(*)
    begin
      case(sel_a_4_tmp_12)
      3'b000:d4 = bf_0_lower;
      3'b001:d4 = bf_0_upper;
      3'b010:d4 = bf_1_lower;
      3'b011:d4 = bf_1_upper;
      3'b100:d4 = bf_2_lower;
      3'b101:d4 = bf_2_upper;
      3'b110:d4 = bf_3_lower;
      3'b111:d4 = bf_3_upper;
      default:;
      endcase
    end
    
    always@(*)
    begin
      case(sel_a_5_tmp_12)
      3'b000:d5 = bf_0_lower;
      3'b001:d5 = bf_0_upper;
      3'b010:d5 = bf_1_lower;
      3'b011:d5 = bf_1_upper;
      3'b100:d5 = bf_2_lower;
      3'b101:d5 = bf_2_upper;
      3'b110:d5 = bf_3_lower;
      3'b111:d5 = bf_3_upper;
      default:;
      endcase
    end
    
    always@(*)
    begin
      case(sel_a_6_tmp_12)
      3'b000:d6 = bf_0_lower;
      3'b001:d6 = bf_0_upper;
      3'b010:d6 = bf_1_lower;
      3'b011:d6 = bf_1_upper;
      3'b100:d6 = bf_2_lower;
      3'b101:d6 = bf_2_upper;
      3'b110:d6 = bf_3_lower;
      3'b111:d6 = bf_3_upper;
      default:;
      endcase
    end
    
    always@(*)
    begin
      case(sel_a_7_tmp_12)
      3'b000:d7 = bf_0_lower;
      3'b001:d7 = bf_0_upper;
      3'b010:d7 = bf_1_lower;
      3'b011:d7 = bf_1_upper;
      3'b100:d7 = bf_2_lower;
      3'b101:d7 = bf_2_upper;
      3'b110:d7 = bf_3_lower;
      3'b111:d7 = bf_3_upper;
      default:;
      endcase
    end
endmodule