module security(
    input [31:0] data_in_memory,
    input [31:0] data_in_reg,
    input [15:0] key_access_mem,
    input [15:0] key_access_reg,
    input [9:0] read_address,
    input [9:0] write_address,
    output reg [31:0] data_out_mem,
    output reg [31:0] data_out_reg
);
always @(*) begin
    if (key_access_mem == 16'h0032) begin
        if (write_address > 128)
            data_out_mem <= (((data_in_reg - 3) * (data_in_reg - 3)) + 9) * 3;
        else
            data_out_mem <= data_in_reg;
    end 

    if (key_access_reg == 16'h0032) begin
        if (read_address > 128)
            data_out_reg <= ~(((data_in_memory / 3 - 9) * (data_in_memory / 3 - 9)) + 3);
        else
            data_out_reg <= data_in_memory;
    end
end
endmodule
