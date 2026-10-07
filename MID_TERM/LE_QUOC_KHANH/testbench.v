module led_controller_tb;
    reg clk, reset, sw_test_manual, sw_speed;
    reg [1:0] sw_mode;
    wire [11:0] led_out;

    led_controller uut (.clk(clk),.reset(reset), .sw_test_manual(sw_test_manual), .sw_speed(sw_speed), .sw_mode(sw_mode), .led_out(led_out));

    initial clk = 0;
    always #10 clk = ~clk;

    task rst;
    begin
        reset = 1;
        #40;
        reset = 0;
    end
    endtask

    task test_mode;
        input test_manual;
        input [1:0] mode;
        input integer time_run;
    begin
        sw_test_manual = test_manual;
        sw_mode = mode;
        #(time_run);
        rst;
    end
    endtask

    initial begin
        reset = 1; 
        sw_test_manual = 0; sw_speed = 1; sw_mode = 0;
        #40; reset = 0;

        // 5 MHz
        sw_speed = 1;

        test_mode(1, 2'b00, 2600); // Blink
        test_mode(0, 2'b00, 2600); // Mode 1
        test_mode(0, 2'b01, 2600); // Mode 2
        test_mode(0, 2'b10, 1400); // Mode 3
        test_mode(0, 2'b11, 1400); // Mode 4

        // 1 MHz
        sw_speed = 0;

        test_mode(1, 2'b00, 13000); // Blink
        test_mode(0, 2'b00, 13000); // Mode 1
        test_mode(0, 2'b01, 13000); // Mode 2
        test_mode(0, 2'b10, 7000);  // Mode 3
        test_mode(0, 2'b11, 7000);  // Mode 4

        $finish;
    end
endmodule