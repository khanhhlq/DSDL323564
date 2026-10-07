module mode_3 #(parameter X = 12, parameter Y = 7, parameter Z = 76)(
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
            if (led_out == 0) begin
                led_out <= 1'b1 << (X-1);
                count_out <= Z;
            end
            else if (count_out > 0) begin
                if (led_out == {X{1'b1}})
                    led_out <= 1'b1 << (X-1);
                else
                    led_out <= {1'b1, led_out[X-1:1]};

                count_out <= count_out - 1;
            end
            else begin
                led_out <= led_out;
                count_out <= 0;
            end
        end
    end
endmodule