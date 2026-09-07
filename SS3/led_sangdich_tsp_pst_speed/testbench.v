module led_sangdich_tsp_pst_speed_tb;

    reg clk, speed, reset, mode, ss;
    wire [7:0] led;

    led_sangdich_tsp_pst_speed uut (
        .clk(clk),
        .speed(speed),
        .reset(reset),
        .mode(mode),
        .ss(ss),
        .led(led)
    );

    // CLK = 50 MHz
    // T = 20 ns
    always #10 clk = ~clk;

    initial begin
        // Khởi tạo
        clk   = 0;
        reset = 1;
        speed = 1;
        mode  = 0;
        ss    = 0;

        // Reset
        #40;
        reset = 0;

        // speed = 1 -> 5 MHz
        // mode = 0
        #1000;

        // Đổi chiều
        mode = 1;
        #1000;

        // Dừng LED
        ss = 1;
        #500;

        // Cho chạy lại
        ss = 0;
        #1000;

        // speed = 0 -> 1 MHz
        speed = 0;
        mode = 0;
        #5000;

        // Đổi chiều
        mode = 1;
        #5000;

        $finish;
    end

endmodule