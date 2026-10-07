module led_blink(
    input clk, reset, clk_en,
    output reg [9:0] led_out
);
    always @(posedge clk ) begin
        if (reset) led_out <= 10'b0000_0000_00;
        else begin
            if (clk_en) led_out <= ~led_out;
        end
    end
endmodule