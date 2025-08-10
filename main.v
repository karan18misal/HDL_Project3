module top_main(input clk,
                input [9:0] address_mem,
                input [9:0] address_reg,
                input [9:0] address_reg1,
                input [9:0] address_reg2,
                input [31:0]data_in,
                input enable,
                output data_mem,
                output data_reg);
