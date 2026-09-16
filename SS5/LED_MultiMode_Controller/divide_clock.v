module divide_clock(
    input clk, reset, sw_clk,
    output reg sw_clk_en
);
    reg [4:0] count_div = 0;

    always @(posedge clk) begin
        if (reset) begin
            count_div <= 0;
            sw_clk_en <= 0;
        end
        else begin
            sw_clk_en <= 0;
            if (sw_clk) begin
                if (count_div >= 24) begin
                    count_div <= 0;
                    sw_clk_en <= 1;
                end
                else count_div <= count_div + 1;
            end
            else begin
                if (count_div >= 9) begin
                    count_div <= 0;
                    sw_clk_en <= 1;
                end
                else count_div <= count_div + 1;
            end
        end
    end
endmodule