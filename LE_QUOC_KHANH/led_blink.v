module led_blink(
    input clk, reset, clk_en,
    output reg [11:0] led_out
);
    always @(posedge clk) begin
        if (reset) led_out <= 12'b0000_0000_0000;
        else if (clk_en) led_out <= ~led_out;
    end

endmodule