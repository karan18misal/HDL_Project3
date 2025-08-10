module registers(input [9:0]reg1, input {9:0]reg2, input read_enable, input [9:0] address, output read_reg1, output read_reg2, output memory_out, output key_access)
    wire [31:0]data_memory1;
    wire [31:0]data_memory2;
    wire [31:0]data_memory3;
    reg [31:0] memory [0:1023];
    always @(posedge clk) begin
        if (!read_enable) begin
            memory[address]<= write_data;
        end
       else begin
           data_memory1 = memory[reg1];
           data_memory2 = memory[reg2];
           data_memory2 = memory[address;
       end
    end
    assign key_access = 16'h32;
    assign read_reg1 = data_memory1;
    assign read_reg2 = data_memory2;
    assign memory_out = data_memory3;
endmodule
