module registers(
    input clk,
    input [9:0] reg1,
    input [9:0] reg2,
    input read_enable,
    input [9:0] address,
    input [31:0] write_data,
    output reg [31:0] read_reg1,
    output reg [31:0] read_reg2,
    output reg [31:0] memory_out,
    output [15:0] key_access
);

    reg [31:0] memory [0:1023];

    always @(posedge clk) begin
        if (!read_enable) begin
            memory[address] <= write_data;
        end else begin
            read_reg1 <= memory[reg1];
            read_reg2 <= memory[reg2];
            memory_out <= memory[address];
        end
    end

    assign key_access = 16'h0032;

endmodule
