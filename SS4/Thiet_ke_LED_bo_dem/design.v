module thiet_ke_led_bo_dem(
    input clk50M, reset, speed, 
    input [1:0] mode,
    output reg [7:0] led, 
    output reg [6:0] count
);
    wire clk_en;

    wire [7:0] led1, led2, led3, led4;
    wire [6:0] count1, count2, count3, count4;

    chia_clock M0(
        .clk50M(clk50M),
        .reset(reset),
        .speed(speed),
        .clk_en(clk_en)
    );

    mode1 M1(
        .clk50M(clk50M),
        .reset(reset),
        .clk_en(clk_en && mode == 2'b00),
        .led(led1),
        .count(count1)
    );

    mode2 M2(
        .clk50M(clk50M),
        .reset(reset),
        .clk_en(clk_en && mode == 2'b01),
        .led(led2),
        .count(count2)
    );

    mode3 M3(
        .clk50M(clk50M),
        .reset(reset),
        .clk_en(clk_en && mode == 2'b10),
        .led(led3),
        .count(count3)
    );

    mode4 M4(
        .clk50M(clk50M),
        .reset(reset),
        .clk_en(clk_en && mode == 2'b11),
        .led(led4),
        .count(count4)
    );

    always @(*) begin
        case (mode)
            2'b00: begin
                led = led1;
                count = count1;
            end
            2'b01: begin
                led = led2;
                count = count2;
            end
            2'b10: begin
                led = led3;
                count = count3;
            end
            2'b11: begin
                led = led4;
                count = count4;
            end
        endcase
    end

endmodule