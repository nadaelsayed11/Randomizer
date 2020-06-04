//`timescale 1 ns/ 10 ps
module randomizer_tb();

//internal signals
reg clk;
reg reset;
reg en;
reg len;
reg [14:0] load;
reg d;
wire q;
reg [95:0]in_p;
reg [95:0] out_p;
integer i;
//clock period
localparam PERIOD = 10;
//unit under test
randomizer UUT(.clk(clk), .input_data(d), .reset(reset),
 .en(en), .load(load), .len(len), .output_data(q));
always begin
	clk = ~clk;
        #(PERIOD/2);
end
initial begin
	clk = 1;
        en=1;
	len =0;
	reset = 1'b0;
	in_p = 96'hACBCD2114DAE1577C6DBF4C9;
	out_p = 96'h000000000000000000000000;
	d = 1'b0;
	$monitor("%g %b %b %b %h",$time,d ,q ,clk, out_p);
	for(i=95; i> -1; i=i-1)
	begin
	d = in_p[i];	
        #(PERIOD);
	out_p[i] = q ;
        //#(PERIOD);
	end
end
//assign out_p[i] = q;
endmodule
