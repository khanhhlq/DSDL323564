module led_sangdich_tnv_speed(
    input clk, speed, reset, ss,
    output reg [7:0] led
);
    reg [5:0] count = 0;
    always @(posedge clk) begin
        if (reset) begin
            led <= 8'b0000_0000;
            count <= 0;
        end
        else if (ss) begin
            led <= led;
            count <= count;
        end
        else begin
            if (speed) begin
                if (count >= 9) begin
                    count <= 0;
                    if (led == 8'b0000_0000) led <= 8'b1000_0001;
                    else begin
                        led[7:4] <= led[7:4] >> 1;
                        led[3:0] <= led[3:0] << 1;
                    end
                end
                else count <= count + 1;
            end
            else begin
                if (count >= 49) begin
                    count <= 0;
                    if (led == 8'b0000_0000) led <= 8'b1000_0001;
                    else begin
                        led[7:4] <= led[7:4] >> 1;
                        led[3:0] <= led[3:0] << 1;
                    end
                end
                else count <= count + 1;
            end
        end
    end
endmodule