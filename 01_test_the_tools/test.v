module top (
        input BTN_A,
        input BTN_B,
        input BTN_USR,

        output LED_RED,
        output LED_GREEN);

        assign LED_GREEN = !(BTN_A & BTN_B);
        assign LED_RED = BTN_USR;

endmodule


