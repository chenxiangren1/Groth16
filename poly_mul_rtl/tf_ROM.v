module tf_ROM 
    #(parameter addr_rom_width = 4'b1001,
                 data_width = 9'b100000000,
                 depth_rom = 8'b10000010)
    (
    input clk,
    input [addr_rom_width-1:0] A,
    input [data_width-1:0] D,
    input EN,
    input REN,
    output reg [data_width-1:0] Q
    );
    (*ram_style = "block"*)reg [data_width-1:0] ROM [depth_rom-1:0];
    
    always@(posedge clk)
    begin
        if(EN == 1'b1)
        begin
          if(REN == 1'b0)
            ROM[A] <= D; 
          else
            Q <= ROM[A];        
        end
     end
endmodule