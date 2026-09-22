module mode2(
    input clk, reset, clk_en,
    output reg [9:0] led_out
);
    always @(posedge clk ) begin
        if (reset) led_out <= 10'b0000_0000_00;
        else begin
            if (clk_en) begin   
                if (led_out == 10'b0000_0000_00 || led_out == 10'b1000_0000_00) 
                    led_out <= 10'b0000_0000_01;
                else led_out <= led_out << 1;
            end
        end
    end
endmodule