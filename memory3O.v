module memory(input clk, input data_in, input read_address, input write_address, output data_out)
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