module pll #(
    parameter DIVR    =  0,
    parameter DIVF    = 66,
    parameter DIVQ    =  3,
    parameter FLT_RNG =  1 ) (
	
    input  clock_in,
	output clock_out,
	output locked
	);

SB_PLL40_PAD #(
		.FEEDBACK_PATH("SIMPLE"),
		.DIVR(DIVR),        // DIVR =  0
		.DIVF(DIVF),        // DIVF = 66
		.DIVQ(DIVQ),        // DIVQ =  3
		.FILTER_RANGE(FLT_RNG) // FILTER_RANGE = 1
	) uut (
		.LOCK(locked),
		.RESETB(1'b1),
		.BYPASS(1'b0),
		.PACKAGEPIN(clock_in),
		.PLLOUTCORE(clock_out)
		);

endmodule

