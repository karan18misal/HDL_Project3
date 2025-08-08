module registers(input [3:0]reg1, input [3:0]reg2, input read_enable, input write_reg, output read_reg1, output read_reg2, output key_access)
    wire [31:0]data_memory;
    reg [31:0] memory [0:1023];
    always @(posedge clk) begin
        if (mem_write) begin
            memory[write_reg]<= write_data;
        end
       else begin
            data_memory = memory[word_addr];
       end
    end
    assign key_access = 16'h32;
    assign read_reg2 = data_memory;
endmodule
