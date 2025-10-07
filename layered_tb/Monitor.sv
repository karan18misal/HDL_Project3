class Monitor;
  virtual top_main_if vif;

  function new(virtual top_main_if vif);
    this.vif = vif;
  endfunction

  task observe();
    $display("Output: %h, Zero: %b", vif.data_out_mem, vif.zero);
  endtask
endclass
