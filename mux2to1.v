module mux2to1(input [31:0]a,
               input [31:0]b,
               input select, 
               output [31:0]y)
assign y= b?(select):a;
endmodule