module tb_top_main;

  // Clock generation
  logic clk;
  initial clk = 0;
  always #5 clk = ~clk; // 100MHz clock

  // Inputs
  logic [9:0] address_mem;
  logic [9:0] address_reg;
  logic [9:0] address_reg1;
  logic [9:0] address_reg2;
  logic [31:0] data_in;
  logic [31:0] data_in_reg;
  logic enable;
  logic memory_input_selection;
  logic reg_input_selection;

  // Outputs
  logic [31:0] data_mem;
  logic [31:0] data_reg;
  logic [31:0] data_reg1;
  logic [31:0] data_reg2;

  // DUT instantiation
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

  // Test sequence
  initial begin
    $display("Starting simulation...");
    
    // Initial setup
    enable = 0;
    memory_input_selection = 0;
    reg_input_selection = 0;
    address_mem = 10'd0;
    address_reg = 10'd0;
    address_reg1 = 10'd1;
    address_reg2 = 10'd2;
    data_in = 32'hA1A1A1A1;
    data_in_reg = 32'hB2B2B2B2;

    #20;

    // Write to memory and registers
    enable = 1;
    memory_input_selection = 0; // Use data_in
    reg_input_selection = 1;    // Use security_out
    for (int i = 0; i < 5; i++) begin
      address_mem = i;
      address_reg = i;
      data_in = 32'h1000 + i;
      data_in_reg = 32'h2000 + i;
      #20;
    end

    // Disable write
    enable = 0;
    #20;

    // Read and display first 5 memory and register values
    $display("\n--- Memory Contents ---");
    for (int i = 0; i < 5; i++) begin
      address_mem = i;
      #20;
      $display("Memory[%0d] = %h", i, dut.data_mem);
    end

    $display("\n--- Register Contents ---");
    for (int i = 0; i < 5; i++) begin
      address_reg = i;
      #20;
      $display("Register[%0d] = %h", i, dut.data_reg);
    end

    $display("\nSimulation complete.");
    $finish;
  end

endmodule
