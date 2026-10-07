module divide_clock(
    input clk50M, reset, speed,
    output reg clk_en
);
    reg [5:0] count_1m = 0;
    reg [3:0] count_5m = 0;   

    always @(posedge clk50M or posedge reset) begin
        if (reset) begin
            clk_en <= 0;
            count_1m <= 0;
            count_5m <= 0;
        end
        else begin
            clk_en <= 0;
            if (speed) begin
                count_5m <= 0;
                if (count_1m >= 49) begin
                    count_1m <= 0;
                    clk_en <= 1;
                end
                else count_1m <= count_1m + 1;
            end
            else begin
                count_1m <= 0;
                if (count_5m >= 9) begin
                    count_5m <= 0;
                    clk_en <= 1;
                end
                else count_5m <= count_5m + 1;
            end
        end
    end
endmodule