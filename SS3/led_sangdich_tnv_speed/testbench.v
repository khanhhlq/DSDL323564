module led_sangdich_tnv_speed_tb;
    // Với speed = 1 là 5MHZ v à speed = 0 là 1MHZ
    reg clk = 0, speed, reset, ss;
    wire [7:0] led;

    led_sangdich_tnv_speed uut(.clk(clk), .speed(speed), .reset(reset), .ss(ss), .led(led));

    always #10 clk = ~clk;

    initial begin
        reset = 1;
        ss = 1;
        speed = 1;
        #20;

        reset = 0;
        ss = 0;
        #1200;

        reset = 1;
        ss = 1;
        #20;

        reset = 0;
        ss = 0;
        speed = 0;
        #5000;
        $finish;
    end
endmodule