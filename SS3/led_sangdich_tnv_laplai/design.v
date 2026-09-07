module led_sangdich_tnv_laplai(
    input clk, reset,
    output reg [7:0] led
);

    always @(posedge clk) begin
        if (reset) led <= 8'b0000_0000;
        else if (led == 8'b0000_0000) led <= 8'b1000_0001;
        else begin
            led[7:4] <= led[7:4] >> 1;
            led[3:0] <= led[3:0] << 1;
        end
    end
endmodule