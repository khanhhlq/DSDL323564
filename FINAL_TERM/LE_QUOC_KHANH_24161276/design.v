module final_term #(parameter X = 12, parameter Y = 7, parameter Z = 76)(
    input clk50M, reset, speed,
    input sw_test_manual, 
    input [1:0] sw_mode,
    output reg [X-1:0] led_out,
    output reg [Y-1:0] count_out
);
    reg [Y-1:0] count_hold;

    wire clk_en;
    wire [X-1:0] led_1, led_2, led_3, led_4, led_test;
    wire [Y-1:0] count_out_1, count_out_2, count_out_3, count_out_4, count_out_test;
    wire clk_en_1, clk_en_2, clk_en_3, clk_en_4, clk_en_test;

    assign clk_en_test  = clk_en & sw_test_manual;
    assign clk_en_1 = clk_en & ~sw_test_manual & (sw_mode == 2'b00);
    assign clk_en_2 = clk_en & ~sw_test_manual & (sw_mode == 2'b01);
    assign clk_en_3 = clk_en & ~sw_test_manual & (sw_mode == 2'b10);
    assign clk_en_4 = clk_en & ~sw_test_manual & (sw_mode == 2'b11);

    divide_clock dc (.clk50M(clk50M), .reset(reset), .speed(speed), .clk_en(clk_en)); 
    test #(.X(X), .Y(Y), .Z(Z)) 
        t (.clk50M(clk50M), .reset(reset), .clk_en(clk_en_test), .led_out(led_test), .count_out(count_out_test)); 
    mode_1 #(.X(X), .Y(Y)) 
        m1(.clk50M(clk50M), .reset(reset), .clk_en(clk_en_1), .led_out(led_1), .count_out(count_out_1));
    mode_2 #(.X(X), .Y(Y), .Z(Z)) 
        m2 (.clk50M(clk50M), .reset(reset), .clk_en(clk_en_2), .led_out(led_2), .count_out(count_out_2));
    mode_3 #(.X(X), .Y(Y), .Z(Z)) 
        m3 (.clk50M(clk50M), .reset(reset), .clk_en(clk_en_3), .led_out(led_3), .count_out(count_out_3));
    mode_4 #(.X(X), .Y(Y)) 
        m4 (.clk50M(clk50M), .reset(reset), .clk_en(clk_en_4), .led_out(led_4), .count_out(count_out_4));   
    
    always @(posedge clk50M or posedge reset) begin
        if (reset) count_hold <= 0;
        else if (sw_test_manual) count_hold <= Z;
        else begin
            case (sw_mode)
                2'b00: count_hold <= 0;
                2'b01: begin
                    if (clk_en_2) begin
                        if (count_out_2 < Z)
                            count_hold <= count_out_2 + 1;
                        else
                            count_hold <= Z;
                    end
                    else
                        count_hold <= count_out_2;
                end
                2'b10: begin
                    if (clk_en_3) begin
                        if (led_3 == 0)
                            count_hold <= Z;
                        else if (count_out_3 > 0)
                            count_hold <= count_out_3 - 1;
                        else
                            count_hold <= 0;
                    end
                    else
                        count_hold <= count_out_3;
                end
                2'b11: count_hold <= count_hold;
            endcase
        end
    end

    always @(*) begin
        if (sw_test_manual) begin
            led_out = led_test;
            count_out = count_out_test;
        end
        else begin
            case (sw_mode)
                2'b00: begin
                    led_out = led_1;
                    count_out = count_out_1;
                end 
                2'b01: begin
                    led_out = led_2;
                    count_out = count_out_2;
                end 
                2'b10: begin
                    led_out = led_3;
                    count_out = count_out_3;
                end 
                2'b11: begin
                    led_out = led_4;
                    count_out = count_hold;
                end 
                default: begin
                    led_out = 0;
                    count_out = 0;
                end
            endcase
        end
    end
endmodule