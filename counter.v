module counter(input clk, output [1:0]key_select);
wire [9:0]count;
initial begin 
count =10'b0000000000;
end
always @(posedge clk)
count = count + 1'b1;
assign key_select = [9:8]cout;
endmodule