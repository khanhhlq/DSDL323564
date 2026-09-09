module mode4(
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
            count <= 99;

            if (led == 8'b0000_0000)
                led <= 8'b0001_1000;
            else if (led == 8'b1111_1111)
                led <= 8'b0000_0000;
            else begin
                led[7:4] <= {led[6:4], 1'b1};
                led[3:0] <= {1'b1, led[3:1]};
            end
        end
    end
endmodule