module mode3(
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
            if (led == 8'b0000_0000)
                led <= 8'b1000_0000;
            else if (led == 8'b1111_1111)
                led <= 8'b0000_0000;
            else led <= {1'b1, led[7:1]};
        end
    end

endmodule