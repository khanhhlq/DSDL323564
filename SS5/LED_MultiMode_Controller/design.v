module LED_MultiMode_Controller(
    input clk, reset, 
    input  sw_test_manual, 
    input [1:0]sw_manual,
    input sw_clk,
    output reg [7:0] count_out,
    output reg [7:0] led_out
);
    wire sw_clk_en;

    wire en_mode1, en_mode2, en_mode3, en_mode4, en_test;

    assign en_test = sw_test_manual;

    assign en_mode1 = ~sw_test_manual && (sw_manual == 2'b00);
    assign en_mode2 = ~sw_test_manual && (sw_manual == 2'b01);
    assign en_mode3 = ~sw_test_manual && (sw_manual == 2'b10);
    assign en_mode4 = ~sw_test_manual && (sw_manual == 2'b11);

    wire [7:0] led_out_1, led_out_2, led_out_3, led_out_4, led_out_test;
    wire [7:0] count_out_1, count_out_2, count_out_3, count_out_4, count_out_test;

    divide_clock M0(.clk(clk), .reset(reset), .sw_clk(sw_clk), .sw_clk_en(sw_clk_en));

    mode_1 M1(.clk(clk), .reset(reset), .sw_clk_en(sw_clk_en & en_mode1), .count_out(count_out_1), .led_out(led_out_1));
    mode_2 M2(.clk(clk), .reset(reset), .sw_clk_en(sw_clk_en & en_mode2), .count_out(count_out_2), .led_out(led_out_2));
    mode_3 M3(.clk(clk), .reset(reset), .sw_clk_en(sw_clk_en & en_mode3), .count_out(count_out_3), .led_out(led_out_3));
    mode_4 M4(.clk(clk), .reset(reset), .sw_clk_en(sw_clk_en & en_mode4), .count_out(count_out_4), .led_out(led_out_4));

    led_blink TEST(.clk(clk), .reset(reset), .sw_clk_en(sw_clk_en & en_test), .count_out(count_out_test), .led_out(led_out_test));

    always @(*) begin
        if (sw_test_manual) begin
            led_out = led_out_test;
            count_out = count_out_test;
        end

        else 
            case (sw_manual)
                2'b00: begin
                    led_out = led_out_1;
                    count_out = count_out_1;
                end
                2'b01: begin
                    led_out = led_out_2;
                    count_out = count_out_2;
                end
                2'b10: begin
                    led_out = led_out_3;
                    count_out = count_out_3;
                end
                2'b11: begin
                    led_out = led_out_4;
                    count_out = count_out_4;
                end
                default: begin
                    led_out = 8'b0000_0000;
                    count_out = 0;
                end
            endcase
    end
endmodule