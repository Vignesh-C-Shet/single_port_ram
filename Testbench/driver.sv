class driver;
  mailbox gen2drv;
  virtual ram_if vinf;
		transaction tx;
function new(mailbox gen2drv, virtual ram_if vinf);
this.gen2drv=gen2drv;
this.vinf=vinf;
endfunction
task run();
forever begin
  wait(!vinf.reset);
@(posedge vinf.clk);
gen2drv.get(tx);
vinf.addr=tx.addr;
vinf.wdata=tx.wdata;
vinf.wr_en=tx.wr_en;

end
endtask


endclass