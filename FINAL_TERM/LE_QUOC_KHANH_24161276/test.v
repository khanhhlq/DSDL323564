module test #(parameter X = 12, parameter Y = 7, parameter Z = 76)(
    input clk50M, reset, clk_en,
    output reg [X-1:0] led_out,
    output reg [Y-1:0] count_out
);

    always @(posedge clk50M or posedge reset) begin
        if (reset) begin
            led_out <= 0;
            count_out <= 0;
        end
        else begin
            count_out <= Z;
            if (clk_en)
                led_out <= ~led_out;
        end
    end
endmodule