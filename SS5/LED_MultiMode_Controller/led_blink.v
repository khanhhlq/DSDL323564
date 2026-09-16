module led_blink(
    input clk, reset, sw_clk_en, 
    output reg [7:0] count_out,
    output reg [7:0] led_out
);
    always @(posedge clk) begin
        if (reset) begin
            led_out <= 8'b0000_0000;
            count_out <= 88;
        end
        else begin
            count_out <= 88;
            if (sw_clk_en) led_out <= ~led_out;
        end
    end
endmodule