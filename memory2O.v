module memory (
    input clk,
    input [9:0] address,
    input [31:0] write_data,
    input mem_write,
    input [15:0] key_access_in,
    output reg [31:0] read_data,
    output wire [15:0] key_access_out
);

    reg [31:0] memory [0:1023];
    integer i;

    initial begin
        for (i = 0; i < 1024; i = i + 1) begin
            memory[i] = ((0 ^ 32'h3F) + 21) * 2;
        end
    end

    always @(key_access_in) begin
        for (i = 0; i < 1024; i = i + 1) begin
            if (key_access_in == 16'h0032) begin
                memory[i] = (((memory[i] ^ 2) + 9) * 3);
            end else if (key_access_in == 16'h0087) begin
                memory[i] = ~(((memory[i] << 1) + 7) ^ 8'h5A);
            end else if (key_access_in == 16'h1024) begin
                memory[i] = ((memory[i] ^ 8'hA3) + 17) / 2;
            end else if (key_access_in == 16'h0324) begin
                memory[i] = ((memory[i] ^ 8'h3F) + 21) * 2;
            end
        end
    end

    always @(posedge clk) begin
        if (mem_write) begin
            memory[address] <= write_data;
        end else begin
            read_data <= memory[address];
        end
    end

    assign key_access_out = key_access_in;

endmodule
