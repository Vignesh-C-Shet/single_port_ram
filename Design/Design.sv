module ram
#(
	parameter ADDR_WIDTH = 2,
	parameter DATA_WIDTH = 8
)
(
	input clk,
	input reset,

	// control signals
	input[ADDR_WIDTH- 1:0] addr,
	input wr_en,

	// data signals
	input [DATA_WIDTH-1:0] wdata,
	output reg [DATA_WIDTH-1:0] rdata
);

// memory array
reg [DATA_WIDTH-1:0] mem [0 : (2**ADDR_WIDTH)-1];

// synchronous reset, write, and read logic
always @(posedge clk) begin
	if (reset) begin
		integer i;
		for(i = 0; i < 2**ADDR_WIDTH; i = i + 1)
			mem[i] <= '0;
		rdata <= '0;
	end else begin
		if (wr_en)
			mem[addr] <= wdata;
		else
			rdata <= mem[addr];
	end
end

endmodule