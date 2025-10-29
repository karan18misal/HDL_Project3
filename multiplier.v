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

wire [31:0]s0;
wire [31:0]s1;
wire [31:0]s2;
wire [31:0]s3;
wire [31:0]s4;
wire [31:0]s5;
wire [31:0]s6;
wire [31:0]s7;
wire [31:0]s8;
wire [31:0]s9;
wire [31:0]s10;
wire [31:0]s11;
wire [31:0]s12;
wire [31:0]s13;
wire [31:0]s14;

wire cout0, cout1, cout2, cout3, cout4, cout5, cout6, cout7, cout8, cout9, cout10, cout11, cout12, cout13, cout14;

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

modifiedAdder_32bit add0 (.Cin(1'b0), .A(y0),  .B(y1),  .Sum(s0), .Cout(cout0));
modifiedAdder_32bit add1 (.Cin(1'b0), .A(y2),  .B(y3),  .Sum(s1), .Cout(cout1));
modifiedAdder_32bit add2 (.Cin(1'b0), .A(y4),  .B(y5),  .Sum(s2), .Cout(cout2));
modifiedAdder_32bit add3 (.Cin(1'b0), .A(y6),  .B(y7),  .Sum(s3), .Cout(cout3));
modifiedAdder_32bit add4 (.Cin(1'b0), .A(y8),  .B(y9),  .Sum(s4), .Cout(cout4));
modifiedAdder_32bit add5 (.Cin(1'b0), .A(y10), .B(y11), .Sum(s5), .Cout(cout5));
modifiedAdder_32bit add6 (.Cin(1'b0), .A(y12), .B(y13), .Sum(s6), .Cout(cout6));
modifiedAdder_32bit add7 (.Cin(1'b0), .A(y14), .B(y15), .Sum(s7), .Cout(cout7));

modifiedAdder_32bit add8  (.Cin(1'b0), .A(s0), .B(s1), .Sum(s8),  .Cout(cout8));
modifiedAdder_32bit add9  (.Cin(1'b0), .A(s2), .B(s3), .Sum(s9),  .Cout(cout9));
modifiedAdder_32bit add10 (.Cin(1'b0), .A(s4), .B(s5), .Sum(s10), .Cout(cout10));
modifiedAdder_32bit add11 (.Cin(1'b0), .A(s6), .B(s7), .Sum(s11), .Cout(cout11));

modifiedAdder_32bit add12 (.Cin(1'b0), .A(s8), .B(s9),  .Sum(s12), .Cout(cout12));
modifiedAdder_32bit add13 (.Cin(1'b0), .A(s10), .B(s11), .Sum(s13), .Cout(cout13));

modifiedAdder_32bit add14 (.Cin(1'b0), .A(s12), .B(s13), .Sum(s14), .Cout(cout14));

endmodule