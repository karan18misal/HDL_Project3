module secure_system (
    input clk,
    input read_enable,
    input mem_write,
    input encryption_on,
    input [9:0] reg1,
    input [9:0] reg2,
    input [9:0] address,
    input [31:0] write_data,
    output [31:0] secure_data_out
);

    // Internal wires
    wire [31:0] read_reg1;
    wire [31:0] read_reg2;
    wire [31:0] memory_out;
    wire [15:0] key_access_reg;
    wire [15:0] key_access_mem;
    wire [31:0] read_data;

    // Output from security module
    wire [31:0] data_to_output;

    // Instantiate registers module
    registers u_registers (
        .clk(clk),
        .reg1(reg1),
        .reg2(reg2),
        .read_enable(read_enable),
        .address(address),
        .write_data(write_data),
        .read_reg1(read_reg1),
        .read_reg2(read_reg2),
        .memory_out(memory_out),
        .key_access(key_access_reg)
    );

    // Instantiate memory module
    memory u_memory (
        .clk(clk),
        .address(address),
        .write_data(write_data),
        .mem_write(mem_write),
        .read_data(read_data),
        .key_access(key_access_mem)
    );

    // Instantiate security module
    security u_security (
        .data_in(read_data),
        .encryption_on(encryption_on),
        .key_access_mem(key_access_mem),
        .key_access_reg(key_access_reg),
        .data_out(data_to_output)
    );

    // Final output
    assign secure_data_out = data_to_output;

endmodule
