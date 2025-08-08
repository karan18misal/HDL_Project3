module memory (
    input clk,
    input [9:0] address,
    input [31:0] write_data,
    input mem_write,
    output [31:0] read_data,
    output [15:0]key_access
);
    wire [31:0]data_memory;
    reg [31:0] memory [0:1023];
    always @(posedge clk) begin
        if (mem_write) begin
            memory[address] <= write_data;
        end
       else begin
            data_memory = memory[address];
       end
    end
    assign key_access = 16'h32;
    assign read_data = data_memory;
endmodule
