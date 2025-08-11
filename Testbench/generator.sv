
class generator;
transaction tx;

mailbox gen2drv;
	function new(mailbox gen2drv);
		this.gen2drv = gen2drv;
	endfunction
	task run();
		for(int i=0; i<4; i= i+1) begin
		tx = new();
		//void'(tx.randomize());
		//tx.wr_en = 1;
		//tx.addr=i;
          void'(tx.randomize() with {tx.wr_en == 1;tx.addr == i;});

          tx.print("Generator");
		gen2drv.put(tx);
end
	for(int i=0; i<4; i= i+1) begin
		tx = new();
		//void'(tx.randomize());
		tx.wr_en = 0;
		tx.addr=i;
		tx.wdata = 'z;

      tx.print("Generator");
		gen2drv.put(tx);

	end
	endtask
endclass