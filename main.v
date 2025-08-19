module top_main(input clk,
                input [9:0] address_mem,
                input [9:0] address_reg,
                input [9:0] address_reg1,
                input [9:0] address_reg2,
                input [31:0]data_in,
                input [31:0]data_in_reg,
                input enable,
                input memory_input_selection,
                input reg_input_selection,
                output [31:0]data_mem,
                output [31:0]data_reg,
                output [31:0]data_reg1,
                output [31:0]data_reg2);
  wire [15:0]key_access_mem;
  wire [31:0]mem_out;
  wire [31:0]reg_out;
  wire [31:0]security_out;
  wire [31:0]mux_mem;
  wire [31:0]mux_security;
  wire [31:0]mux_reg;
  memory m0(.clk(clk), .address(adddress_mem), .write_data(mux_mem), .mem_write(enable), .read_data(mem_out), .key_access(key_access_mem));
  security s0(.data_in(mux_security), .encryption_on(enable), .key_access_mem(key_access_mem), .key_access_reg(key_access_reg), .data_out(security_out));
  registers r0(.clk(clk), .reg1(address_reg1), .reg2(address_reg2), .read_enable(enable), .address(address_reg), .write_data(mux_security), .read_reg1(data_reg1), .read_reg2(data_reg2), .memory_out(reg_out), .key_access(key_access_reg));
  mux2to1 mu0(.a(data_in), .b(security_out), .select(memory_input_selection), .y(mux_mem));
  mux2to1 mu1(.a(data_in_reg), .b(security_out), .select(reg_input_selection), .y(mux_reg));
  mux2to1 mu2(.a(mem_out), .b(reg_out), .select(enable), .y(mux_security));
  assign data_mem = mem_out;
  assign data_reg = reg_out;
endmodule
