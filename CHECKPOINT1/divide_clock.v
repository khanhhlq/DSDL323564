// sw_speed = 0 : 1MHz
// sw_speed = 1: 5Mhz

module divide_clock(
    input clk, reset, sw_speed,
    output reg clk_en
);
    reg [5:0] count = 0;

    always @(posedge clk) begin
        if (reset) begin
            count <= 0;
            clk_en <= 0;
        end
        else begin
            clk_en <= 0;

            if (sw_speed) begin
                if (count == 9) begin
                    count <= 0;
                    clk_en <= 1;
                end
                else count <= count + 1;
            end
            else begin
                if (count == 49) begin
                    count <= 0;
                    clk_en <= 1;
                end
                else count <= count + 1;
            end
        end
    end
endmodule