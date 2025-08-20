module memory (
    input clk,
    input [9:0] address,
    input [31:0] write_data,
    input mem_write,
    output reg [31:0] read_data,
    output [15:0] key_access
);
    reg [31:0] memory [0:1023];

    always @(posedge clk) begin
        if (mem_write) begin
            memory[address] <= write_data;
        end else begin
            read_data <= memory[address];
        end
    end
    assign key_access = 16'h0032; 
endmodule
