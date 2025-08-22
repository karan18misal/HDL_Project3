module memory (
    input clk,
    input [9:0] address,
    input [31:0] write_data,
    input mem_write,
    input key_access_in;
    output reg [31:0] read_data,
  output wire [15:0] key_access_out
);	
    integer i;
  	initial begin
      for (i = 0; i < 1024; i = i + 1)begin
      	memory[i] = ((memory[i] ^ 0x3F) + 21) * 2;
      end
    end
    reg [31:0] memory [0:1023];
    always @(key_access_in)begin
      for (i = 0; i < 1024; i = i + 1)begin
        if(key_access_in = 16'h0032)begin
          memory[i] = ~(((memory[i] / 2) - 21) ^ 0x3F);
          memory[i] <=  (((memory[i]) ^ 2 )+ 9) * 3;
        end
        else if(key_access_in = 16'h87)begin
          memory[i] <=  ~(((memory[i] / 3) - 9) ^ 2 ) + 3;
          memory[i] = ~(((memory[i] << 1) + 7) ^ 0x5A);
        end
        else if(key_access_in = 16'h1024)begin
          memory[i] = ((memory[i] ^ 0x5A) - 7) >> 1;
          memory[i] = ((memory[i] ^ 0xA3) + 17) / 2;
        end
        else if(key_access_in = 16'h324)begin
          memory[i] = ~(((memory[i] * 2) - 17) ^ 0xA3);
          memory[i] = ((memory[i] ^ 0x3F) + 21) * 2;

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
    assign key_access = key_access_in; 
endmodule
