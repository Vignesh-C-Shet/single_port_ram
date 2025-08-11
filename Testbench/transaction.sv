class transaction #(parameter ADDR_WIDTH = 2,parameter DATA_WIDTH = 8);
	rand bit [ADDR_WIDTH- 1:0] addr;
	rand bit [DATA_WIDTH-1:0] wdata;
	rand bit wr_en;
	bit [DATA_WIDTH-1:0] rdata;

  function void print(string tag = "");
    $display("%s --> addr = %d | wdata= %d | wr_en = %b", tag, addr, wdata, wr_en);
	endfunction
endclass