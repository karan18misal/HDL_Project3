module security(input [31:0]data_in, input encryption_on, input [15:0]key_access, output [31:0]data_out);
wire dataa;
if(key_access == 16'h32)
begin 
if(encryption
_on)
begin 
dataa = data_in - 3;
dataa = dataa / 2;
dataa = dataa +9;
dataa = dataa *3;
end
else
dataa= data_in /3;
dataa= dataa-9;
dataa = dataa * 2;
dataa = dataa +3;
end
end
assign data_out = dataa;
endmodule
