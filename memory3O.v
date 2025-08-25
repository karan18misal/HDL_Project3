module memory(input clk, input data_in, input read_address, input write_address, output key_access, output data_out)
    reg [31:0] memory [0:1023];
    always @(posedge clk) begin
            memory[write_address] <= data_in;
            data_out <= memory[read_address];
    end
    assign key_access = 16'h0032; 
endmodule