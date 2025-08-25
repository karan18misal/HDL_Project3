module memory(input clk, input data_in, input read_address, input write_address, input data_in_reg, input read_address_reg, input write_address_reg, output key_access, output data_out, output data_out);
    reg [31:0] memory [0:1023];
    always @(posedge clk) begin
            memory[write_address] <= data_in;
            data_out <= memory[read_address];
            memory[write_address_reg] <= data_in_reg;
            data_out_reg <= memory[read_address_reg];
    end
    assign key_access = 16'h0032; 
endmodule