module mode4(
    input clk, reset, clk_en,
    output reg [9:0] led_out
);
    always @(posedge clk ) begin
        if (reset) led_out <= 10'b0000_00_0000;
        else begin
            if (clk_en) begin   
                if (led_out == 10'b0000_00_0000 || led_out == 10'b0000_11_0000) 
                    led_out <= 10'b1000_00_0001;
                else begin
                    led_out[9:5] <= led_out[9:5] >> 1;
                    led_out[4:0] <= led_out[4:0] << 1;
                end
            end
        end
    end
endmodule