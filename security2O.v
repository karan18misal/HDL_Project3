module security(
    input [31:0] data_in,
    input encryption_on,
    input [15:0] key_access_mem,
    input [15:0] key_access_reg,
    output reg [31:0] data_out
);
reg [31:0] dataa;
always @(*) begin
    if (key_access_mem == 16'h0032) begin       
            dataa = (((data_in - 3) ^ 2 )+ 9) * 3;
       
    end 
    if (key_access_reg == 16'h0032) begin
        
            dataa = ~(((data_in / 3) - 9) ^ 2 ) + 3;
        
end
endmodule
