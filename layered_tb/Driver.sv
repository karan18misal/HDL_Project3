class Driver;
  virtual top_main_if vif;

  function new(virtual top_main_if vif);
    this.vif = vif;
  endfunction

  task drive(input Stimulus stim);
    vif.data_in         <= stim.data_in;
    vif.opcode          <= stim.opcode;
    vif.read_address    <= stim.read_address;
    vif.write_address   <= stim.write_address;
    vif.read_address_reg <= stim.read_address_reg;
    vif.write_address_reg <= stim.write_address_reg;
    vif.reg1            <= stim.reg1;
    vif.reg2            <= stim.reg2;
    vif.address_mem     <= stim.address_mem;
    vif.address_alu     <= stim.address_alu;
    vif.address_to_mem  <= stim.address_to_mem;
  endtask
endclass
