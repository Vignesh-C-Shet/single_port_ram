
interface ram_if (input logic clk);
logic reset;
logic wr_en;
logic [1:0] addr;
logic [7:0] wdata;
logic [7:0] rdata;

endinterface