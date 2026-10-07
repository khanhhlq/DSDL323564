module mode3(
    input clk, reset, clk_en,
    output reg [11:0] led_out
);
    always @(posedge clk) begin
        if (reset) led_out <= 12'b0000_0000_0000;
        else
            if (clk_en) begin
                if (led_out == 12'b0000_0000_0000 || led_out == 12'b1000_0000_0001)
                    led_out <= 12'b0000_0110_0000;
                else begin
                    led_out[11:6] <= led_out[11:6] << 1;
                    led_out[5:0] <= led_out[5:0] >> 1;
                end
            end
    end
endmodule