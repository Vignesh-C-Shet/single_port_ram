module top_tb;
    logic clk;
    ram_if intf(clk);
    test t0;

    initial begin
    	clk = 0;
    end
    always #5 clk= ~clk;
    ram dut(.clk(intf.clk), .reset(intf.reset), .addr(intf.addr),.wdata(intf.wdata), .rdata(intf.rdata), .wr_en(intf.wr_en));
    initial begin
        intf.reset=1;
        intf.wr_en=0;
        intf.addr = 0;
        intf.wdata=0;

        #10
        intf.reset=0;

        t0 = new(intf);
        t0.run();
    end
    initial begin
        #110 $finish;
    end
endmodule