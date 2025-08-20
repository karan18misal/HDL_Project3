module tb_top_main;
  logic clk;
  logic [9:0] address_mem;
  logic [9:0] address_reg;
  logic [9:0] address_reg1;
  logic [9:0] address_reg2;
  logic [31:0] data_in;
  logic [31:0] data_in_reg;
  logic enable;
  logic memory_input_selection;
  logic reg_input_selection;
  logic [31:0] data_mem;
  logic [31:0] data_reg;
  logic [31:0] data_reg1;
  logic [31:0] data_reg2;
  top_main dut (
    .clk(clk),
    .address_mem(address_mem),
    .address_reg(address_reg),
    .address_reg1(address_reg1),
    .address_reg2(address_reg2),
    .data_in(data_in),
    .data_in_reg(data_in_reg),
    .enable(enable),
    .memory_input_selection(memory_input_selection),
    .reg_input_selection(reg_input_selection),
    .data_mem(data_mem),
    .data_reg(data_reg),
    .data_reg1(data_reg1),
    .data_reg2(data_reg2)
  );
  initial clk = 0;
  always #5 clk = ~clk; 
  initial begin
	address_mem = 10'b00;
	address_reg = 10'b00;
	enable=1'b0;
	data_in= 32'd29839;
	memory_input_selection=1'b0;
	reg_input_selection=1'b1;
  
	
