module randomizer(clk,reset,len,load,en,input_data,output_data);
input input_data;
input clk,reset,load,en,len;
output reg output_data;
reg [14:0]data;
reg XorLastTwo;
initial begin data=15'b011011100010101; end
always@(posedge clk , posedge reset)
  begin
    if(reset)
       data <= 15'b0;
    else if(len)
	data<=load;
    else if(en)
       begin
       XorLastTwo = data[0]^data[1];
       data<={XorLastTwo , data[14:1]};
       output_data <= XorLastTwo^input_data;
       end
  end
//assign  XorLastTwo = data[0]^data[1];
//assign output_data = XorLastTwo^input_data;
endmodule
