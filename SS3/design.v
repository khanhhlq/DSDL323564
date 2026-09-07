module led_sangdich_tsp_laplai(input clk, reset, output reg [7:0] led);
    always @(posedge clk)
        if (reset)
            led <= 8'b0000_0000;
        else
            if (led == 8'b0000_0000)
                led <= 8'b1000_0000;
            else 
                led <= led >> 1;
endmodule