module multiplier(input [15:0]a, input [15:0]b, output [31:0]y);
wire [31:0]y0;
wire [31:0]y1;
wire [31:0]y2;
wire [31:0]y3;
wire [31:0]y4;
wire [31:0]y5;
wire [31:0]y6;
wire [31:0]y7;
wire [31:0]y8;
wire [31:0]y9;
wire [31:0]y10;
wire [31:0]y11;
wire [31:0]y12;
wire [31:0]y13;
wire [31:0]y14;
wire [31:0]y15;
assign y0  = (a[0]  * b) << 0;
assign y1  = (a[1]  * b) << 1;
assign y2  = (a[2]  * b) << 2;
assign y3  = (a[3]  * b) << 3;
assign y4  = (a[4]  * b) << 4;
assign y5  = (a[5]  * b) << 5;
assign y6  = (a[6]  * b) << 6;
assign y7  = (a[7]  * b) << 7;
assign y8  = (a[8]  * b) << 8;
assign y9  = (a[9]  * b) << 9;
assign y10 = (a[10] * b) << 10;
assign y11 = (a[11] * b) << 11;
assign y12 = (a[12] * b) << 12;
assign y13 = (a[13] * b) << 13;
assign y14 = (a[14] * b) << 14;
assign y15 = (a[15] * b) << 15;


endmodule