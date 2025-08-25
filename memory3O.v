module memory(
    input clk,
    input [31:0] data_in,
    input [9:0] read_address,
    input [9:0] write_address,
    input [31:0] data_in_reg,
    input [9:0] read_address_reg,
    input [9:0] write_address_reg,
    output reg [31:0] data_out,
    output reg [31:0] data_out_reg,
    output [15:0] key_access
);

    reg [31:0] memory [0:1023];

    always @(posedge clk) begin
        memory[write_address] <= data_in;
        data_out <= memory[read_address];
        memory[write_address_reg] <= data_in_reg;
        data_out_reg <= memory[read_address_reg];
    end

    assign key_access = 16'h0032;

endmodule
