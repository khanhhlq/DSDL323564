module mode_2 #(parameter X = 12, parameter Y = 7, parameter Z = 76)(
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
            if (count_out < Z) begin
                if (led_out == 0 || led_out == (1'b1 << (X-1)))
                    led_out <= 1'b1;
                else
                    led_out <= led_out << 1;

                count_out <= count_out + 1;
            end
            else begin
                led_out <= led_out;
                count_out <= Z;
            end
        end
    end
endmodule