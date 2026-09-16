module LED_MultiMode_Controller_tb;
    reg clk, reset;
    reg sw_test_manual;
    reg [1:0] sw_manual;
    reg sw_clk;

    wire [7:0] count_out;
    wire [7:0] led_out;

    LED_MultiMode_Controller uut (
        .clk(clk),
        .reset(reset),
        .sw_test_manual(sw_test_manual),
        .sw_manual(sw_manual),
        .sw_clk(sw_clk),
        .count_out(count_out),
        .led_out(led_out)
    );

    always #10 clk = ~clk;

    initial begin
        clk = 0; reset = 1; sw_test_manual = 1; sw_manual = 2'b00; sw_clk = 0;
        #40;
        reset = 0;

        // 5MHZ
        // LED chớp tắt và count_out = 88
        sw_test_manual = 1; #2000;

        // MODE 1: LED sáng dần trái -> phải và count 0 -> 99
        reset = 1; #40;
        sw_test_manual = 0; sw_manual = 2'b00;
        reset = 0; #25000;

        // MODE 2: LED sáng dần phải -> trái và count 99 -> 0
        reset = 1; #40;
        sw_manual = 2'b01;
        reset = 0; #25000;

        // MODE 3: LED trong -> ngoài và count_out ngừng
        reset = 1; #40;
        sw_manual = 2'b10;
        reset = 0; #6000;

        // MODE 4: LED ngoài -> trong và count_out = 00
        reset = 1; #40;
        sw_manual = 2'b11;
        reset = 0; #6000;
        
        // ----------------------------------------------- //
        
        reset = 1; #40;
        sw_clk = 1;
        reset = 0;
        
        // 2MHZ
        // LED chớp tắt và count_out = 88
        sw_test_manual = 1; #2000;

        // MODE 1: LED sáng dần trái -> phải và count 0 -> 99
        reset = 1; #40;
        sw_test_manual = 0; sw_manual = 2'b00;
        reset = 0; #60000;

        // MODE 2: LED sáng dần phải -> trái và count 99 -> 0
        reset = 1; #40;
        sw_manual = 2'b01;
        reset = 0; #60000;

        // MODE 3: LED trong -> ngoài và count_out ngừng
        reset = 1; #40;
        sw_manual = 2'b10;
        reset = 0; #15000;

        // MODE 4: LED ngoài -> trong và count_out = 00
        reset = 1; #40;
        sw_manual = 2'b11;
        reset = 0; #15000;
        $finish;
    end
endmodule