class env;
    driver d0;
    generator g0;
    monitor m0;
    scoreboard s0;
    mailbox gen2drv;
    mailbox mon2scr;
	function new(virtual ram_if vinf);
		gen2drv = new();
		mon2scr = new();
		g0 = new(gen2drv);
		d0 = new(gen2drv, vinf);
		m0 = new(mon2scr, vinf);
		s0 = new(mon2scr);
	endfunction
    task run();
        fork
            g0.run();
            d0.run();
            m0.run();
            s0.run();
        join_any
    endtask
endclass