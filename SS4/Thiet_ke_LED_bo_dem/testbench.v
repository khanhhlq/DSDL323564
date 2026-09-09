module thiet_ke_led_bo_dem_tb;

    reg clk50M = 0, reset, speed;
    reg [1:0] mode;
    wire [7:0] led;
    wire [6:0] count;

    thiet_ke_led_bo_dem uut(
        .clk50M(clk50M),
        .reset(reset),
        .speed(speed),
        .mode(mode),
        .led(led),
        .count(count)
    );

    always #10 clk50M = ~clk50M;

    initial begin
        reset = 1;
        speed = 1;
        mode = 2'b00;
        #40;

        reset = 0;
        #4000;

        reset = 1;
        mode = 2'b01;
        #40;
        reset = 0;
        #4000;

        reset = 1;
        mode = 2'b10;
        #40;
        reset = 0;
        #2500;

        reset = 1;
        mode = 2'b11;
        #40;
        reset = 0;
        #1500;


        reset = 1;
        speed = 0;
        mode = 2'b00;
        #40;

        reset = 0;
        #20000;

        reset = 1;
        mode = 2'b01;
        #40;
        reset = 0;
        #20000;

        reset = 1;
        mode = 2'b10;
        #40;
        reset = 0;
        #10000;

        reset = 1;
        mode = 2'b11;
        #40;
        reset = 0;
        #6000;

        $finish;
    end

endmodule