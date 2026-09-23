module mode1(
    input clk, reset, clk_en,
    output reg [11:0] led_out
);
    always @(posedge clk) begin
        if (reset) led_out <= 12'b0000_0000_0000;
        else
            if (clk_en) begin
                if (led_out == 12'b0000_0000_0000 || led_out == 12'b0000_0000_0001)
                    led_out <= 12'b1000_0000_0000;
                else led_out <= led_out >> 1;
            end
    end
endmodule