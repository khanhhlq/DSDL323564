module chia_clock(
    input clk50M, reset, speed,
    output reg clk_en
);
    reg [5:0] count_div = 0;

    always @(posedge clk50M) begin
        if (reset) begin
            count_div <= 0;
            clk_en <= 0;
        end
        else begin
            clk_en <= 0;

            if (speed) begin
                if (count_div >= 9) begin
                    count_div <= 0;
                    clk_en <= 1;
                end
                else count_div <= count_div + 1;
            end
            else begin
                if (count_div >= 49) begin
                    count_div <= 0;
                    clk_en <= 1;
                end
                else count_div <= count_div + 1;
            end
        end
    end
endmodule