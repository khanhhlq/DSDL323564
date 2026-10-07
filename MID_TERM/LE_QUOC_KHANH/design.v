module led_controller(
    input clk, reset, sw_test_manual, sw_speed,
    input [1:0] sw_mode,
    output reg [11:0] led_out
);
    wire clk_en;

    wire [11:0] led_out1, led_out2, led_out3, led_out4, led_out_blink;

    divide_clock dc(.clk(clk), .reset(reset), .sw_speed(sw_speed), .clk_en(clk_en));

    mode1 m1(.clk(clk), .reset(reset), .clk_en(clk_en), .led_out(led_out1));
    mode2 m2(.clk(clk), .reset(reset), .clk_en(clk_en), .led_out(led_out2));
    mode3 m3(.clk(clk), .reset(reset), .clk_en(clk_en), .led_out(led_out3));
    mode4 m4(.clk(clk), .reset(reset), .clk_en(clk_en), .led_out(led_out4));

    led_blink bl(.clk(clk), .reset(reset), .clk_en(clk_en), .led_out(led_out_blink));

    always @(*) begin
        if (sw_test_manual) led_out <= led_out_blink;
        else begin
            case (sw_mode)
                2'b00: led_out <= led_out1;
                2'b01: led_out <= led_out2;
                2'b10: led_out <= led_out3;
                2'b11: led_out <= led_out4;
                default: led_out <= 12'b0000_0000_000;
            endcase
        end
    end
endmodule