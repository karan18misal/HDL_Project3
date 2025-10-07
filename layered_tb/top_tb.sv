module top_main_tb;

  bit clk;
  top_main_if tb_if(clk);

  // DUT instantiation
  top_main uut (
    .clk(tb_if.clk),
    .data_in(tb_if.data_in),
    .opcode(tb_if.opcode),
    .read_address(tb_if.read_address),
    .write_address(tb_if.write_address),
    .read_address_reg(tb_if.read_address_reg),
    .write_address_reg(tb_if.write_address_reg),
    .reg1(tb_if.reg1),
    .reg2(tb_if.reg2),
    .address_mem(tb_if.address_mem),
    .address_alu(tb_if.address_alu),
    .address_to_mem(tb_if.address_to_mem),
    .data_out_mem(tb_if.data_out_mem),
    .zero(tb_if.zero)
  );

  // Clock generation
  initial clk = 0;
  always #5 clk = ~clk;

  // Layered components
  Generator gen;
  Driver drv;
  Monitor mon;

  initial begin
    gen = new();
    drv = new(tb_if);
    mon = new(tb_if);

    repeat (10) begin
      gen.generate();
      drv.drive(gen);
      #10;
      mon.observe();
    end

    $finish;
  end

endmodule
