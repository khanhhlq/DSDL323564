module DEM_8bit_tb;
    reg clk, speed, reset, UD, SS;
    wire [7:0] out;

    DEM_8bit uut (.clk(clk), .speed(speed), .reset(reset), .UD(UD), .SS(SS), .out(out));

    initial begin
        clk = 0;
        forever #10 clk = ~clk;
    end

    initial begin
        // Initial
        reset = 1; speed = 0; UD = 1; SS = 0;
        #40;
        reset = 0;
        
        // Test 1: Up counting (5MHz)
        SS = 1; UD = 1; speed = 0;
        #2000;

        // Test 2: Stop counting
        SS = 0;
        #500;

        // Test 3: Down counting (5MHz)
        UD = 0; SS = 1;
        #2000;

        // Test 4: Up couting (1MHz)
        speed = 1; UD = 1;
        #6000;
        $finish;
    end

endmodule