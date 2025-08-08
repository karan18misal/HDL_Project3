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
        if (encryption_on) begin
            dataa = data_in - 3;
            dataa = dataa ^ 2;
            dataa = dataa + 9;
            dataa = dataa * 3;
        end else begin
            dataa = data_in;
        end
    end else if (key_access_reg == 16'h0032) begin
        if (!encryption_on) begin
            dataa = data_in / 3;
            dataa = dataa - 9;
            dataa = ~(dataa ^ 2);
            dataa = dataa + 3;
        end else begin
            dataa = data_in;
        end
    end
    data_out = dataa;
end
endmodule
