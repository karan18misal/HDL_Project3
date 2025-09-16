module top_main(
  input clk,
  input [31:0] data_in,
  input [31:0] write_data_alu,
  input [9:0] read_address,
  input [9:0] write_address,
  input [9:0] read_address_reg,
  input [9:0] write_address_reg,
  input [9:0] reg1,
  input [9:0] reg2,
  input [9:0] address_mem,
  input [9:0] address_alu,
  input [9:0] address_to_mem,
  output reg [31:0] read_reg1,
  output reg [31:0] read_reg2,
  output reg [31:0] data_out_mem
);
  wire [31:0]data_regtosec;
  wire [31:0]data_sectomem;
  wire [31:0]data_memtosec;
  wire [31:0]data_sectoreg;
  wire [15:0] key_access_mem,
  wire [15:0] key_access_reg,
  
  memory m0(.clk(clk), .data_in(data_in), .read_address(read_address), .write_address(write_address), .data_in_reg(data_sectomem), .read_address_reg(read_address_reg), .write_address_reg(write_address_reg), .data_out(data_out), .data_out_reg(data_memtosec), .key_access(key_access_mem));
  registers r0(.clk(clk), .reg1(reg1), .reg2(reg2), .address_mem(address_mem), .address_alu(address_alu), .address_to_mem(address_to_mem), .write_data_mem(data_sectoreg), .write_data_alu(write_data_alu), .read_reg1(read_reg1), .read_reg2(read_reg1), .memory_out(data_regtosec), .key_access(key_access_reg));
  security s0(.data_in_memory(data_memtosec), .data_in_reg(data_regtosec), .key_access_mem(key_access_mem), .key_access_reg(key_access_reg), .read_address(read_address), .write_address(write_address), .data_out_mem(data_sectomem), .data_out_reg(data_sectoreg));
endmodule
