class scoreboard;
  virtual top_main_if vif;

  memory      m0;
  registers   r0;
  alu         a0;

  function new(virtual top_main_if vif, memory m0, registers r0, alu a0);
    this.vif = vif;
    this.m0  = m0;
    this.r0  = r0;
    this.a0  = a0;
  endfunction
  function check
endclass
