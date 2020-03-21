`default_nettype none

module top (
    input CLK,
    input BTN_USR,
    output wire LED_GREEN4, 
    output wire LED_GREEN5 );

reg [31:0] counter;

assign LED_GREEN5 = counter[22];
assign LED_GREEN4 = counter[20];

always @(posedge CLK or negedge BTN_USR) begin
    if (BTN_USR == 0) 
        counter <= 0;
    else
        counter <= counter + 1;
end

endmodule
