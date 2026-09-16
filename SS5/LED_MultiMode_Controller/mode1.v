module mode_1(
    input clk, reset, sw_clk_en,
    output reg [7:0] count_out,
    output reg [7:0] led_out
);
    reg [7:0] count_led_temp;

    always @(posedge clk) begin
        if (reset) begin
            led_out <= 8'b0000_0000;
            count_out <= 0;
            count_led_temp <= 0;
        end
        else if (sw_clk_en)begin
            if (led_out == 8'b1111_1111 && count_led_temp == 4)
                led_out <= led_out;
            else if (led_out == 8'b1111_1111 && count_led_temp < 4) begin
                led_out <= 8'b1000_0000;
                count_led_temp <= count_led_temp + 1;
            end
            else led_out <= {1'b1, led_out[7:1]};

            if (count_out >= 99) count_out <= count_out;
            else count_out <= count_out + 1;
        end
    end
endmodule