class scoreboard #(parameter ADDR_WIDTH = 2,parameter DATA_WIDTH = 8);
	mailbox mon2scr;
	transaction mx ;
    logic [DATA_WIDTH-1:0] mem [0:(2**ADDR_WIDTH)-1];
    function new(mailbox mon2scr);
	    this.mon2scr = mon2scr;
	endfunction
	task run();
        forever begin
	
	        mon2scr.get(mx);
	        //write data to memory
            if (mx.wr_en==1) 
            mem[mx.addr] = mx.wdata;

            //read data from memory
            else begin


            if(mx.rdata == mem[mx.addr]) $display("verification passed mx.wr_en = %d | mx.adder = %d |  mx.wdata = %d | mx.rdata = %d | mem[mx.addr] = %d", mx.wr_en, mx.addr,   mx.wdata, mx.rdata, mem[mx.addr]);

            else $display("verification failed mx.wr_en = %d | mx.adder = %d | mx.wdata = %d | mx.rdata = %d | mem[mx.addr] = %d", mx.wr_en,  mx.addr, mx.wdata,mx.rdata, mem[mx.addr]);
            end
        end
    endtask
endclass