class test;
	env en;
	function new(virtual ram_if vif);
		en = new(vif);
	endfunction
	task run();
	    en.run();
	endtask
endclass