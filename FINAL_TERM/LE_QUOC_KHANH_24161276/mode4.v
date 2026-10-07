module mode_4 #(parameter X = 12, parameter Y = 7)(
    input clk50M, reset, clk_en,
    output reg [X-1:0] led_out,
    output reg [Y-1:0] count_out
);

    always @(posedge clk50M or posedge reset) begin
        if (reset) begin
            led_out <= 0;
            count_out <= 0;
        end
        else if (clk_en) begin
            if (led_out == 0 || led_out == {X{1'b1}})
                led_out <= 1'b1;
            else
                led_out <= {led_out[X-2:0], 1'b1};
        end
    end
endmodule