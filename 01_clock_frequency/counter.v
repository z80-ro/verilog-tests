`default_nettype none

module counter (
    input CLK,
    input RESET,
    output wire LED_GREEN4, 
    output wire LED_GREEN5 );

reg [31:0] counter;

assign LED_GREEN5 = counter[4];
assign LED_GREEN4 = counter[2];

always @(posedge CLK or negedge RESET) begin
    if (RESET == 0) 
        counter <= 0;
    else
        counter <= counter + 1;
end

endmodule

