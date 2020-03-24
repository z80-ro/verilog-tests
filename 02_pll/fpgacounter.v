`default_nettype none

module top (
    input CLK,
    input BTN_USR,
    output wire LED_GREEN4, 
    output wire LED_GREEN5 );

reg [31:0] counter;
wire PLL_CLK;       // new clock signal driven by pll instance
wire PLL_LOCK;      // indicates is PLL_CLK is locked to the pll source

assign LED_GREEN5 = counter[26];    // Changed bits because FPGA is clocked much faster now
assign LED_GREEN4 = counter[24];    // previously they were 20 and 22

//-----------------------------------------------------
// pll module instantiation
//-----------------------------------------------------
pll
// First the module parameters; there are default values set in the module
// You don't need to add these unless you need to change the defaults
// In this case I will change them to get 150MHz instead of the default 100MHz
#(  .DIVR    ( 0),
    .DIVF    (49),
    .DIVQ    ( 2),
    .FLT_RNG ( 1)
// Here are the signal connections to integrate the module in the main design
    ) pll_instance (
        .clock_in  (     CLK),
        .clock_out ( PLL_CLK),
        .locked    (PLL_LOCK)
        );

//-----------------------------------------------------
// Main always block
//-----------------------------------------------------
always @(posedge PLL_CLK or negedge BTN_USR) begin
    if (BTN_USR == 0) 
        counter <= 0;
    else
        if (PLL_LOCK == 1)
            counter <= counter + 1;
        else
            counter <= 0;
end

endmodule
