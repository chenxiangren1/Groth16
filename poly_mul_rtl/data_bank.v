module data_bank 
    #(parameter addr_width = 3'b111,
                 data_width = 9'b100000000,
                 depth = 8'b10000000)
    (
    input clk,
    input [addr_width-1:0] A1,//д��ַ
    input [addr_width-1:0] A2,//����ַ
    input [data_width-1:0] D,
    input WEN,
    input REN,
    input EN,
    output reg [data_width-1:0] Q
    );
    (*ram_style = "block"*)reg [data_width-1:0] bank [depth-1:0];
    
    always@(posedge clk)
    begin
      if (EN == 1)
        begin
          if(WEN == 1'b1)
             bank[A1] <= D;
          else
             bank[A1] <= bank [A1];
          end
    end
    
    always@(posedge clk)
    begin
      if(EN == 1)
        begin
          if(REN == 1'b1)
            Q <= bank[A2];
          else
            Q <= Q;
        end
    end
endmodule