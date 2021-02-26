module tf_address_generator(
    input [6:0] i,
    input [9:0] J,
    output reg [8:0] tf_address
    );
    
    parameter d = 4;
    parameter n = 1024;
    
    always@(J or i)
    begin
      case(J)
      512:tf_address = i;
      256:tf_address = i + 128;
      128:tf_address = i + 192;
      64:tf_address = i + 224;
      32:tf_address = i + 240;
      16:tf_address = i + 248;
       8:tf_address = i + 252;
       4:tf_address = i + 254;
       2:tf_address = 255;
       1:tf_address = 256;
        /*64:tf_address = i;
        32:tf_address = i + 16;
        16:tf_address = i + 24;
        8:tf_address = i + 28;
        4:tf_address = i + 30;
        2:tf_address = 31;
        1:tf_address = 32;*/
       default:tf_address = 0;
      endcase
    end
endmodule