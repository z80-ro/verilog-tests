module top (
        input BTN_A,
        input BTN_B,
        output LED_GREEN);

        assign LED_GREEN = BTN_A & BTN_B;

endmodule


