module top_main(
  input clk,
  input [31:0] data_in,
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
)
  
