class monitor;
	mailbox mon2scr;
	virtual ram_if vinf;
	transaction mx;
    function new(mailbox mon2scr, virtual ram_if vinf);
	    this.mon2scr=mon2scr;
	    this.vinf = vinf;
    endfunction
	task run();
		mx = new();
		forever begin
			wait(!vinf.reset);
			@(posedge vinf.clk);
			mx.addr=vinf.addr;
			mx.wdata=vinf.wdata;
			mx.wr_en = vinf.wr_en;
          #10
			mx.rdata=vinf.rdata;
			mon2scr.put(mx);
		end
	endtask
endclass	