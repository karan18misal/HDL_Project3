class Generator;

  rand bit [31:0] data_in;
  rand bit [4:0] opcode;
  rand bit [7:0] read_address, write_address;
  rand bit [7:0] read_address_reg, write_address_reg;
  rand bit [7:0] reg1, reg2;
  rand bit [7:0] address_mem, address_alu, address_to_mem;


  constraint opcode_range {
    opcode >= 5'd0;
    opcode <= 5'd9;
  }

  constraint address_valid {
    read_address != write_address;
    read_address_reg != write_address_reg;
    reg1 != write_address_reg;
    reg2 != write_address_reg;
  }
  function new();
    assert(this.randomize()) else $fatal("Randomization failed");
  endfunction

endclass
