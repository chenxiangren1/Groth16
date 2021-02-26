module fsm (
  input clk,rst,
  input start,
  output reg [9:0] J,
  output reg sel,sel_m,
  output reg [6:0] s,
  output reg [6:0] k,
  output reg [6:0] i,
  output wire wen,
  output wire wen_b,
  output reg ren,
  output reg en,
  output reg done);
  
  parameter idle = 5'b00000;
  parameter NTT = 5'b00001;
  parameter inner_product = 5'b00010;
  //为了内积运算流水的最后阶段
  parameter tmp1 = 5'b00101;
  parameter tmp2 = 5'b00110;
  parameter tmp3 = 5'b00111;
  parameter tmp4 = 5'b01000;
  parameter tmp5 = 5'b01001;
  parameter tmp6 = 5'b01010;
  parameter tmp7 = 5'b01011;
  parameter tmp8 = 5'b01100;
  parameter tmp9 = 5'b01101;
  parameter tmp10 = 5'b01110;
  parameter tmp11 = 5'b01111;
  parameter tmp12 = 5'b10000;
  parameter tmp13 = 5'b10001;
  
  parameter INTT = 5'b00011;
  parameter DONE = 5'b00100;
  //为了INTT流水最后阶段
  parameter tmp_intt1 = 5'b10010;
  parameter tmp_intt2 = 5'b10011;
  parameter tmp_intt3 = 5'b10100;
  parameter tmp_intt4 = 5'b10101;
  parameter tmp_intt5 = 5'b10110;
  parameter tmp_intt6 = 5'b10111;
  parameter tmp_intt7 = 5'b11000;
  parameter tmp_intt8 = 5'b11001;
  parameter tmp_intt9 = 5'b11010;
  parameter tmp_intt10 = 5'b11011;
  parameter tmp_intt11 = 5'b11100;
  parameter tmp_intt12 = 5'b11101;
  parameter tmp_intt13 = 5'b11110;
  
  reg [4:0] cs;
  reg [4:0] ns;
  reg [3:0] loop_p;
  
  //5个时钟周期后写使能信号才有效（取点用了1个时钟，计算用了4个时钟）
  reg wen_tmp1;
  wire wen_tmp2;
  wire wen_tmp3;
  wire wen_tmp4;
  wire wen_tmp5;
  wire wen_tmp6;
  wire wen_tmp7;
  wire wen_tmp8;
  wire wen_tmp9;
  wire wen_tmp10;
  wire wen_tmp11;
  wire wen_tmp12;
  wire wen_tmp13;
  
  reg wen_b_tmp1;
  wire wen_b_tmp2;
  wire wen_b_tmp3;
  wire wen_b_tmp4;
  wire wen_b_tmp5;
  wire wen_b_tmp6;
  wire wen_b_tmp7;
  wire wen_b_tmp8;
  wire wen_b_tmp9;
  wire wen_b_tmp10;
  wire wen_b_tmp11;
  wire wen_b_tmp12;
  wire wen_b_tmp13;
  
  DFFbit wen_dff1(
         .clk(clk),.rst(rst),
         .d(wen_tmp1),
         .q(wen_tmp2)
         );
  DFFbit wen_dff2(
                 .clk(clk),.rst(rst),
                 .d(wen_tmp2),
                 .q(wen_tmp3)
                 );       

  DFFbit wen_dff3(
               .clk(clk),.rst(rst),
               .d(wen_tmp3),
               .q(wen_tmp4)
               );              
  DFFbit wen_dff4(
               .clk(clk),.rst(rst),
               .d(wen_tmp4),
               .q(wen_tmp5)
               );
  DFFbit wen_dff5(
               .clk(clk),.rst(rst),
               .d(wen_tmp5),
               .q(wen_tmp6)
               );  
  DFFbit wen_dff6(
               .clk(clk),.rst(rst),
               .d(wen_tmp6),
               .q(wen_tmp7)
               );
  DFFbit wen_dff7(
               .clk(clk),.rst(rst),
               .d(wen_tmp7),
               .q(wen_tmp8)
               );       
             
  DFFbit wen_dff8(
               .clk(clk),.rst(rst),
               .d(wen_tmp8),
               .q(wen_tmp9)
               );              
  DFFbit wen_dff9(
               .clk(clk),.rst(rst),
               .d(wen_tmp9),
               .q(wen_tmp10)
               );
  DFFbit wen_dff10(
               .clk(clk),.rst(rst),
               .d(wen_tmp10),
               .q(wen_tmp11)
               );                  
  DFFbit wen_dff11(
               .clk(clk),.rst(rst),
               .d(wen_tmp11),
               .q(wen_tmp12)
               );              
  DFFbit wen_dff12(
               .clk(clk),.rst(rst),
               .d(wen_tmp12),
               .q(wen_tmp13)
               );
  DFFbit wen_dff13(
               .clk(clk),.rst(rst),
               .d(wen_tmp13),
               .q(wen)
               );               
                       
                 DFFbit wen_b_dff1(
                        .clk(clk),.rst(rst),
                        .d(wen_b_tmp1),
                        .q(wen_b_tmp2)
                        );
                        
                 DFFbit wen_b_dff2(
                               .clk(clk),.rst(rst),
                               .d(wen_b_tmp2),
                               .q(wen_b_tmp3)
                               );
                 DFFbit wen_b_dff3(
                              .clk(clk),.rst(rst),
                              .d(wen_b_tmp3),
                              .q(wen_b_tmp4)
                              );              
                 DFFbit wen_b_dff4(
                              .clk(clk),.rst(rst),
                              .d(wen_b_tmp4),
                              .q(wen_b_tmp5)
                              );
                 DFFbit wen_b_dff5(
                              .clk(clk),.rst(rst),
                              .d(wen_b_tmp5),
                              .q(wen_b_tmp6)
                              ); 
                DFFbit wen_b_dff6(
                              .clk(clk),.rst(rst),
                              .d(wen_b_tmp6),
                              .q(wen_b_tmp7)
                              );
                DFFbit wen_b_dff7(
                              .clk(clk),.rst(rst),
                              .d(wen_b_tmp7),
                              .q(wen_b_tmp8)
                              );       
                                         
                DFFbit wen_b_dff8(
                               .clk(clk),.rst(rst),
                               .d(wen_b_tmp8),
                               .q(wen_b_tmp9)
                               );              
                DFFbit wen_b_dff9(
                               .clk(clk),.rst(rst),
                               .d(wen_b_tmp9),
                               .q(wen_b_tmp10)
                               );
                DFFbit wen_b_dff10(
                               .clk(clk),.rst(rst),
                               .d(wen_b_tmp10),
                               .q(wen_b_tmp11)
                               );                  
                DFFbit wen_b_dff11(
                               .clk(clk),.rst(rst),
                               .d(wen_b_tmp11),
                               .q(wen_b_tmp12)
                               );              
                DFFbit wen_b_dff12(
                               .clk(clk),.rst(rst),
                               .d(wen_b_tmp12),
                               .q(wen_b_tmp13)
                               );
                DFFbit wen_b_dff13(
                               .clk(clk),.rst(rst),
                               .d(wen_b_tmp13),
                               .q(wen_b)
                               );
                                                                                                                                                                                                                                         
  always@(posedge clk or posedge rst)
  begin
    if(rst)
      cs <= idle;
    else
      cs <= ns;
  end
  
  always@(start or loop_p or s or J or k or i or cs or ns)
  begin
    case(cs)
      idle:begin
             if(start == 1'b1)
               ns <= NTT;
             else
               ns <= idle;
            end
       NTT:begin
             if((loop_p == 0)&&(s == 127)&&(J == 1))
               ns <= inner_product;
             else
               ns <= NTT;
           end
       inner_product:begin
                       if(s == 127)
                         ns <= tmp1;
                       else
                         ns <= inner_product;
                     end
       tmp1:ns <= tmp2;
       tmp2:ns <= tmp3;
       tmp3:ns <= tmp4;
       tmp4:ns <= tmp5;
       tmp5:ns <= tmp6;
       tmp6:ns <= tmp7;
       tmp7:ns <= tmp8;
       tmp8:ns <= tmp9;
       tmp9:ns <= tmp10;
       tmp10:ns <= tmp11;
       tmp11:ns <= tmp12;
       tmp12:ns <= tmp13;
       tmp13:ns <= INTT;
       INTT:begin
              if((loop_p == 9)&&(J == 512)&&(k == 0)&&(i == 127))
                ns <= tmp_intt1;
               else
                ns <= INTT;
            end
        tmp_intt1:ns <= tmp_intt2;
        tmp_intt2:ns <= tmp_intt3;
        tmp_intt3:ns <= tmp_intt4;
        tmp_intt4:ns <= tmp_intt5;
        tmp_intt5:ns <= tmp_intt6; 
        tmp_intt6:ns <= tmp_intt7;
        tmp_intt7:ns <= tmp_intt8;
        tmp_intt8:ns <= tmp_intt9;
        tmp_intt9:ns <= tmp_intt10;
        tmp_intt10:ns <= tmp_intt11;
        tmp_intt11:ns <= tmp_intt12;
        tmp_intt12:ns <= tmp_intt13;
        tmp_intt13:ns <= DONE;
        DONE:ns <= idle;
        default:ns <= idle;
      endcase
  end
  
  always@(cs)
  begin
    case(cs)
      //sel_m为1表示做变换，为0表示做内积
      //sel为1表示做正变换，为0表示做逆变换
      idle:begin
            sel_m = 1;
            sel = 1;
            done = 0;
            en = 0;
            wen_tmp1 = 0;
            wen_b_tmp1 = 0;
            ren = 0;
           end
      NTT:begin
            sel = 1;
            sel_m = 1;
            done = 0;
            en = 1;
            wen_tmp1 = 1;
            wen_b_tmp1 = 1;
            ren = 1;
          end
      inner_product:begin
                      sel_m = 0;
                      sel = 1;
                      done = 0;
                      en = 1;
                      wen_tmp1 = 1;
                      wen_b_tmp1 = 1;
                      ren = 1;                    
                    end
      tmp1:begin
              sel_m = 1;
              sel = 1;
              done = 0;
              en = 1;
              wen_tmp1 = 0;
              wen_b_tmp1 = 0;
              ren = 0;                    
           end
      tmp2:begin
             sel_m = 1;
             sel = 1;
             done = 0;
             en = 1;
             wen_tmp1 = 0;
             wen_b_tmp1 = 0;
             ren = 0;                    
           end  
      tmp3:begin
               sel_m = 1;
               sel = 1;
               done = 0;
               en = 1;
               wen_tmp1 = 0;
               wen_b_tmp1 = 0;
               ren = 0;                          
           end      
      tmp4:begin
               sel_m = 1;
               sel = 1;
               done = 0;
               en = 1;
               wen_tmp1 = 0;
               wen_b_tmp1 = 0;
               ren = 0;                    
           end    
      tmp5:begin
                   sel_m = 1;
                   sel = 1;
                   done = 0;
                   en = 1;
                   wen_tmp1 = 0;
                   wen_b_tmp1 = 0;
                   ren = 0;                    
                end
           tmp6:begin
                  sel_m = 1;
                  sel = 1;
                  done = 0;
                  en = 1;
                  wen_tmp1 = 0;
                  wen_b_tmp1 = 0;
                  ren = 0;                    
                end  
           tmp7:begin
                    sel_m = 1;
                    sel = 1;
                    done = 0;
                    en = 1;
                    wen_tmp1 = 0;
                    wen_b_tmp1 = 0;
                    ren = 0;                          
                end      
           tmp8:begin
                    sel_m = 1;
                    sel = 1;
                    done = 0;
                    en = 1;
                    wen_tmp1 = 0;
                    wen_b_tmp1 = 0;
                    ren = 0;                    
                end    
           tmp9:begin
                         sel_m = 1;
                         sel = 1;
                         done = 0;
                         en = 1;
                         wen_tmp1 = 0;
                         wen_b_tmp1 = 0;
                         ren = 0;                    
                     end    
           tmp10:begin
                             sel_m = 1;
                             sel = 1;
                             done = 0;
                             en = 1;
                             wen_tmp1 = 0;
                             wen_b_tmp1 = 0;
                             ren = 0;                    
                          end
            tmp11:begin
                            sel_m = 1;
                            sel = 1;
                            done = 0;
                            en = 1;
                            wen_tmp1 = 0;
                            wen_b_tmp1 = 0;
                            ren = 0;                    
                          end  
            tmp12:begin
                              sel_m = 1;
                              sel = 1;
                              done = 0;
                              en = 1;
                              wen_tmp1 = 0;
                              wen_b_tmp1 = 0;
                              ren = 0;                          
                          end      
            tmp13:begin
                              sel_m = 1;
                              sel = 1;
                              done = 0;
                              en = 1;
                              wen_tmp1 = 0;
                              wen_b_tmp1 = 0;
                              ren = 0;                    
                          end                                                  
      INTT:begin
              sel_m = 1;
              sel = 0;
              done = 0;
              en = 1;
              wen_tmp1 = 1;
              //此状态下b的bank只需要读不需要写
              wen_b_tmp1 = 0;
              ren = 1;        
            end
      tmp_intt1:begin
                  sel_m = 1;
                  sel = 0;
                  done = 0;
                  en = 1;
                  wen_tmp1 = 0;
                  wen_b_tmp1 = 0;
                  ren = 0;                    
                end
      tmp_intt2:begin
                   sel_m = 1;
                   sel = 0;
                   done = 0;
                   en = 1;
                   wen_tmp1 = 0;
                   wen_b_tmp1 = 0;
                   ren = 0;                    
                 end  
       tmp_intt3:begin
                   sel_m = 1;
                   sel = 0;
                   done = 0;
                   en = 1;
                   wen_tmp1 = 0;
                   wen_b_tmp1 = 0;
                   ren = 0;                          
                 end      
       tmp_intt4:begin
                   sel_m = 1;
                   sel = 0;
                   done = 0;
                   en = 1;
                   wen_tmp1 = 0;
                   wen_b_tmp1 = 0;
                   ren = 0;                    
                  end    
       tmp_intt5:begin
                    sel_m = 1;
                    sel = 0;
                    done = 0;
                    en = 1;
                    wen_tmp1 = 0;
                    wen_b_tmp1 = 0;
                    ren = 0;                    
                 end      
       tmp_intt6:begin
                    sel_m = 1;
                    sel = 0;
                    done = 0;
                    en = 1;
                    wen_tmp1 = 0;
                    wen_b_tmp1 = 0;
                    ren = 0;                    
                  end
       tmp_intt7:begin
                    sel_m = 1;
                    sel = 0;
                    done = 0;
                    en = 1;
                    wen_tmp1 = 0;
                    wen_b_tmp1 = 0;
                    ren = 0;                    
                  end  
        tmp_intt8:begin
                     sel_m = 1;
                     sel = 0;
                     done = 0;
                     en = 1;
                     wen_tmp1 = 0;
                     wen_b_tmp1 = 0;
                     ren = 0;                          
                   end      
         tmp_intt9:begin
                     sel_m = 1;
                     sel = 0;
                     done = 0;
                     en = 1;
                     wen_tmp1 = 0;
                     wen_b_tmp1 = 0;
                     ren = 0;                    
                     end    
         tmp_intt10:begin
                       sel_m = 1;
                       sel = 0;
                       done = 0;
                       en = 1;
                       wen_tmp1 = 0;
                       wen_b_tmp1 = 0;
                       ren = 0;                    
                     end 
          tmp_intt11:begin
                        sel_m = 1;
                        sel = 0;
                        done = 0;
                        en = 1;
                        wen_tmp1 = 0;
                        wen_b_tmp1 = 0;
                        ren = 0;                          
                      end      
          tmp_intt12:begin
                         sel_m = 1;
                         sel = 0;
                         done = 0;
                         en = 1;
                         wen_tmp1 = 0;
                         wen_b_tmp1 = 0;
                         ren = 0;                    
                       end    
           tmp_intt13:begin
                          sel_m = 1;
                          sel = 0;
                          done = 0;
                          en = 1;
                          wen_tmp1 = 0;
                          wen_b_tmp1 = 0;
                          ren = 0;                    
                       end                                                 
      DONE:begin
              sel_m = 1;
              sel = 1;
              done = 1;
              en = 0;
              wen_tmp1 = 0;
              wen_b_tmp1 = 0;
              ren = 0;              
            end
      default:;
     endcase
  end
  
  always@(posedge clk or posedge rst)
  begin 
     if(rst)
     begin
         loop_p <= 9;
         J <= 512;
         i <= 0;
         s <= 0;
         k <= 0;
     end
     else if (cs == idle)
     begin
        loop_p <= 9;
        J <= 512;
        i <= 0;
        s <= 0;
        k <= 0;
     end
     else if(cs == NTT)
     begin
          if(J >= 4)
          begin
             if(i == ((J >> 2)-1))
             begin
                 i <= 0;
                 if(k == ((512 >> loop_p)-1))
                 begin
                     k <= 0;
                     loop_p <= loop_p - 1;
                     J <= J >> 1;                         
                 end
                 else
                   k <= k + 1;
             end
             else
                i <= i + 1;
          end
          else
          begin
             if(s == 127)
             begin
                s <= 0;
                  if(loop_p == 0)
                  begin
                    loop_p <= 0;
                    J <= 1;
                  end
                  else
                  begin
                    J <= J >> 1;
                    loop_p <= loop_p - 1;
                  end
             end
             else
                s <= s + 1;
         end
     end
     else if(cs == inner_product)
     begin
         J <= 1;
         if(s == 127)
            s <= 0;
         else
            s <= s + 1;           
     end 
     else if(cs == INTT)
     begin
          if(J >= 4)
          begin
             if(i == ((J >> 2)-1))
             begin
                 i <= 0;
                 if(k == ((512 >> loop_p)-1))
                 begin
                     k <= 0;
                     if(loop_p == 9)
                     begin
                         loop_p <= 0;
                         J <= 1;
                     end
                     else
                     begin
                         loop_p <= loop_p + 1;
                         J <= J << 1;
                     end
                 end
                 else
                   k <= k + 1;
             end
             else
                i <= i + 1;
          end
          else
          begin
             if(s == 127)
             begin
                s <= 0;
                J <= J << 1;
                loop_p <= loop_p + 1;
             end
             else
                s <= s + 1;
          end  
     end
     else
     //流水线最后阶段
     begin
       loop_p <= 0;
       J <= 1;
       i <= 0;
       s <= 0;
       k <= 0;
     end
   end
  
endmodule