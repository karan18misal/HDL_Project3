

// Interface
interface top_if(input bit clk);
  logic [9:0] address_mem, address_reg, address_reg1, address_reg2;
  logic [31:0] data_in, data_in_reg;
  logic enable, memory_input_selection, reg_input_selection;
  logic [31:0] data_mem, data_reg, data_reg1, data_reg2;

  modport DUT (
    input clk, address_mem, address_reg, address_reg1, address_reg2,
    input data_in, data_in_reg, enable, memory_input_selection, reg_input_selection,
    output data_mem, data_reg, data_reg1, data_reg2
  );

  modport TB (
    input clk,
    output address_mem, address_reg, address_reg1, address_reg2,
    output data_in, data_in_reg, enable, memory_input_selection, reg_input_selection,
    input data_mem, data_reg, data_reg1, data_reg2
  );
endinterface

// Generator
class generator;
  rand bit [9:0] address_mem, address_reg, address_reg1, address_reg2;
  rand bit [31:0] data_in, data_in_reg;
  rand bit enable, memory_input_selection, reg_input_selection;

  function void generate();
    assert(this.randomize());
  endfunction
endclass

// Driver
class driver;
  virtual top_if.TB vif;

  function new(virtual top_if.TB vif);
    this.vif = vif;
  endfunction

  task drive(generator gen);
    vif.address_mem = gen.address_mem;
    vif.address_reg = gen.address_reg;
    vif.address_reg1 = gen.address_reg1;
    vif.address_reg2 = gen.address_reg2;
    vif.data_in = gen.data_in;
    vif.data_in_reg = gen.data_in_reg;
    vif.enable = gen.enable;
    vif.memory_input_selection = gen.memory_input_selection;
    vif.reg_input_selection = gen.reg_input_selection;
    #10;
  endtask
endclass

// Monitor
class monitor;
  virtual top_if.TB vif;

  typedef struct {
    bit [31:0] data_mem, data_reg, data_reg1, data_reg2;
  } output_t;

  mailbox #(output_t) mon_mb;

  function new(virtual top_if.TB vif, mailbox #(output_t) mon_mb);
    this.vif = vif;
    this.mon_mb = mon_mb;
  endfunction

  task monitor_outputs();
    output_t out;
    forever begin
      #10;
      out.data_mem = vif.data_mem;
      out.data_reg = vif.data_reg;
      out.data_reg1 = vif.data_reg1;
      out.data_reg2 = vif.data_reg2;
      mon_mb.put(out);
    end
  endtask
endclass

// Scoreboard
class scoreboard;
  mailbox #(monitor::output_t) mon_mb;

  function new(mailbox #(monitor::output_t) mon_mb);
    this.mon_mb = mon_mb;
  endfunction

  task check();
    monitor::output_t out;
    forever begin
      mon_mb.get(out);
      $display("Scoreboard Check: MEM=%h REG=%h REG1=%h REG2=%h",
               out.data_mem, out.data_reg, out.data_reg1, out.data_reg2);
      // Add comparison logic here if needed
    end
  endtask
endclass

// Top Testbench
module tb_top_main;
  bit clk;
  top_if intf(clk);

  // DUT instantiation
  top_main dut (
    .clk(clk),
    .address_mem(intf.address_mem),
    .address_reg(intf.address_reg),
    .address_reg1(intf.address_reg1),
    .address_reg2(intf.address_reg2),
    .data_in(intf.data_in),
    .data_in_reg(intf.data_in_reg),
    .enable(intf.enable),
    .memory_input_selection(intf.memory_input_selection),
    .reg_input_selection(intf.reg_input_selection),
    .data_mem(intf.data_mem),
    .data_reg(intf.data_reg),
    .data_reg1(intf.data_reg1),
    .data_reg2(intf.data_reg2)
  );

  initial clk = 0;
  always #5 clk = ~clk;

  generator gen;
  driver drv;
  monitor mon;
  scoreboard sb;
  mailbox #(monitor::output_t) mon_mb;

  initial begin
    gen = new();
    mon_mb = new();
    drv = new(intf);
    mon = new(intf, mon_mb);
    sb = new(mon_mb);

    fork
      mon.monitor_outputs();
      sb.check();
    join_none

    repeat (10) begin
      gen.generate();
      drv.drive(gen);
      #20;
    end

    $display("Testbench completed.");
    $finish;
  end
endmodule
