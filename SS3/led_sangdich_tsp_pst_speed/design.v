module led_sangdich_tsp_pst_speed(
    input clk, speed, reset, mode, ss,
    output reg [7:0] led
);
    reg [5:0] count = 0;
    always @(posedge clk) begin
        if (reset) begin
            count <= 0;
            led <= 8'b1000_0000;
        end

        else if (ss) begin
            led <= led;
            count <= count;
        end

        else begin
            // 5MHZ
            if (speed) begin
                if (count >= 9) begin
                    count <= 0;
                    // Dịch từ phải sang trái
                    if (mode) led <= {led[6:0], led[7]};
                    // Dịch từ trái sang phải
                    else led <= {led[0], led[7:1]};

                end
                else count <= count + 1;
            end
            // 1MHZ
            else begin
                if (count >= 49)  begin
                    count <= 0;
                    
                    // Dịch từ phải sang trái
                    if (mode) led <= {led[6:0], led[7]};
                    // Dịch từ trái sang phải
                    else led <= {led[0], led[7:1]};
                end
                else count <= count + 1;
            end
        end
    end
endmodule
