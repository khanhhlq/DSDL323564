module tb_final_term;
    parameter X = 12, Y = 7, Z = 76;

    localparam T_RESET = 100;
    localparam T_1M = 1000;
    localparam T_5M = 200;

    localparam TEST_1M = 5*T_1M;
    localparam TEST_5M = 5*T_5M;

    // Mode 1: can them 1 chu ky de hien du LED cuoi
    localparam MODE1_1M = (X+1)*T_1M;
    localparam MODE1_5M = (X+1)*T_5M;

    // Mode 2: 0 -> Z, sau do dung
    localparam MODE2_1M = (Z+1)*T_1M;
    localparam MODE2_5M = (Z+1)*T_5M;

    // Mode 3: nap Z -> ... -> 0, sau do dung
    localparam MODE3_1M = (Z+2)*T_1M;
    localparam MODE3_5M = (Z+2)*T_5M;

    // Mode 4: dung X chu ky, tranh quay lai LED dau
    localparam MODE4_1M = X*T_1M;
    localparam MODE4_5M = X*T_5M;

    // Test chuyen mode
    localparam MODE2_TO_4 = X*T_1M;
    localparam MODE3_TO_4 = X*T_1M;
    localparam MODE4_TRANS_1M = X*T_1M;


    reg clk50M, reset, speed, sw_test_manual;
    reg [1:0] sw_mode;

    wire [X-1:0] led_out;
    wire [Y-1:0] count_out;


    final_term #(.X(X), .Y(Y), .Z(Z))
        DUT (.clk50M(clk50M), .reset(reset), .speed(speed),
             .sw_test_manual(sw_test_manual), .sw_mode(sw_mode),
             .led_out(led_out), .count_out(count_out));


    always #10 clk50M = ~clk50M;


    task RESET_DUT;
    begin
        reset = 1;
        #T_RESET;
        reset = 0;
    end
    endtask


    initial begin
        clk50M = 0; speed = 1;
        sw_test_manual = 0; sw_mode = 2'b00;
        reset = 0;

        RESET_DUT;


        // ===============================================
        // 1 MHz
        // ===============================================

        sw_test_manual = 1;
        speed = 1;
        #TEST_1M;
        RESET_DUT;

        sw_test_manual = 0;

        sw_mode = 2'b00;
        #MODE1_1M;
        RESET_DUT;

        sw_mode = 2'b01;
        #MODE2_1M;
        RESET_DUT;

        sw_mode = 2'b10;
        #MODE3_1M;
        RESET_DUT;

        sw_mode = 2'b11;
        #MODE4_1M;
        RESET_DUT;


        // ===============================================
        // 5 MHz
        // ===============================================

        sw_test_manual = 1;
        speed = 0;
        #TEST_5M;
        RESET_DUT;

        sw_test_manual = 0;

        sw_mode = 2'b00;
        #MODE1_5M;
        RESET_DUT;

        sw_mode = 2'b01;
        #MODE2_5M;
        RESET_DUT;

        sw_mode = 2'b10;
        #MODE3_5M;
        RESET_DUT;

        sw_mode = 2'b11;
        #MODE4_5M;
        RESET_DUT;


        // ===============================================
        // MODE 2 -> MODE 4
        // ===============================================

        speed = 1;
        sw_test_manual = 0;

        sw_mode = 2'b01;
        #MODE2_TO_4;

        sw_mode = 2'b11;
        #MODE4_TRANS_1M;

        RESET_DUT;


        // ===============================================
        // MODE 3 -> MODE 4
        // ===============================================

        sw_mode = 2'b10;
        #MODE3_TO_4;

        sw_mode = 2'b11;
        #MODE4_TRANS_1M;

        RESET_DUT;

        $finish;
    end

endmodule