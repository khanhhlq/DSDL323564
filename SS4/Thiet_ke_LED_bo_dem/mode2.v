module mode2(
    input clk50M, reset, clk_en,
    output reg [7:0] led,
    output reg [6:0] count
);
    always @(posedge clk50M) begin
        if (reset) begin
            led <= 0;
            count <= 0;
        end
        else if (clk_en) begin
            if (led == 8'b0000_0000) led <= 8'b0001_1000;
            else if (led == 8'b1000_0001) led <= 8'b0001_1000;
            else begin
                led[7:4] <= led[7:4] << 1;
                led[3:0] <= led[3:0] >> 1;
            end

            if (count <= 15 || count > 30) count <= 30;
            else count <= count - 1;
        end
    end
endmodule