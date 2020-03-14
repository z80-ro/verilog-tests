module top (
        input BTN_1,
        input BTN_3,
        output LED_GREEN2);

        assign LED_GREEN2 = BTN_1 & BTN_3;

endmodule


