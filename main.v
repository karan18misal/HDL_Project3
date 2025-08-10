module secure_system (
    input clk,
    input mem_write,
    input encryption_on,
    input [9:0] reg_address,
    input [9:0] mem_address,
    input [31:0] mem_write_data,
    output [31:0] reg_data_out
);

    // Internal wires
    wire [31:0] memory_data_out;
    wire [31:0] secured_data;
    wire [15:0] key_access_mem;
    wire [15:0] key_access_reg;

    // Step 1: Memory access
    memory u_memory (
        .clk(clk),
        .address(mem_address),
        .write_data(mem_write_data),
        .mem_write(mem_write),
        .read_data(memory_data_out),
        .key_access(key_access_mem)
    );

    // Step 2: Security processing
    security u_security (
        .data_in(memory_data_out),
        .encryption_on(encryption_on),
        .key_access_mem(key_access_mem),
        .key_access_reg(key_access_reg),
        .data_out(secured_data)
    );

    // Step 3: Write secured data to registers
    registers u_registers (
        .clk(clk),
        .reg1(reg_address),
        .reg2(10'd0),  // unused
        .read_enable(1'b0), // not reading
        .address(reg_address),
        .write_data(secured_data),
        .read_reg1(reg_data_out),
        .read_reg2(), // unused
        .memory_out(), // unused
        .key_access(key_access_reg)
    );

endmodule
