module security(
    input [31:0] data_in_memory,
    input [31:0] data_in_reg,
    input [15:0] key_access_mem,
    input [15:0] key_access_reg,
    output reg [31:0] data_out_mem,
    output reg [31:0] data_out_reg
);
reg [31:0] dataa;
always @(*) begin
    if (key_access_mem == 16'h0032) begin       
            data_out_mem <= (((data_in_reg - 3) ^ 2 )+ 9) * 3; 
    end 
    if (key_access_reg == 16'h0032) begin
            data_out_reg <= ~(((data_in_mem / 3) - 9) ^ 2 ) + 3;      
end
endmodule
