module test;

reg clk = 0;
reg reset = 1;
wire led1;
wire led2;

    initial
        begin
            $dumpfile("complete.vcd");
            $dumpvars(0, test);
            #2 reset = 0;
            #4 reset = 1;
            #1000 $finish;
        end
    
    always #1 clk = !clk;

    counter cnt (clk, reset, led1, led2);

endmodule

