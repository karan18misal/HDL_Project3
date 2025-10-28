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
    initial begin
  memory[0]  = 32'h00000000; // value = 0
  memory[1]  = 32'h00000001; // value = 1
  memory[2]  = 32'h00000002; // value = 2
  memory[3]  = 32'h00000003; // value = 3
  memory[4]  = 32'h00000004; // value = 4
  memory[5]  = 32'h00000005; // value = 5
  memory[6]  = 32'h00000006; // value = 6
  memory[7]  = 32'h00000007; // value = 7
  memory[8]  = 32'h00000008; // value = 8
  memory[9]  = 32'h00000009; // value = 9
  memory[10] = 32'h0000000A; // value = 10
end


    always @(posedge clk) begin
        memory[write_address] <= data_in;
        data_out <= memory[read_address];
        memory[write_address_reg] <= data_in_reg;
        data_out_reg <= memory[read_address_reg];
    end

    assign key_access = 16'h0032;

endmodule
